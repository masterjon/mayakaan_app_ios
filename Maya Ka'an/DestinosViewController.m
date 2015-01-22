//
//  DestinosViewController.m
//  Maya Ka'an
//
//  Created by Alberto Enriquez on 29/12/14.
//  Copyright (c) 2014 Punk E-Marketing & Consulting. All rights reserved.
//

#import "DestinosViewController.h"
#import "DestinoViewController.h"

@interface DestinosViewController ()
    @property (strong, nonatomic) NSURLSession *session;
    @property (strong,nonatomic) NSURLSessionConfiguration *sessionConfiguration;
@end

@implementation DestinosViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.destinosItems = [[NSMutableArray alloc] init];
    NSURL *url = [NSURL URLWithString:@"http://mayakaan.travel/mayakaan_api/api/v1/destinos/?format=json"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    self.sessionConfiguration=[NSURLSessionConfiguration defaultSessionConfiguration];
    self.session=[NSURLSession sessionWithConfiguration:self.sessionConfiguration];
    NSURLSessionDataTask * task = [self.session dataTaskWithRequest:request  completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSHTTPURLResponse *urlResponse = (NSHTTPURLResponse *)response;
        if(urlResponse.statusCode==200){
            NSLog(@"It Came to 200 status");
            
            
            [self handleResults:data];
        }
    }];
    [task resume];
    // Do any additional setup after loading the view.
}
- (void) handleResults:(NSData *)data{
    
    NSError *jsonError;
    NSDictionary *response= [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&jsonError];
    if (response){
        
        NSLog(@"%@",response[@"destinos"]);

        
        for (NSDictionary *dataDictionary in response[@"destinos"]){

            [self.destinosItems addObject:dataDictionary];
            NSLog(@"%@",dataDictionary[@"nombre"]);
        }
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.DestinosCollection reloadData];
        });
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.destinosItems  count];

}
-(UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"destinoCell" forIndexPath:indexPath];
    UIImageView *imageView = (UIImageView *) [cell viewWithTag:10];
    UILabel *label = (UILabel *) [cell viewWithTag:11];
    
    if ([self.destinosItems count] > 0){
        NSDictionary *cellDictionary = [self.destinosItems objectAtIndex:indexPath.row];
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
    DestinoViewController *View = [[DestinoViewController alloc] init];
    View = [segue destinationViewController];
    NSArray *arrayOfIndexPaths = [self.DestinosCollection indexPathsForSelectedItems];
    NSIndexPath *path = [arrayOfIndexPaths firstObject];
    NSDictionary *destinoDictionary = [self.destinosItems objectAtIndex:path.row];
    View.tituloDestino = destinoDictionary[@"nombre"];
    View.descriptionDestino = destinoDictionary[@"des_cripcion"];
    View.imagenDestino = destinoDictionary[@"img_destino"];
    View.actividadesDestino = destinoDictionary[@"actividades"];
    View.ubicacionDestino = destinoDictionary[@"ubicacion"];
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
