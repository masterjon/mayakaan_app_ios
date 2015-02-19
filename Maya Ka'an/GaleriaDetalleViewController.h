//
//  GaleriaDetalleViewController.h
//  Maya Ka'an
//
//  Created by Alberto Enriquez on 15/01/15.
//  Copyright (c) 2015 Punk E-Marketing & Consulting. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GaleriaDetalleViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *galleryImageView;
@property (strong,nonatomic) NSString *tituloImagen;
@property (strong,nonatomic) NSString *imagenUrl;
@property (strong,nonatomic) UIImage *image;
@end
