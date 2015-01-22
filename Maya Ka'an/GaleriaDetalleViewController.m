//
//  GaleriaDetalleViewController.m
//  Maya Ka'an
//
//  Created by Alberto Enriquez on 15/01/15.
//  Copyright (c) 2015 Punk E-Marketing & Consulting. All rights reserved.
//

#import "GaleriaDetalleViewController.h"

@interface GaleriaDetalleViewController ()
@property (strong, nonatomic) NSURLSession *session;
@property (strong,nonatomic) NSURLSessionConfiguration *sessionConfiguration;

@end

@implementation GaleriaDetalleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *viewTitle = [[UILabel alloc] init];
    viewTitle.textColor = [UIColor whiteColor];
    viewTitle.text=self.tituloImagen;
    self.navigationItem.titleView=viewTitle;
    [viewTitle sizeToFit];
    self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"fondo"]];
    
    
    NSString *imageUrlString = self.imagenUrl;
    NSURL *imageUrl = [NSURL URLWithString:imageUrlString
                             relativeToURL:[NSURL URLWithString:@"http://mayakaan.travel/mayakaan_api/media/"]];
    NSURLRequest *imageUrlRequest = [NSURLRequest requestWithURL:imageUrl];
    
    self.sessionConfiguration=[NSURLSessionConfiguration defaultSessionConfiguration];
    self.session=[NSURLSession sessionWithConfiguration:self.sessionConfiguration];
    NSURLSessionDataTask *task = [self.session dataTaskWithRequest:imageUrlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSHTTPURLResponse *urlResponse = (NSHTTPURLResponse *)response;
        if(urlResponse.statusCode==200){
            dispatch_async(dispatch_get_main_queue(), ^{
               UIImage *image = [UIImage imageWithData:data];
                //NSLog(@"image width: %f",image.size.width);
                //NSLog(@"image height: %f",image.size.height);
               
               [_galleryImageView setImage:[UIImage imageWithData:data]];
                if (image.size.width>image.size.height){
                    //585X439 314x235
                    //585X824 314x442
                    //_galleryImageView.frame = CGRectMake(0, -100, 314, 235);
                    
                   // NSLog(@"hirizontal");
                }
                else{
                 //   NSLog(@"vertical");
                   // _galleryImageView.frame = CGRectMake(0, -100, 314, 442);
                  
                }
                
                
            });
        }
        else{
            NSLog(@"Error fetching remote data");
        }
        
        
    }];
    [task resume];
  
    // Do any additional setup after loading the view.
}


- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    // Do your resizing
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
