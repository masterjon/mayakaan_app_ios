//
//  EscapadaViewController.h
//  Maya Ka'an
//
//  Created by Alberto Enriquez on 15/01/15.
//  Copyright (c) 2015 Punk E-Marketing & Consulting. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EscapadaViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *imageViewEscapada;
@property (weak, nonatomic) IBOutlet UILabel *tituloEscapadaLabel;
@property (weak, nonatomic) IBOutlet UITextView *descripcionEscapada;
@property (weak, nonatomic) IBOutlet UITextView *ubicacionEscapadasTextView;
@property (weak, nonatomic) IBOutlet UITextView *actividadesEscapadaTextView;

@property (nonatomic,strong) NSString *tituloEscapada;
@property (nonatomic,strong) NSString *descriptionEscapada;
@property (nonatomic,strong) NSString *ubicacionEscapada;
@property (nonatomic,strong) NSString *actividadesEscapada;
@property (nonatomic,strong) NSString *imagenEscapada;
@end
