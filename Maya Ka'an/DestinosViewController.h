//
//  DestinosViewController.h
//  Maya Ka'an
//
//  Created by Alberto Enriquez on 29/12/14.
//  Copyright (c) 2014 Punk E-Marketing & Consulting. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DestinosViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *DestinosCollection;
@property (strong,nonatomic) NSMutableArray* destinosItems;
@end
