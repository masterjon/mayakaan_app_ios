//
//  DestinoViewController.h
//  Maya Ka'an
//
//  Created by Alberto Enriquez on 14/01/15.
//  Copyright (c) 2015 Punk E-Marketing & Consulting. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DestinoViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *tituloDestinoLabel;
@property (weak, nonatomic) IBOutlet UITextView *descripcionDestino;
@property (weak, nonatomic) IBOutlet UITextView *ubicacionDestinoTextView;
@property (weak, nonatomic) IBOutlet UITextView *actividadesDestinoTextView;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewDestino;
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (nonatomic,strong) NSString *tituloDestino;
@property (nonatomic,strong) NSString *descriptionDestino;
@property (nonatomic,strong) NSString *ubicacionDestino;
@property (nonatomic,strong) NSString *actividadesDestino;
@property (nonatomic,strong) NSString *imagenDestino;
@end
