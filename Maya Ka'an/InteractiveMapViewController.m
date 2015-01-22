//
//  InteractiveMapViewController.m
//  Maya Ka'an
//
//  Created by Alberto Enriquez on 13/01/15.
//  Copyright (c) 2015 Punk E-Marketing & Consulting. All rights reserved.
//

#import "InteractiveMapViewController.h"

@interface InteractiveMapViewController ()

@end

@implementation InteractiveMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    MKPointAnnotation *mypoint;
    self.items = [[NSMutableArray alloc] init];
    NSArray *loacations = @[
                            @{
                                @"location":@[@"19.585",@"-88.5919"],
                                @"title":@"Chunhuhub",
                                @"description":@"Descubre esta comunidad que significa “tronco del huhub” en lengua maya."
                            },
                            @{
                                @"location":@[@"19.9341",@"-88.805"],
                                @"title":@"Kantemó",
                                @"description":@"Atrévete a explorar la misteriosa Cueva de las Serpientes Colgantes."
                            },
                            @{
                                @"location":@[@"19.5675",@"-88.0353"],
                                @"title":@"Felipe Carrillo Puerto",
                                @"description":@"Antiguo santuario maya conocido como 'Pueblo de Guerreros'."
                            },
                            @{
                                @"location":@[@"19.8397",@"-88.1281"],
                                @"title":@"Señor",
                                @"description":@"Descubre costumbres y tradiciones mayas a través de sus habitantes."
                            },
                            @{
                                @"location":@[@"20.1896",@"-88.3772"],
                                @"title":@"Thiosuco",
                                @"description":@"Población más antigua famosa por sus construcciones coloniales."
                            },
                            @{
                                @"location":@[@"19.3106",@"-87.45"],
                                @"title":@"Punta Herrero",
                                @"description":@"Encantadora comunidad de pescadores, ideal para pesca deportiva."
                            },
                            @{
                                @"location":@[@"20.078",@"-87.616"],
                                @"title":@"Muyil",
                                @"description":@"Viaja a un antiguo puerto maya rodeado por la selva."
                            },
                            @{
                                @"location":@[@"19.7996",@"-87.477"],
                                @"title":@"Punta Allen",
                                @"description":@"Descubre un paraíso de arenas blancas a 50 km de Tulum."
                            },
                            @{
                                @"location":@[@"19.1429",@"-88.1677"],
                                @"title":@"Noh bec",
                                @"description":@"Déjate envolver en la majestuosidad de los árboles milenarios."
                            }
                        ];
    
    
    for (NSArray *dataDictionary in loacations) {
        [self.items addObject:dataDictionary];
    }
    
    for (NSDictionary *locationItem in self.items){
        mypoint = [[MKPointAnnotation alloc] init];
        mypoint.coordinate = CLLocationCoordinate2DMake([ locationItem[@"location"][0] doubleValue],[ locationItem[@"location"][1] doubleValue]);
        mypoint.title = NSLocalizedString(locationItem[@"title"],nil);
        mypoint.subtitle =NSLocalizedString(locationItem[@"description"],nil);
        [self.mapView addAnnotation:mypoint];

    }
    
    
    MKCoordinateRegion initialRegion = MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2DMake(20,-88), 600000, 600000);
    [self.mapView setRegion:[self.mapView regionThatFits:initialRegion] animated:YES];

    
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
