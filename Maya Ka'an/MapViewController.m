//
//  MapViewController.m
//  Maya Ka'an
//
//  Created by Alberto Enriquez on 09/01/15.
//  Copyright (c) 2015 Punk E-Marketing & Consulting. All rights reserved.
//
#define IDIOM    UI_USER_INTERFACE_IDIOM()
#define IPAD     UIUserInterfaceIdiomPad
#import "MapViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *viewTitle = [[UILabel alloc] init];
    viewTitle.textColor = [UIColor whiteColor];
    viewTitle.text=NSLocalizedString(@"Mapa", nil);
    self.navigationItem.titleView=viewTitle;
    [viewTitle sizeToFit];
    self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"fondo1"]];
    self.navigationItem.rightBarButtonItem =  [[UIBarButtonItem alloc]
                                               initWithBarButtonSystemItem:UIBarButtonSystemItemAction
                                               target:self
                                               action:@selector(shareAction:)];

    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(UIView *) viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageView;
}
-(IBAction)shareAction:(UIButton *)sender {
    
    NSString *shareText= NSLocalizedString(@"Descubre lugares increíbles en Maya Ka'an",nil);
    UIImage *mergedImage = [UIImage imageNamed:@"mapa_mayakaan"];
    NSArray *items2Share= @[shareText,mergedImage];
    UIActivityViewController *activityViewC = [[UIActivityViewController alloc] initWithActivityItems:items2Share applicationActivities:nil];
    activityViewC.excludedActivityTypes = @[];
    if ( IDIOM == IPAD ) {
        activityViewC.popoverPresentationController.barButtonItem = self.navigationItem.rightBarButtonItem;
    }
    [self presentViewController:activityViewC animated:YES completion:nil];
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
