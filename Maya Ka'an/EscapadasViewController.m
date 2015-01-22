//
//  EscapadasViewController.m
//  Maya Ka'an
//
//  Created by Alberto Enriquez on 15/01/15.
//  Copyright (c) 2015 Punk E-Marketing & Consulting. All rights reserved.
//

#import "EscapadasViewController.h"
#import "EscapadaViewController.h"

@interface EscapadasViewController ()
@property (strong, nonatomic) NSURLSession *session;
@property (strong,nonatomic) NSURLSessionConfiguration *sessionConfiguration;

@end

@implementation EscapadasViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.escapadasItems = [[NSMutableArray alloc] init];
    NSURL *url = [NSURL URLWithString:@"http://mayakaan.travel/mayakaan_api/api/v1/escapadas/?format=json"];
    
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
        for (NSDictionary *dataDictionary in response[@"escapadas"]){
            
            [self.escapadasItems addObject:dataDictionary];
            NSLog(@"%@",dataDictionary[@"nombre"]);
        }
        
        //lo que consume tiempo lo manejamos en un hilo diferente de manera asincrona
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.EscapadasCollection reloadData];
        });
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.escapadasItems  count];
    
}
-(UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"escapadaCell" forIndexPath:indexPath];
    UIImageView *imageView = (UIImageView *) [cell viewWithTag:10];
    UILabel *label = (UILabel *) [cell viewWithTag:11];
    
    if ([self.escapadasItems count] > 0){
        NSDictionary *cellDictionary = [self.escapadasItems objectAtIndex:indexPath.row];
        NSString *destinoLabel = [cellDictionary objectForKey:@"nombre"];
        NSString *imageUrlString = [cellDictionary objectForKey:@"img_portada"];
        NSURL *imageUrl = [NSURL URLWithString:imageUrlString
                                 relativeToURL:[NSURL URLWithString:@"http://mayakaan.travel/mayakaan_api/media/"]];
        NSURLRequest *imageUrlRequest = [NSURLRequest requestWithURL:imageUrl];
        
        
        NSURLSessionDataTask *task = [self.session dataTaskWithRequest:imageUrlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            NSHTTPURLResponse *urlResponse = (NSHTTPURLResponse *)response;
            if(urlResponse.statusCode==200){
                dispatch_async(dispatch_get_main_queue(), ^{
                    imageView.image=[UIImage imageWithData:data];
                    label.text = [NSString stringWithFormat:@"%@",destinoLabel];
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
    EscapadaViewController *View = [[EscapadaViewController alloc] init];
    View = [segue destinationViewController];
    NSArray *arrayOfIndexPaths = [self.EscapadasCollection indexPathsForSelectedItems];
    NSIndexPath *path = [arrayOfIndexPaths firstObject];
    NSDictionary *escapdaDictionary = [self.escapadasItems objectAtIndex:path.row];
    View.tituloEscapada = escapdaDictionary[@"nombre"];
    View.descriptionEscapada = escapdaDictionary[@"des_cripcion"];
    View.imagenEscapada = escapdaDictionary[@"img_destino"];
    View.ubicacionEscapada = escapdaDictionary[@"ubicacion"];
    View.actividadesEscapada = escapdaDictionary[@"actividades"];
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
