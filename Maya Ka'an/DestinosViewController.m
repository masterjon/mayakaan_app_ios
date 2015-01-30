//
//  DestinosViewController.m
//  Maya Ka'an
//
//  Created by Alberto Enriquez on 29/12/14.
//  Copyright (c) 2014 Punk E-Marketing & Consulting. All rights reserved.
//

#import "DestinosViewController.h"
#import "DestinoViewController.h"
#import "MBProgressHUD.h"
@interface DestinosViewController ()
    @property (strong, nonatomic) NSURLSession *session;
    @property (strong,nonatomic) NSURLSessionConfiguration *sessionConfiguration;
@end

@implementation DestinosViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString * language = [[NSLocale preferredLanguages] objectAtIndex:0];
    NSLog(@"%@",language);
    self.destinosItems = [[NSMutableArray alloc] init];
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Error"
                                                      message:NSLocalizedString(@"Necesitas activar tu conexión a internet.",nil)
                                                     delegate:self
                                            cancelButtonTitle:@"OK"
                                            otherButtonTitles:nil];
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
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
        else{

            [message show];

        }
    }];
    [task resume];
    // Do any additional setup after loading the view.
}
- (void) handleResults:(NSData *)data{
    
    NSError *jsonError;
    NSDictionary *response= [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&jsonError];
    if (response){
        
        //NSLog(@"%@",response[@"destinos"]);

        
        for (NSDictionary *dataDictionary in response[@"destinos"]){

            [self.destinosItems addObject:dataDictionary];
            //NSLog(@"%@",dataDictionary[@"nombre"]);
        }
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            [self.DestinosCollection reloadData];
        });
    }
}
- (void)alertView:(UIAlertView *)alertView
clickedButtonAtIndex:(NSInteger)buttonIndex{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
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
                //NSLog(@"Error fetching remote data");
            }
        
        
        }];
         [task resume];
    
    }
    return cell;
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    int top = 0;
    int left = 0;
    int bottom = 0;
    int right = 0;
    NSLog(@"%i",(int)screenBounds.size.width);
    switch ((int) screenBounds.size.width) {
        case 320:
            NSLog(@"--5--");
            left = 5;
            right = 5;
            break;
        case 375:
            NSLog(@"--6--");
            left = 20;
            right = 20;
            break;
        case 414:
            NSLog(@"--6+--");
            left = 30;
            right = 30;
            break;
        case 768:
            NSLog(@"--Ipad Portrait");
            left = 50;
            right = 50;
            top = 50;
            break;
        case 1024:
            NSLog(@"--Ipad Landscape");
            left = 50;
            right = 50;
            top = 50;
            break;
        default:
            break;
    }
    return UIEdgeInsetsMake(top, left, bottom, right);
}
-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSString * language = [[NSLocale preferredLanguages] objectAtIndex:0];
    NSLog(@"%@",language);
    DestinoViewController *View = [[DestinoViewController alloc] init];
    View = [segue destinationViewController];
    NSArray *arrayOfIndexPaths = [self.DestinosCollection indexPathsForSelectedItems];
    NSIndexPath *path = [arrayOfIndexPaths firstObject];
    NSDictionary *destinoDictionary = [self.destinosItems objectAtIndex:path.row];
    View.tituloDestino = destinoDictionary[@"nombre"];
    View.imagenDestino = destinoDictionary[@"img_destino"];
    
    if ([language isEqualToString:@"es-MX"] || [language isEqualToString:@"es"]) {
        View.descriptionDestino = destinoDictionary[@"des_cripcion"];
        View.actividadesDestino = destinoDictionary[@"actividades"];
        View.ubicacionDestino = destinoDictionary[@"ubicacion"];
    }
    else{
        View.descriptionDestino = destinoDictionary[@"des_cripcion_en"];
        View.actividadesDestino = destinoDictionary[@"actividades_en"];
        View.ubicacionDestino = destinoDictionary[@"ubicacion_en"];
        
    }
    
}
- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
     CGRect screenBounds = [[UIScreen mainScreen] bounds];
    // Adjust cell size for orientation
    int screenSize = (int) screenBounds.size.width;
    //Size of cells for ipad
    if(screenSize == 768 || screenSize == 1024){
         return CGSizeMake(200.f, 250.f);
    }
    
    //Size of cells for iphones
    return CGSizeMake(155.f,147.f);
  
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
