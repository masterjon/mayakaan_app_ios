//
//  GaleriaViewController.h
//  Maya Ka'an
//
//  Created by Alberto Enriquez on 15/01/15.
//  Copyright (c) 2015 Punk E-Marketing & Consulting. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GaleriaViewController : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *galeriaCollection;
@property (strong,nonatomic) NSMutableArray *galeriaItems;
@end
