//
//  BienvenidosViewController.m
//  Maya Ka'an
//
//  Created by Alberto Enriquez on 28/01/15.
//  Copyright (c) 2015 Punk E-Marketing & Consulting. All rights reserved.
//

#import "BienvenidosViewController.h"
@interface BienvenidosViewController ()

@end

@implementation BienvenidosViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"hola");
    double delayInSeconds = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        NSLog(@"mundo");
        BienvenidosViewController *second = [self.storyboard instantiateViewControllerWithIdentifier:@"navigationViewController"];
        //[self.navigationController pushViewController:second animated:YES];
        [self presentViewController:second animated:YES completion:nil];
        
        //code to be executed on the main queue after delay
    });
    
   
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
