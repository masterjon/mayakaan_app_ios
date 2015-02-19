//
//  GaleriaDetalleViewController.m
//  Maya Ka'an
//
//  Created by Alberto Enriquez on 15/01/15.
//  Copyright (c) 2015 Punk E-Marketing & Consulting. All rights reserved.
//
#define IDIOM    UI_USER_INTERFACE_IDIOM()
#define IPAD     UIUserInterfaceIdiomPad
#import "GaleriaDetalleViewController.h"
#import "MBProgressHUD.h"
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
    self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"fondo1"]];
    self.navigationItem.rightBarButtonItem =  [[UIBarButtonItem alloc]
                                               initWithBarButtonSystemItem:UIBarButtonSystemItemAction
                                               target:self
                                               action:@selector(shareAction:)];
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Error"
                                                      message:NSLocalizedString(@"Necesitas activar tu conexión a internet.",nil)
                                                     delegate:self
                                            cancelButtonTitle:@"OK"
                                            otherButtonTitles:nil];
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
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
               self.image = [UIImage imageWithData:data];
                //NSLog(@"image width: %f",image.size.width);
                //NSLog(@"image height: %f",image.size.height);
               
               [_galleryImageView setImage:self.image];
                [MBProgressHUD hideHUDForView:self.view animated:YES];
                
            });
        }
        else{
            [message show];
        }
        
        
    }];
    [task resume];
  
    // Do any additional setup after loading the view.
}


- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];

    
    // Do your resizing
}
-(IBAction)shareAction:(UIButton *)sender {
    NSString *shareText= NSLocalizedString([ self.tituloImagen stringByAppendingString:@" - Maya Ka'an"],nil);
    UIImage *mergedImage = [self image];
    CGImageRef cgref = [mergedImage CGImage];
    CIImage *cim = [mergedImage CIImage];
    
    if (cim == nil && cgref == NULL)
    {
        NSLog(@"no underlying data");
    }
    else{
        NSArray *items2Share= @[shareText,mergedImage];
        UIActivityViewController *activityViewC = [[UIActivityViewController alloc] initWithActivityItems:items2Share applicationActivities:nil];
        activityViewC.excludedActivityTypes = @[];
        if ( IDIOM == IPAD ) {
            activityViewC.popoverPresentationController.barButtonItem = self.navigationItem.rightBarButtonItem;
        }
        [self presentViewController:activityViewC animated:YES completion:nil];
    }
}
- (void)alertView:(UIAlertView *)alertView
clickedButtonAtIndex:(NSInteger)buttonIndex{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}
-(UIView *) viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.galleryImageView;
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
