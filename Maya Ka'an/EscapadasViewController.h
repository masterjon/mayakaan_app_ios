//
//  EscapadasViewController.h
//  Maya Ka'an
//
//  Created by Alberto Enriquez on 15/01/15.
//  Copyright (c) 2015 Punk E-Marketing & Consulting. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EscapadasViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *EscapadasCollection;
@property (strong,nonatomic) NSMutableArray* escapadasItems;
@end
