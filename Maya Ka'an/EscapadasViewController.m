//
//  EscapadasViewController.m
//  Maya Ka'an
//
//  Created by Alberto Enriquez on 15/01/15.
//  Copyright (c) 2015 Punk E-Marketing & Consulting. All rights reserved.
//

#import "EscapadasViewController.h"
#import "EscapadaViewController.h"
#import "MBProgressHUD.h"
@interface EscapadasViewController ()
@property (strong, nonatomic) NSURLSession *session;
@property (strong,nonatomic) NSURLSessionConfiguration *sessionConfiguration;

@end

@implementation EscapadasViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.escapadasItems = [[NSMutableArray alloc] init];
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Error"
                                                      message:NSLocalizedString(@"Necesitas activar tu conexión a internet.",nil)
                                                     delegate:self
                                            cancelButtonTitle:@"OK"
                                            otherButtonTitles:nil];
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    NSURL *url = [NSURL URLWithString:@"http://mayakaan.travel/mayakaan_api/api/v1/escapadas/?format=json"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    self.sessionConfiguration=[NSURLSessionConfiguration defaultSessionConfiguration];
    self.session=[NSURLSession sessionWithConfiguration:self.sessionConfiguration];
    NSURLSessionDataTask * task = [self.session dataTaskWithRequest:request  completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSHTTPURLResponse *urlResponse = (NSHTTPURLResponse *)response;
        if(urlResponse.statusCode==200){
            //NSLog(@"It Came to 200 status");
            
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
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            [self.EscapadasCollection reloadData];
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
    return [self.escapadasItems  count];
    
}
-(UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSString * language = [[NSLocale preferredLanguages] objectAtIndex:0];
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"escapadaCell" forIndexPath:indexPath];
    UIImageView *imageView = (UIImageView *) [cell viewWithTag:10];
    UILabel *label = (UILabel *) [cell viewWithTag:11];
    NSString *destinoLabel;
    if ([self.escapadasItems count] > 0){
        NSDictionary *cellDictionary = [self.escapadasItems objectAtIndex:indexPath.row];
        if ([language isEqualToString:@"es-MX"] || [language isEqualToString:@"es"]) {
            destinoLabel = [cellDictionary objectForKey:@"nombre"];
        }
        else{
            destinoLabel = [cellDictionary objectForKey:@"nombre_en"];
        }
        NSString *imageUrlString = [cellDictionary objectForKey:@"img_portada"];
        NSURL *imageUrl = [NSURL URLWithString:imageUrlString
                                 relativeToURL:[NSURL URLWithString:@"http://mayakaan.travel/mayakaan_api/media/"]];
        NSURLRequest *imageUrlRequest = [NSURLRequest requestWithURL:imageUrl];
        imageView.image = [UIImage imageNamed:@"fondofotos"];
        label.text = @"";
        
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
    else{
        NSLog(@"Error es");

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
    NSString * language = [[NSLocale preferredLanguages] objectAtIndex:0];
    NSLog(@"%@",language);
    EscapadaViewController *View = [[EscapadaViewController alloc] init];
    View = [segue destinationViewController];
    NSArray *arrayOfIndexPaths = [self.EscapadasCollection indexPathsForSelectedItems];
    NSIndexPath *path = [arrayOfIndexPaths firstObject];
    NSDictionary *escapdaDictionary = [self.escapadasItems objectAtIndex:path.row];
    View.imagenEscapada = escapdaDictionary[@"img_destino"];
 
    if ([language isEqualToString:@"es-MX"] || [language isEqualToString:@"es"]) {
        View.tituloEscapada = escapdaDictionary[@"nombre"];
        View.descriptionEscapada = escapdaDictionary[@"des_cripcion"];
        View.ubicacionEscapada = escapdaDictionary[@"ubicacion"];
        View.actividadesEscapada = escapdaDictionary[@"actividades"];
    }
    else{
        View.tituloEscapada = escapdaDictionary[@"nombre_en"];
        View.descriptionEscapada = escapdaDictionary[@"des_cripcion_en"];
        View.ubicacionEscapada = escapdaDictionary[@"ubicacion_en"];
        View.actividadesEscapada = escapdaDictionary[@"actividades_en"];

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
