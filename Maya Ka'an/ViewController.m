//
//  ViewController.m
//  Maya Ka'an
//
//  Created by Alberto Enriquez on 23/12/14.
//  Copyright (c) 2014 Punk E-Marketing & Consulting. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
//-(BOOL)prefersStatusBarHidden{
//    return YES;
//}
- (void)viewDidLoad {
    [super viewDidLoad];
        self.navigationItem.title = @"Maya Ka'an";
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    [self.navigationController.navigationBar setBackgroundColor:[UIColor brownColor]];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navBar"]forBarMetrics:UIBarMetricsDefault];
    self.menuItems = [[NSMutableArray alloc] init];
    NSArray *menu = @[
                      @{
                          @"title":NSLocalizedString(@"Destinos",nil),
                          @"image":@"icono_destinos",
                          @"target":@"DestinosViewController"
                        },
                      @{
                          @"title":NSLocalizedString(@"Escapadas",nil),
                          @"image":@"icono_escapadas",
                          @"target":@"EscapadasViewController"
                        },
                      @{
                          @"title":NSLocalizedString(@"Galería",nil),
                          @"image":@"icono_galeria",
                          @"target":@"GaleriaViewController"
                        },
                      @{
                          @"title":NSLocalizedString(@"Directorio",nil),
                          @"image":@"icono_directorio",
                          @"target":@"DirectorioViewController"
                        },
                      @{
                          @"title":NSLocalizedString(@"Tips",nil),
                          @"image":@"icono_tips",
                          @"target":@"TipsViewController"
                        },
                      @{
                          @"title":NSLocalizedString(@"Mapa",nil),
                          @"image":@"icono_mapa",
                          @"target":@"MapViewController"
                        },
                     
                      ];
    for (NSArray *dataDictionary in menu){
        [self.menuItems addObject:dataDictionary];
    
    }
    
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.menuItems count];
}
-(UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"menuCell" forIndexPath:indexPath];
    UIImageView *menuImage = (UIImageView *) [cell viewWithTag:10];
    UILabel *label = (UILabel *) [cell viewWithTag:11];
    if([self.menuItems count] > 0){
        NSDictionary *cellDictionary = [self.menuItems objectAtIndex:indexPath.row];
        NSString *labelItem = [cellDictionary objectForKey:@"title"];
        NSString *imageItem = [cellDictionary objectForKey:@"image"];
        menuImage.image = [UIImage imageNamed:imageItem];
        label.text = [NSString stringWithFormat:@"%@",labelItem];
    }
    return cell;
}
-(void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *menuItemDictionary = [self.menuItems objectAtIndex:indexPath.row];
    
        ViewController *viewC = [self.storyboard instantiateViewControllerWithIdentifier:menuItemDictionary[@"target"]];
        [self.navigationController pushViewController:viewC animated:YES];
        

}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    int top = 0;
    int left = 0;
    int bottom = 0;
    int right = 0;
    NSLog(@"%i",(int)screenBounds.size.width);
    switch ((int) screenBounds.size.width) {
        case 768:
            NSLog(@"--Ipad Portrait");
            left = 50;
            right = 50;

            break;
        case 1024:
            NSLog(@"--Ipad Landscape");
            left = 50;
            right = 50;
            break;
        default:
            break;
    }
    return UIEdgeInsetsMake(top, left, bottom, right);
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
        return CGSizeMake(267.f, 284.f);
    }
    
    //Size of cells for iphones
    return CGSizeMake(139.f,167.f);
    
}
@end
