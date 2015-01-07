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
              @[ @"-Bloqueador biodegradable",
                 @"-Repelente biodegradable",
                 @"-Pantalones de tela ligera o de campo",
                 @"-Ropa cómoda",
                 @"-Sandalias",
                 @"-Gorra",
                 @"-Cámara fotográfica",
                 @"-Traje de baño",
                 @"-Toalla",
                 @"-Opción de hospedaje en cabañas rústicas",
                 @"-Personas con alguna reacción alérgica de piquetes de insectos (mosquitos, tábanos, abejas) llevar consigo el medicamento de su preferencia"
                ]
          },
      
      
      @{
          @"section":@"FELIPE CARRILLO PUERTO",
          @"content":
              @[ @"-Bloqueador biodegradable",
                 @"-Repelente biodegradable",
                 @"-Pantalones de tela ligera o de campo",
                 @"-Ropa cómoda",
                 @"-Sandalias",
                 @"-Gorra",
                 @"-Cámara fotográfica",
                 @"-Traje de baño",
                 @"-Toalla",
                 @"-Opción de hospedaje en cabañas rústicas",
                 @"-Personas con alguna reacción alérgica de piquetes de insectos (mosquitos, tábanos, abejas) llevar consigo el medicamento de su preferencia",
                 @"-En el Santuario de la Cruz Parlante no esta permitido el acceso con zapatos, ni tomar fotografías"
                ]
          },
      
      
      @{
          @"section":@"KANTEMÓ",
          @"content":
              @[ @"-Repelente biodegradable",
                 @"-Zapatos cómodos",
                 @"-Pantalones",
                 @"-Cámara fotográfica o de video",
                 @"-Traje de baño",
                 @"-Toalla",
                 @"-Ropa para cambiarse",
                 @"-Binoculares",
                 @"-Personas con alguna reacción alérgica de piquetes de insectos (mosquitos, tábanos, abejas) llevar consigo el medicamento de su preferencia"
                ]
          },
      
      
      @{
          @"section":@"MUYIL",
          @"content":
              @[ @"-Bloqueador biodegradable",
                 @"-Repelente biodegradable",
                 @"-Ropa y zapatos cómodos",
                 @"-Gorra",
                 @"-Cámara fotográfica o de video",
                 @"-Traje de baño",
                 @"-Toalla",
                 @"-Ropa para cambiarse",
                 @"-Personas con alguna reacción alérgica de piquetes de insectos (mosquitos, tábanos, abejas) llevar consigo el medicamento de su preferencia"
                ]
          },
      
      
      @{
          @"section":@"NOH-BEC",
          @"content":
              @[ @"-Repelente biodegradable",
                 @"-Ropa y zapatos cómodos",
                 @"-Cámara fotográfica o de video",
                 @"-Traje de baño",
                 @"-Toalla",
                 @"-Ropa para cambiarse",
                 @"-Binoculares",
                 @"-Personas con alguna reacción alérgica de piquetes de insectos (mosquitos, tábanos, abejas) llevar consigo el medicamento de su preferencia"
                ]
          },
      
      
      @{
          @"section":@"PUNTA ALLEN",
          @"content":
              @[ @"-Bloqueador biodegradable",
                 @"-Repelente biodegradable",
                 @"-Ropa y zapatos cómodos",
                 @"-Gorra",
                 @"-Cámara fotográfica o de video",
                 @"-Traje de baño",
                 @"-Toalla",
                 @"-Ropa para cambiarse",
                 @"-Lentes para sol",
                 @"-Binoculares",
                 @"-Personas con alguna reacción alérgica de piquetes de insectos (mosquitos, tábanos, abejas) llevar consigo el medicamento de su preferencia"
                ]
          },
      
      
      @{
          @"section":@"PUNTA HERRERO",
          @"content":
              @[ @"-Repelente biodegradable",
                 @"-Ropa y zapatos cómodos",
                 @"-Cámara fotográfica o de video",
                 @"-Traje de baño",
                 @"-Toalla",
                 @"-Ropa para cambiarse",
                 @"-Binoculares",
                 @"-Personas con alguna reacción alérgica de piquetes de insectos (mosquitos, tábanos, abejas) llevar consigo el medicamento de su preferencia"
                ]
          },
      
      
      @{
          @"section":@"SEÑOR",
          @"content":
              @[ @"-Repelente biodegradable",
                 @"-Ropa y zapatos cómodos",
                 @"-Cámara fotográfica o de video",
                 @"-Traje de baño",
                 @"-Toalla",
                 @"-Ropa para cambiarse",
                 @"-Binoculares",
                 @"-Personas con alguna reacción alérgica de piquetes de insectos (mosquitos, tábanos, abejas) llevar consigo el medicamento de su preferencia"
                ]
          },
      
      
      @{
          @"section":@"TIHOSUCO",
          @"content":
              @[ @"-Ropa cómoda",
                 @"-Zapatos deportivos",
                 @"-Sandalias",
                 @"-Gorra",
                 @"-Cámara fotográfica",
                 @"-Personas con alguna reacción alérgica de piquetes de insectos (mosquitos, tábanos, abejas) llevar consigo el medicamento de su preferencia"
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
    NSMutableArray *generalItems = [[NSMutableArray alloc] init];

    NSArray *items =
        @[
          
          
            @{
                @"title":@"Ropa cómoda",
                @"image":@"tips_ropa_comoda.png"
            },
            @{
                @"title":@"Gorra",
                @"image":@"tips_gorra.png"
            },
            @{
                @"title":@"Bloqueador biodregadable",
                @"image":@"tips_bloqueador.png"
            },
            @{
                @"title":@"Traje de Baño",
                @"image":@"tips_traje_bano.png"
            },
            @{
                @"title":@"Cámara forográfica",
                @"image":@"tips_camara.png"
            },
            
            @{
                @"title":@"Llevar efectivo",
                @"image":@"tips_dinero.png"
            }
            
        ];
    for (NSArray *item in items ){
        [generalItems addObject:item];
    
    }

    
   
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    int iconWidth = 118;
    int iconHeight = 68;
    int initialMarginLeft = 10;
    int sectionHeight = 250;
    
    switch ((int) screenBounds.size.width) {
        case 320:
            iconWidth = 100;
            iconHeight = 58;
            NSLog(@"--5--");
            break;
        case 375:
            iconWidth = 118;
            iconHeight = 68;
            NSLog(@"--6--");
            break;
        case 414:
            NSLog(@"--6+--");
            iconWidth = 125;
            iconHeight = 72;
            initialMarginLeft = 20;
            sectionHeight = 300;
            break;
        default:
            break;
    }
    
    int iconMarginLeft = initialMarginLeft;
    int initialMarginTop = 20;
    int iconMarginTop = initialMarginTop;
    int labelWidth = iconWidth;
    int labelHeight = 40;
    int labelMarginTop = iconHeight+iconMarginTop;
    
    UIView *viewGeneralSection = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, sectionHeight)];
    //300
    //375
    //414
    
    
    
    NSLog(@"%@ -- %f",@"jon",screenBounds.size.width);

    //  initialMarginLeft = 18;
    
    
    int count = 1;
    for (NSDictionary *myItems in generalItems){
        
        UIImageView *tipIcon = [[UIImageView alloc] initWithFrame:CGRectMake(iconMarginLeft, iconMarginTop, iconWidth, iconHeight)];
        tipIcon.image = [UIImage imageNamed:myItems[@"image"]];
        //[tipIcon.layer setBorderColor: [[UIColor blackColor] CGColor]];
        //[tipIcon.layer setBorderWidth: 1.0];
        [viewGeneralSection addSubview:tipIcon];
        
        UILabel *tipLabel = [[UILabel alloc] initWithFrame:CGRectMake(iconMarginLeft, labelMarginTop, labelWidth, labelHeight)];
        tipLabel.text = myItems[@"title"];
        tipLabel.font = [UIFont systemFontOfSize:10];
        tipLabel.lineBreakMode = NSLineBreakByWordWrapping;
        tipLabel.numberOfLines = 0;
        tipLabel.textAlignment = NSTextAlignmentCenter;
        //[tipLabel.layer setBorderColor: [[UIColor redColor] CGColor]];
        //[tipLabel.layer setBorderWidth: 1.0];
        [viewGeneralSection addSubview:tipLabel];
        
        if (count == 3){
            labelMarginTop = (labelMarginTop*2)+iconMarginTop+initialMarginTop;
            iconMarginLeft = initialMarginLeft;
            iconMarginTop = iconHeight+labelHeight+(initialMarginTop*2);
        }
        else{
            iconMarginLeft = iconMarginLeft+iconWidth;
        }
        
       count++;
    }
    
    KMSection *section1 = [[KMSection alloc] init];
    section1.view = viewGeneralSection;
    section1.title = @"General";
    section1.colorForBackground = self.rowColor;
    
     [listArray  addObject:section1];
   
    for (NSDictionary *section in self.items ){
        
        UIView *viewOfSection = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 0)];
        int i = 30;
        int height = 0;
        for (NSString *myitems in section[@"content"]){
            
            UILabel *cSubsection = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, self.view.frame.size.width, i)];
            [cSubsection setText:myitems];
            [cSubsection setFont:[UIFont boldSystemFontOfSize:12]];
            [cSubsection setTextColor:[UIColor grayColor]];
            [viewOfSection addSubview:cSubsection];
            i=i+30;
            height=height+30;
            
            
            
        }
       
        viewOfSection.frame = CGRectMake(0, 0, self.view.frame.size.width, height);
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
