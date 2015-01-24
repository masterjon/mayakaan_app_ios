//
//  DestinoViewController.m
//  Maya Ka'an
//
//  Created by Alberto Enriquez on 14/01/15.
//  Copyright (c) 2015 Punk E-Marketing & Consulting. All rights reserved.
//

#import "DestinoViewController.h"

@interface DestinoViewController ()
@property (strong, nonatomic) NSURLSession *session;
@property (strong,nonatomic) NSURLSessionConfiguration *sessionConfiguration;
@end

@implementation DestinoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *viewTitle = [[UILabel alloc] init];
    viewTitle.textColor = [UIColor whiteColor];
    viewTitle.text=self.tituloDestino;
    self.navigationItem.titleView=viewTitle;
    [viewTitle sizeToFit];
    self.navigationItem.rightBarButtonItem =  [[UIBarButtonItem alloc]
                                               initWithBarButtonSystemItem:UIBarButtonSystemItemAction
                                               target:self
                                               action:@selector(shareAction:)];
    
    [_tituloDestinoLabel setText:self.tituloDestino];
    [_descripcionDestino setText:self.descriptionDestino];
    [_actividadesDestinoTextView setText:self.actividadesDestino];
    [_ubicacionDestinoTextView setText:self.ubicacionDestino];
    //self.bottomView.layer.borderWidth=2;
    //self.bottomView.layer.borderColor = [UIColor redColor].CGColor;
    if ([self.actividadesDestino  isEqual: @""]) {
        [_actividadesDestinoLabel setHidden:TRUE];
    }
    NSString *imageUrlString = self.imagenDestino;
    NSURL *imageUrl = [NSURL URLWithString:imageUrlString
                             relativeToURL:[NSURL URLWithString:@"http://mayakaan.travel/mayakaan_api/media/"]];
    NSURLRequest *imageUrlRequest = [NSURLRequest requestWithURL:imageUrl];
    
    self.sessionConfiguration=[NSURLSessionConfiguration defaultSessionConfiguration];
    self.session=[NSURLSession sessionWithConfiguration:self.sessionConfiguration];
    NSURLSessionDataTask *task = [self.session dataTaskWithRequest:imageUrlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSHTTPURLResponse *urlResponse = (NSHTTPURLResponse *)response;
        if(urlResponse.statusCode==200){
            dispatch_async(dispatch_get_main_queue(), ^{
                self.imagen = [UIImage imageWithData:data];
                [_imageViewDestino setImage:self.imagen];
                //imageView.image=[UIImage imageWithData:data];
              //  label.text = [NSString stringWithFormat:@"%@",destinoLabel];
            });
        }
        else{
            //NSLog(@"Error fetching remote data");
        }
        
        
    }];
    [task resume];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}
-(IBAction)shareAction:(UIButton *)sender {
    
    NSString *shareText= [@"Visita " stringByAppendingString:[ self.tituloDestino stringByAppendingString:@" - Maya Ka'an"] ];
    UIImage *mergedImage = [self imagen];
    CGImageRef cgref = [mergedImage CGImage];
    CIImage *cim = [mergedImage CIImage];
    
    if (cim == nil && cgref == NULL)
    {
        //NSLog(@"no underlying data");
    }
    else{
        NSArray *items2Share= @[shareText,mergedImage];
        UIActivityViewController *activityViewC = [[UIActivityViewController alloc] initWithActivityItems:items2Share applicationActivities:nil];
        activityViewC.excludedActivityTypes = @[];
        [self presentViewController:activityViewC animated:YES completion:nil];
    }
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
