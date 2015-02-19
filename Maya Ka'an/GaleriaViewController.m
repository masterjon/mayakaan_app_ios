//
//  GaleriaViewController.m
//  Maya Ka'an
//
//  Created by Alberto Enriquez on 15/01/15.
//  Copyright (c) 2015 Punk E-Marketing & Consulting. All rights reserved.
//

#import "GaleriaViewController.h"
#import "GaleriaDetalleViewController.h"
#import "MBProgressHUD.h"
@interface GaleriaViewController ()
@property (strong, nonatomic) NSURLSession *session;
@property (strong,nonatomic) NSURLSessionConfiguration *sessionConfiguration;

@end

@implementation GaleriaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *viewTitle = [[UILabel alloc] init];
    viewTitle.textColor = [UIColor whiteColor];
    viewTitle.text=NSLocalizedString(@"Galería", nil);
    self.navigationItem.titleView=viewTitle;
    [viewTitle sizeToFit];

    self.galeriaItems = [[NSMutableArray alloc] init];
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Error"
                                                      message:NSLocalizedString(@"Necesitas activar tu conexión a internet.",nil)
                                                     delegate:self
                                            cancelButtonTitle:@"OK"
                                            otherButtonTitles:nil];
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
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
        else{
            [message show];
                    }
    }];
    [task resume];
    // Do any additional setup after loading the view.
}
- (void)alertView:(UIAlertView *)alertView
clickedButtonAtIndex:(NSInteger)buttonIndex{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}
- (void) handleResults:(NSData *)data{

    //la respuesta viene serializada en json por lo tanto lo tenemos que deserializar
    NSError *jsonError;
    NSDictionary *response= [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&jsonError];
    if (response){
        for (NSDictionary *dataDictionary in response[@"galeria"]){
            
            [self.galeriaItems addObject:dataDictionary];
        }
       
            dispatch_async(dispatch_get_main_queue(), ^{
             [MBProgressHUD hideHUDForView:self.view animated:YES];
            
            [self.galeriaCollection reloadData];
        });
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
        imageView.image = [UIImage imageNamed:@"fondofotos"];

        
        NSURLSessionDataTask *task = [self.session dataTaskWithRequest:imageUrlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            NSHTTPURLResponse *urlResponse = (NSHTTPURLResponse *)response;
            if(urlResponse.statusCode==200){
                dispatch_async(dispatch_get_main_queue(), ^{
                    imageView.image=[UIImage imageWithData:data];
                 
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
    GaleriaDetalleViewController *View = [[GaleriaDetalleViewController alloc] init];
    View = [segue destinationViewController];
    NSArray *arrayOfIndexPaths = [self.galeriaCollection indexPathsForSelectedItems];
    NSIndexPath *path = [arrayOfIndexPaths firstObject];
    NSDictionary *galeriaDictionary = [self.galeriaItems objectAtIndex:path.row];
    View.tituloImagen = galeriaDictionary[@"nombre"];
    View.imagenUrl = galeriaDictionary[@"img_destino"];

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
        return CGSizeMake(300.f, 196.f);
    }
    
    //Size of cells for iphones
    return CGSizeMake(155.f,104.f);
    
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
