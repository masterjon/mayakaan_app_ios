//
//  DirectorioViewController.m
//  Maya Ka'an
//
//  Created by Alberto Enriquez on 29/12/14.
//  Copyright (c) 2014 Punk E-Marketing & Consulting. All rights reserved.
//

#import "DirectorioViewController.h"

@interface DirectorioViewController () <KMAccordionTableViewControllerDataSource,KMAccordionTableViewControllerDelegate>

@end

@implementation DirectorioViewController

- (NSInteger)numberOfSectionsInAccordionTableViewController:(KMAccordionTableViewController *)accordionTableView {
    return [self.sections count];
}

- (KMSection *)accordionTableView:(KMAccordionTableViewController *)accordionTableView sectionForRowAtIndex:(NSInteger)index {
    return self.sections[index];
}

- (CGFloat)accordionTableView:(KMAccordionTableViewController *)accordionTableView heightForSectionAtIndex:(NSInteger)index {
    KMSection *section = self.sections[index];
    return section.view.frame.size.height;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *viewTitle = [[UILabel alloc] init];
    viewTitle.textColor = [UIColor whiteColor];
    viewTitle.text=NSLocalizedString(@"Directorio", nil);
    self.navigationItem.titleView=viewTitle;
    [viewTitle sizeToFit];
    self.items = [[NSMutableArray alloc] init];
    NSArray *directoryItems=
            @[
                  
                  @{
                    @"section":@"CHUNHUHUB",
                    @"content":
                        @[
                            @{
                                @"subsection":@"Kiichpam K’áax (Selva Bonita)",
                                @"contacts":
                                    @[
                                        @{
                                            @"title":@"Cooperativa",
                                            @"phones":@[@"+52 (983) 114 31 21"],
                                            @"emails":@[]
                                        },
                                        @{
                                            @"title":@"Damian Leonel Gómez Xool.",
                                            @"phones":@[@"+521 (983) 113 28 82"],
                                            @"emails":@[]
                                        },
                                        @{
                                            @"title":@"Lizeth Del C. Vega Álvarez.",
                                            @"phones":@[@"+521 (983) 165 56 77"],
                                            @"emails":@[]
                                        },
                                        
                                    ],
                                @"emails":@[@"ecoturismo_kiichpam.kaxx@hotmail.com",@"selvabonita@outlook.com"],
                                @"web":@"",
                                @"facebook":@"www.facebook.com/selvabonita"
                            },
                           
                        ]
                   },
                  
                  
                  @{
                    @"section":@"FELIPE CARRILLO PUERTO",
                    @"content":
                      @[
                          @{
                              @"subsection":@"Centro Recreativo Eco turístico Balam Nah",
                              @"contacts":
                                  @[
                                      @{
                                          @"title":@"Bruno Fabián Martínez Martin.",
                                          @"phones":@[@"+521 (983) 102 07 16",@"+521 (983) 120 66 76"],
                                          @"emails":@[]
                                        },
                                    ],
                              @"emails":@[@"eco-balam-nah@hotmail.com"],
                              @"web":@"",
                              @"facebook":@"www.facebook.com/eco.balam.nah"
                           },
                          @{
                              @"subsection":@"Centro Comunitario de Arte y Filosofía Maya Raxalaj Mayab",
                              @"contacts":
                                  @[
                                      @{
                                          @"title":@"Columba Marin Martínez",
                                          @"phones":@[@"+521 (983) 106 02 39"],
                                          @"emails":@[]
                                        },
                                    ],
                              @"emails":@[],
                              @"web":@"",
                              @"facebook":@"www.facebook.com/artemaya.raxalajmayab"
                           },
                          @{
                              @"subsection":@"CorazonyVidaMaya",
                              @"contacts":
                                  @[
                                      @{
                                          @"title":@"Anaid Corona",
                                          @"phones":@[@"+521 (998) 222 22 50"],
                                          @"emails":@[]
                                       },
                                   ],
                              @"emails":@[@"corazonyvidamayatours@gmail.com"],
                              @"web":@"www.corazonyvidamaya.com",
                              @"facebook":@"www.facebook.com/CorazonyVidaMaya"
                            },
                          @{
                              @"subsection":@"Ejido Felipe Carrillo Puerto",
                              @"contacts":
                                  @[
                                      @{
                                          @"title":@"Oficinas",
                                          @"phones":@[@"+52 (998) 01 983 40525"],
                                          @"emails":@[]
                                        },
                                    ],
                              @"emails":@[@"ejidofcp@gmail.com"],
                              @"web":@"",
                              @"facebook":@"www.facebook.com/siijilnohha.ecoturismo?fref=ts"
                           },

                      ]
                 },
                  
                  
                @{
                  @"section":@"KANTEMÓ",
                  @"content":
                      @[
                          @{
                              @"subsection":@"Centro Eco turístico Beej Ka´ax Ha.",
                              @"contacts":
                                  @[
                                      @{
                                          @"title":@"Baltazar L. Borges Cob",
                                          @"phones":@[@"+521 (045) 997 977 44 87",@"+521 (045) 997 977 49 20"],
                                          @"emails":@[@"bejkaxha@yahoo.com.mx"]
                                        },
                                    ],
                              @"emails":@[],
                              @"web":@"",
                              @"facebook":@""
                           },
                       ]
                 },
                  
                  
                @{
                  @"section":@"MUYIL",
                  @"content":
                      @[
                          @{
                              @"subsection":@"Community Tours Sian Ka´an",
                              @"contacts":
                                  @[
                                      @{
                                          @"title":@"Yolanda Caamal Pacheco",
                                          @"phones":@[@"+52 (984) 8712202",@"+ 52 (984) 1456148"],
                                          @"emails":@[]
                                        },
                                   ],
                              @"emails":@[@"info@siankaantours.org"],
                              @"web":@"www.siankaantours.org",
                              @"facebook":@"Community Tours Sian Kaan"
                           },
                          @{
                              @"subsection":@"Uyo Ochel Maya",
                              @"contacts":
                                  @[
                                      @{
                                          @"title":@"Candido Caamal",
                                          @"phones":@[@"+521 (984) 141 83 56"],
                                          @"emails":@[]
                                        },
                                    ],
                              @"emails":@[@"caamaltours@hotmail.com",@"uyoochel_mayatours@hotmail.com"],
                              @"web":@"",
                              @"facebook":@""
                            },
                        ]
                  },
                  
                  
                  @{
                    @"section":@"NOH-BEC",
                    @"content":
                          @[
                              @{
                                  @"subsection":@"Ejido Noh-Bec",
                                  @"contacts":
                                      @[
                                          @{
                                              @"title":@"Raciel González Reyes",
                                              @"phones":@[@"+52 (983) 2086034"],
                                              @"emails":@[]
                                            },
                                        ],
                                  @"emails":@[@"ejido_nohbec@hotmail.com"],
                                  @"web":@"",
                                  @"facebook":@""
                                },
                             
                           ]
                   },
                  
                  
                  @{
                    @"section":@"PUNTA ALLEN",
                    @"content":
                          @[
                              @{
                                  @"subsection":@"Alianza Punta Allen",
                                  @"contacts":
                                      @[
                                          @{
                                              @"title":@"Juan Carlos Rendón",
                                              @"phones":@[@"+521 (984)113 04 74"],
                                              @"emails":@[@"pezcharly@gmail.com"]
                                            },
                                        ],
                                  @"emails":@[],
                                  @"web":@"",
                                  @"facebook":@""
                               },
                              @{
                                  @"subsection":@"Na´tour Sian Ka´an",
                                  @"contacts":
                                      @[
                                          @{
                                              @"title":@"María de la Cruz Mendoza Mendoza",
                                              @"phones":@[@"+521 (984) 113 40 03",@"+52 883 123 45 67"],
                                              @"emails":@[@"ecotourmujersian-kaan@hotmail.com"]
                                            },
                                        ],
                                  @"emails":@[],
                                  @"web":@"www.natoursiankaan.com",
                                  @"facebook":@""
                                },
                              
                           ]
                    },
                  
                  
                  @{
                    @"section":@"BAHÍA DEL ESPÍRITU SANTO",
                    @"content":@[
                            @{
                                @"subsection":@"Cooperativa Arrecifes de Sian Ka’an",
                                @"contacts":
                                    @[
                                        @{
                                            @"title":@"Contacto",
                                            @"phones":@[],
                                            @"emails":@[@"Arrecifesiankaan@hotmail.com",@"orgullosiankaan@gmail.com"]
                                            },
                                        ],
                                @"emails":@[],
                                @"web":@"",
                                @"facebook":@""
                                },
                            @{
                                @"subsection":@"Red de Turismo Comunitario de la Zona Maya de Quintana Roo",
                                @"contacts":
                                    @[
                                        @{
                                            @"title":@"Contacto",
                                            @"phones":@[],
                                            @"emails":@[@"rtczonamaya@gmail.com"]
                                            },
                                        ],
                                @"emails":@[],
                                @"web":@"",
                                @"facebook":@""
                                }
                            ]
                    },
                  
                  
                  @{
                    @"section":@"SEÑOR",
                    @"content":
                          @[
                              @{
                                  @"subsection":@"Xyaat",
                                  @"contacts":
                                      @[
                                          @{
                                              @"title":@"Marcos A. Cante Canul",
                                              @"phones":@[@"+521 (983)1067624"],
                                              @"emails":@[@"marcos@xyaat.com"]
                                            },
                                        ],
                                  @"emails":@[@"xyaat@hotmail.com "],
                                  @"web":@"",
                                  @"facebook":@"xyaatculturamaya"
                                }
                              
                           ]
                   },
                  
                  
                  @{
                    @"section":@"TIHOSUCO",
                    @"content":
                          @[
                              @{
                                  @"subsection":@"U Belilek Kaxtik Kuxtal",
                                  @"contacts":
                                      @[
                                          @{
                                              @"title":@"Carlos Chan Espinosa",
                                              @"phones":@[@"+521 (983) 103 03 67"],
                                              @"emails":@[@"ubkk_1@hotmail.com",@"chancarlos26@hotmail.com"]
                                            },
                                       ],
                                  @"emails":@[],
                                  @"web":@"",
                                  @"facebook":@""
                                }
                              
                          ]
                   },
            ];
    
    for (NSArray *dataDictionary in directoryItems){
        [self.items addObject:dataDictionary];
        
    }
    self.dataSource = self;
    self.delegate = self;
    
    self.rowColor = [UIColor colorWithRed:0.231 green:0.635 blue:0.718 alpha:1]; /*#3ba2b7*/
    self.sections = [self getSectionArray];
    [self setupAppearence];
    
}

- (void)setupAppearence {
    [self setHeaderHeight:50];
    //[self setHeaderArrowImageClosed:[UIImage imageNamed:@"ctrl-down"]];
    //[self setHeaderArrowImageOpened:[UIImage imageNamed:@"ctrl-up"]];
    [self setHeaderFont:[UIFont  boldSystemFontOfSize:16]];
    [self setHeaderTitleColor:[UIColor whiteColor]];
    [self setHeaderSeparatorColor:[UIColor whiteColor]];
    [self setHeaderColor:[UIColor colorWithRed:0.114 green:0.114 blue:0.114 alpha:1]]; //general background color for all of the sections
    [self setOneSectionAlwaysOpen:NO]; // set if one section should always be open. if set to YES, the VC will load with the first section already open, and the open section will not close unless you click a different section
}

- (void)teste {
    KMSection *section = self.sections[2];
    
    UIView *view = section.view;
    view.frame = CGRectMake(0, 0, 320, 400);
    [self reloadOpenedSection];
}

- (NSArray *)getSectionArray {

    NSMutableArray *listArray = [[NSMutableArray alloc] init];
    int ident = 10;
    for (NSDictionary *section in self.items ){
        
        UIView *viewOfSection = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width-40, 0)];
        int i = 0;
        int textHeight = 5;
        for (NSDictionary *myitems in section[@"content"]){

            UILabel *cSubsection = [[UILabel alloc] init];
            [cSubsection setText:myitems[@"subsection"]];
            cSubsection.lineBreakMode = NSLineBreakByWordWrapping;
            cSubsection.numberOfLines = 0;

            [cSubsection setFont:[UIFont boldSystemFontOfSize:15]];
            [cSubsection setTextColor:[UIColor grayColor]];
            //[cSubsection.layer setBorderColor: [[UIColor redColor] CGColor]];
            //[cSubsection.layer setBorderWidth: 1.0];
            ident = 10;
            [viewOfSection addSubview:cSubsection];
            NSStringDrawingContext *context = [[NSStringDrawingContext alloc] init];
            CGSize labelSize = (CGSize){self.view.frame.size.width, 999};
            CGRect r = [cSubsection.text boundingRectWithSize:labelSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:16]} context:context];
            cSubsection.frame = CGRectMake(ident, i, self.view.frame.size.width-10, r.size.height+textHeight);
            i=i+r.size.height+textHeight;
            ident = 15;
            for (NSDictionary *contacts in myitems[@"contacts"]){
                UILabel *cTitle = [[UILabel alloc] init];
                [cTitle setText:contacts[@"title"]];
                [cTitle setFont:[UIFont boldSystemFontOfSize:14]];
                [cTitle setTextColor:[UIColor grayColor]];
                //[cTitle.layer setBorderColor: [[UIColor blueColor] CGColor]];
                //[cTitle.layer setBorderWidth: 1.0];
                [viewOfSection addSubview:cTitle];
                
                NSStringDrawingContext *context = [[NSStringDrawingContext alloc] init];
                CGSize labelSize = (CGSize){self.view.frame.size.width, 999};
                CGRect r = [cTitle.text boundingRectWithSize:labelSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:16]} context:context];
                cTitle.frame = CGRectMake(ident, i, self.view.frame.size.width-10, r.size.height);
                i=i+r.size.height;
               
                
                for (NSString *phone in contacts[@"phones"]){
                    
                    UITextView *cPhone = [[UITextView alloc] init];
                    cPhone.dataDetectorTypes = UIDataDetectorTypeAll;
                    cPhone.editable = NO;
                    cPhone.scrollEnabled = NO;
                    [cPhone setText:phone];
                    [cPhone setFont:[UIFont fontWithName:@"Helvetica" size:14]];
                    [cPhone setTextColor:[UIColor grayColor]];
                    //[cPhone.layer setBorderColor: [[UIColor greenColor] CGColor]];
                    //[cPhone.layer setBorderWidth: 1.0];
                    NSStringDrawingContext *context = [[NSStringDrawingContext alloc] init];
                    CGSize labelSize = (CGSize){self.view.frame.size.width, 999};
                    CGRect r = [cPhone.text boundingRectWithSize:labelSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:16]} context:context];
                    cPhone.frame =  CGRectMake(ident, i, self.view.frame.size.width-ident, r.size.height+textHeight);
                    [viewOfSection addSubview:cPhone];
                    i=i+r.size.height+textHeight;
                }
                
                for (NSString *email in contacts[@"emails"]){
                    
                    UITextView *cEmail = [[UITextView alloc] init];
                    cEmail.dataDetectorTypes = UIDataDetectorTypeAll;
                    cEmail.editable = NO;
                    cEmail.scrollEnabled = NO;
                    [cEmail setText:email];
                    [cEmail setFont:[UIFont fontWithName:@"Helvetica" size:14]];
                    [cEmail setTextColor:[UIColor grayColor]];
                    //[cEmail.layer setBorderColor: [[UIColor yellowColor] CGColor]];
                    //[cEmail.layer setBorderWidth: 1.0];
                    NSStringDrawingContext *context = [[NSStringDrawingContext alloc] init];
                    CGSize labelSize = (CGSize){self.view.frame.size.width, 999};
                    CGRect r = [cEmail.text boundingRectWithSize:labelSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:16]} context:context];
                    cEmail.frame =  CGRectMake(ident, i, self.view.frame.size.width-ident, r.size.height+textHeight);
                    [viewOfSection addSubview:cEmail];
                    i=i+r.size.height+textHeight;
                
                }
                i=i+8;
                

            }
            

            for (NSString *email in myitems[@"emails"]){
                UITextView *Email = [[UITextView alloc] init];
                Email.dataDetectorTypes = UIDataDetectorTypeAll;
                Email.editable = NO;
                Email.scrollEnabled = NO;
                [Email setText:email];
                [Email setFont:[UIFont fontWithName:@"Helvetica" size:14]];
                [Email setTextColor:[UIColor grayColor]];
                //[Email.layer setBorderColor: [[UIColor purpleColor] CGColor]];
                //[Email.layer setBorderWidth: 1.0];
                NSStringDrawingContext *context = [[NSStringDrawingContext alloc] init];
                CGSize labelSize = (CGSize){self.view.frame.size.width, 999};
                CGRect r = [Email.text boundingRectWithSize:labelSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:16]} context:context];
                Email.frame =  CGRectMake(ident, i, self.view.frame.size.width-ident, r.size.height+textHeight);
                [viewOfSection addSubview:Email];
                i=i+r.size.height+textHeight;
            }
           
            if ([myitems[@"web"] length] != 0) {
                UITextView *cWeb = [[UITextView alloc] init];
                cWeb.dataDetectorTypes = UIDataDetectorTypeAll;
                cWeb.editable = NO;
                cWeb.scrollEnabled = NO;
                [cWeb setText:myitems[@"web"]];
                [cWeb setFont:[UIFont fontWithName:@"Helvetica" size:14]];
                [cWeb setTextColor:[UIColor grayColor]];
                //[cWeb.layer setBorderColor: [[UIColor orangeColor] CGColor]];
                //[cWeb.layer setBorderWidth: 1.0];
                NSStringDrawingContext *context = [[NSStringDrawingContext alloc] init];
                CGSize labelSize = (CGSize){self.view.frame.size.width, 999};
                CGRect r = [cWeb.text boundingRectWithSize:labelSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:16]} context:context];
                cWeb.frame =  CGRectMake(ident, i, self.view.frame.size.width-ident, r.size.height+textHeight);
                [viewOfSection addSubview:cWeb];
                i=i+r.size.height+textHeight;
                
            }
            
            if ([myitems[@"facebook"] length] != 0) {
                UITextView *cFacebook = [[UITextView alloc] init];
                cFacebook.dataDetectorTypes = UIDataDetectorTypeAll;
                cFacebook.editable = NO;
                cFacebook.scrollEnabled = NO;
                [cFacebook setText:myitems[@"facebook"]];
                [cFacebook setFont:[UIFont fontWithName:@"Helvetica" size:14]];
                [cFacebook setTextColor:[UIColor grayColor]];
                //[cFacebook.layer setBorderColor: [[UIColor grayColor] CGColor]];
                //[cFacebook.layer setBorderWidth: 1.0];
                NSStringDrawingContext *context = [[NSStringDrawingContext alloc] init];
                CGSize labelSize = (CGSize){self.view.frame.size.width, 999};
                CGRect r = [cFacebook.text boundingRectWithSize:labelSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:16]} context:context];
                cFacebook.frame =  CGRectMake(ident, i, self.view.frame.size.width-ident, r.size.height+textHeight);
                [viewOfSection addSubview:cFacebook];
                i=i+r.size.height+textHeight;
                

            }

            i=i+15;

        }
       // NSLog(@"%i -- %@",i,section[@"section"]);
        viewOfSection.frame = CGRectMake(0, 0, self.view.frame.size.width-40, i );
        KMSection *section3 = [[KMSection alloc] init];
        section3.view = viewOfSection;
        section3.title = [section[@"section"] capitalizedString];
        section3.colorForBackground = self.rowColor;
        [listArray  addObject:section3];

    }
    
    
    
    
    return listArray;
}

#pragma mark - KMAccordionTableViewControllerDelegate

- (void)accordionTableViewControllerSectionDidClosed:(KMSection *)section
{
    NSLog(@"%s",__PRETTY_FUNCTION__);
}

- (void)accordionTableViewControllerSectionDidOpened:(KMSection *)section
{
    NSLog(@"%s",__PRETTY_FUNCTION__);
}

@end

