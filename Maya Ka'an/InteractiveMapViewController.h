//
//  InteractiveMapViewController.h
//  Maya Ka'an
//
//  Created by Alberto Enriquez on 13/01/15.
//  Copyright (c) 2015 Punk E-Marketing & Consulting. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
@interface InteractiveMapViewController : UIViewController<MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic,strong) NSMutableArray *items;
@end
