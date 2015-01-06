//
//  TipsViewController.m
//  Maya Ka'an
//
//  Created by Punk on 1/5/15.
//  Copyright (c) 2015 Punk E-Marketing & Consulting. All rights reserved.
//

#import "TipsViewController.h"

@interface TipsViewController () <KMAccordionTableViewControllerDataSource,KMAccordionTableViewControllerDelegate>

@end

@implementation TipsViewController


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
          @"section":@"PUNTA HERRERO",
          @"content":@[]
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
    [self setHeaderArrowImageClosed:[UIImage imageNamed:@"carat-open"]];
    [self setHeaderArrowImageOpened:[UIImage imageNamed:@"carat"]];
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
    
    UIView *viewOfSection3 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 200)];
    viewOfSection3.backgroundColor = [UIColor greenColor];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
    [button setTitle:@"click meeeeeee" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(teste) forControlEvents:UIControlEventTouchUpInside];
    [viewOfSection3 addSubview:button];
    
    UIImageView *sun = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 93, 75)];
    sun.image = [UIImage imageNamed:@"tips_gorra.png"];
     [viewOfSection3 addSubview:sun];
    KMSection *section1 = [[KMSection alloc] init];
    section1.view = viewOfSection3;
    section1.title = @"thirddddd";
    section1.colorForBackground = [UIColor blueColor];
    section1.image = [UIImage imageNamed:@"Skype_Email"];
    
     [listArray  addObject:section1];
    
    int ident = 20;
    for (NSDictionary *section in self.items ){
        
        UIView *viewOfSection = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width-40, 0)];
        int i = 50;
        int height = 0;
        for (NSDictionary *myitems in section[@"content"]){
            
            UILabel *cSubsection = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, self.view.frame.size.width-40, i)];
            [cSubsection setText:myitems[@"subsection"]];
            [cSubsection setFont:[UIFont boldSystemFontOfSize:12]];
            [cSubsection setTextColor:[UIColor grayColor]];
            [viewOfSection addSubview:cSubsection];
            i=i+30;
            height=height+10;
            
            for (NSDictionary *contacts in myitems[@"contacts"]){
                UILabel *cTitle = [[UILabel alloc] initWithFrame:CGRectMake(ident, 0, self.view.frame.size.width-40, i)];
                [cTitle setText:contacts[@"title"]];
                [cTitle setFont:[UIFont boldSystemFontOfSize:11]];
                [cTitle setTextColor:[UIColor grayColor]];
                [viewOfSection addSubview:cTitle];
                i=i+30;
                height=height+30;
                for (NSString *phone in contacts[@"phones"]){
                    
                    UILabel *cPhone = [[UILabel alloc] initWithFrame:CGRectMake(ident, 0, self.view.frame.size.width-40, i)];
                    [cPhone setText:phone];
                    [cPhone setFont:[UIFont fontWithName:@"Helvetica" size:11]];
                    [cPhone setTextColor:[UIColor grayColor]];
                    [viewOfSection addSubview:cPhone];
                    i=i+30;
                    height=height+30;
                }
                for (NSString *email in contacts[@"emails"]){
                    
                    UILabel *cEmail = [[UILabel alloc] initWithFrame:CGRectMake(ident, 0, self.view.frame.size.width-40, i)];
                    [cEmail setText:email];
                    [cEmail setFont:[UIFont fontWithName:@"Helvetica" size:11]];
                    [cEmail setTextColor:[UIColor grayColor]];
                    [viewOfSection addSubview:cEmail];
                    i=i+30;
                    height=height+30;
                    
                }
                i=i+20;
                
                
            }
            
            
            for (NSString *email in myitems[@"emails"]){
                UILabel *Email = [[UILabel alloc] initWithFrame:CGRectMake(ident, 0, self.view.frame.size.width-40, i)];
                [Email setText:email];
                [Email setFont:[UIFont fontWithName:@"Helvetica" size:11]];
                [Email setTextColor:[UIColor grayColor]];
                [viewOfSection addSubview:Email];
                i=i+30;
                height=height+30;
                
            }
            if ([myitems[@"web"] length] != 0) {
                UILabel *cWeb = [[UILabel alloc] initWithFrame:CGRectMake(ident, 0, self.view.frame.size.width-40, i)];
                [cWeb setText:myitems[@"web"]];
                [cWeb setFont:[UIFont fontWithName:@"Helvetica" size:11]];
                [cWeb setTextColor:[UIColor grayColor]];
                [viewOfSection addSubview:cWeb];
                i=i+30;
                height=height+30;
            }
            if ([myitems[@"facebook"] length] != 0) {
                UILabel *cFacebook = [[UILabel alloc] initWithFrame:CGRectMake(ident, 0, self.view.frame.size.width-40, i)];
                [cFacebook setText:myitems[@"facebook"]];
                [cFacebook setFont:[UIFont fontWithName:@"Helvetica" size:11]];
                [cFacebook setTextColor:[UIColor grayColor]];
                [viewOfSection addSubview:cFacebook];
            }
            
            i=i+60;
            
        }
        NSLog(@"%i -- %@",i,section[@"section"]);
        viewOfSection.frame = CGRectMake(0, 0, self.view.frame.size.width-40, height);
        KMSection *section3 = [[KMSection alloc] init];
        section3.view = viewOfSection;
        section3.title = [section[@"section"] capitalizedString];
        section3.colorForBackground = self.rowColor;
        section3.image = [UIImage imageNamed:@"Skype_Email"];
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
