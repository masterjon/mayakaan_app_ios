//
//  GaleriaViewController.m
//  Maya Ka'an
//
//  Created by Alberto Enriquez on 15/01/15.
//  Copyright (c) 2015 Punk E-Marketing & Consulting. All rights reserved.
//

#import "GaleriaViewController.h"
#import "GaleriaDetalleViewController.h"

@interface GaleriaViewController ()
@property (strong, nonatomic) NSURLSession *session;
@property (strong,nonatomic) NSURLSessionConfiguration *sessionConfiguration;

@end

@implementation GaleriaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.galeriaItems = [[NSMutableArray alloc] init];
    // NSURL *url = [NSURL URLWithString:@"http://mejorandoios.herokuapp.com/api/courses/all"];
    NSURL *url = [NSURL URLWithString:@"http://mayakaan.travel/mayakaan_api/api/v1/galeria/?format=json"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    self.sessionConfiguration=[NSURLSessionConfiguration defaultSessionConfiguration];
    self.session=[NSURLSession sessionWithConfiguration:self.sessionConfiguration];
    NSURLSessionDataTask * task = [self.session dataTaskWithRequest:request  completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSHTTPURLResponse *urlResponse = (NSHTTPURLResponse *)response;
        if(urlResponse.statusCode==200){
            NSLog(@"It Came to 200 status");
            
            //este metodo llena el arreglo con los datos obtenidos de nuestro request
            [self handleResults:data];
        }
    }];
    [task resume];
    // Do any additional setup after loading the view.
}
- (void) handleResults:(NSData *)data{
    //la respuesta viene serializada en json por lo tanto lo tenemos que deserializar
    NSError *jsonError;
    NSDictionary *response= [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&jsonError];
    if (response){
        //metemos en la consola de logs la respuesta
        // NSLog(@"%@",response[@"data"]);
        
        //ahora si agregamos los items al arreglo
        //for (NSDictionary *dataDictionary in response[@"data"]){
        for (NSDictionary *dataDictionary in response[@"galeria"]){
            
            [self.galeriaItems addObject:dataDictionary];
        }
        
        //lo que consume tiempo lo manejamos en un hilo diferente de manera asincrona
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.galeriaCollection reloadData];
        });
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.galeriaItems  count];
    
}
-(UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"galeriaCell" forIndexPath:indexPath];
    UIImageView *imageView = (UIImageView *) [cell viewWithTag:10];
   
    
    if ([self.galeriaItems count] > 0){
        NSDictionary *cellDictionary = [self.galeriaItems objectAtIndex:indexPath.row];
               NSString *imageUrlString = [cellDictionary objectForKey:@"img_portada"];
        NSURL *imageUrl = [NSURL URLWithString:imageUrlString
                                 relativeToURL:[NSURL URLWithString:@"http://mayakaan.travel/mayakaan_api/media/"]];
        NSURLRequest *imageUrlRequest = [NSURLRequest requestWithURL:imageUrl];
        
        
        NSURLSessionDataTask *task = [self.session dataTaskWithRequest:imageUrlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            NSHTTPURLResponse *urlResponse = (NSHTTPURLResponse *)response;
            if(urlResponse.statusCode==200){
                dispatch_async(dispatch_get_main_queue(), ^{
                    imageView.image=[UIImage imageWithData:data];
                 
                });
            }
            else{
                NSLog(@"Error fetching remote data");
            }
            
            
        }];
        [task resume];
        
    }
    return cell;
}
-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    GaleriaDetalleViewController *View = [[GaleriaDetalleViewController alloc] init];
    View = [segue destinationViewController];
    NSArray *arrayOfIndexPaths = [self.galeriaCollection indexPathsForSelectedItems];
    NSIndexPath *path = [arrayOfIndexPaths firstObject];
    NSDictionary *galeriaDictionary = [self.galeriaItems objectAtIndex:path.row];
    View.tituloImagen = galeriaDictionary[@"nombre"];
    View.imagenUrl = galeriaDictionary[@"img_destino"];

}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
