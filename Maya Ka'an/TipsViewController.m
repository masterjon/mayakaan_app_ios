//
//  TipsViewController.m
//  Maya Ka'an
//
//  Created by Punk on 1/5/15.
//  Copyright (c) 2015 Punk E-Marketing & Consulting. All rights reserved.
//

#import "TipsViewController.h"

@interface TipsViewController () <KMAccordionTableViewControllerDataSource,KMAccordionTableViewControllerDelegate>
@property (nonatomic,strong) UIView *viewGeneralSection;
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
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter]
     addObserver:self selector:@selector(orientationChanged:)
     name:UIDeviceOrientationDidChangeNotification
     object:[UIDevice currentDevice]];
    self.items = [[NSMutableArray alloc] init];
    NSArray *directoryItems=
    @[
      
      @{
          @"section":@"CHUNHUHUB",
          @"content":
              @[
                 NSLocalizedString(@"-Zapatos cómodos y Sandalias",nil),
                 NSLocalizedString(@"-Toalla",nil),
                 NSLocalizedString(@"-Opción de hospedaje en cabañas rústicas",nil),
                 NSLocalizedString(@"-Personas con alguna reacción alérgica de piquetes de insectos (mosquitos, tábanos, abejas) llevar consigo el medicamento de su preferencia",nil),
                 NSLocalizedString(@"-En el centro ecoturístico NO hay señal móvil ni Internet",nil)
                ]
          },
      
      
      @{
          @"section":@"FELIPE CARRILLO PUERTO",
          @"content":
              @[ NSLocalizedString(@"-Zapatos cómodos y Sandalias",nil),
                 NSLocalizedString(@"-Toalla",nil),
                 NSLocalizedString(@"-Opción de hospedaje en cabañas rústicas",nil),
                 NSLocalizedString(@"-Personas con alguna reacción alérgica de piquetes de insectos (mosquitos, tábanos, abejas) llevar consigo el medicamento de su preferencia",nil),
                 NSLocalizedString(@"-En el Santuario de la Cruz Parlante no esta permitido el acceso con zapatos, ni tomar fotografías sin autorización",nil),
                 NSLocalizedString(@"-En el centro ecoturístico NO hay señal móvil ni Internet", nill)
                ]
          },
      
      
      @{
          @"section":@"KANTEMÓ",
          @"content":
              @[
                 NSLocalizedString(@"-Zapatos cómodos",nil),
                 NSLocalizedString(@"-Pantalones largos",nil),
                 NSLocalizedString(@"-Lámpara",nil),
                 NSLocalizedString(@"-Personas con alguna reacción alérgica de piquetes de insectos (mosquitos, tábanos, abejas) llevar consigo el medicamento de su preferencia",nil),
                 NSLocalizedString(@"-No están permitidas las fotografías con flash ya que perturban a las especies", nill)
                ]
          },
      
      
      @{
          @"section":@"MUYIL",
          @"content":
              @[ NSLocalizedString(@"-Zapatos cómodos y Sandalias",nil),
                 NSLocalizedString(@"-Toalla",nil),
                 NSLocalizedString(@"-Ropa para cambiarse",nil),
                 NSLocalizedString(@"-Personas con alguna reacción alérgica de piquetes de insectos (mosquitos, tábanos, abejas) llevar consigo el medicamento de su preferencia",nil),
                 NSLocalizedString(@"-Se aceptan tarjetas de crédito",nil),
                 NSLocalizedString(@"-En la comunidad NO hay señal móvil ni Internet",nil),
                ]
          },
      
      
      @{
          @"section":@"NOH-BEC",
          @"content":
              @[ NSLocalizedString(@"-Zapatos cómodos y Sandalias",nil),
                 NSLocalizedString(@"-Toalla",nil),
                 NSLocalizedString(@"-Personas con alguna reacción alérgica de piquetes de insectos (mosquitos, tábanos, abejas) llevar consigo el medicamento de su preferencia",nil),
                 NSLocalizedString(@"-En la comunidad NO hay señal móvil",nil)
                ]
          },
      
      @{
          @"section":@"BAHÍA DEL ESPÍRITU SANTO",
          @"content":
              @[ NSLocalizedString(@"-Zapatos cómodos y Sandalias",nil),
                 NSLocalizedString(@"-Toalla",nil),
                 NSLocalizedString(@"-Personas con alguna reacción alérgica de piquetes de insectos (mosquitos, tábanos, abejas) llevar consigo el medicamento de su preferencia",nil),
                 NSLocalizedString(@"-En la comunidad NO hay señal móvil ni Internet",nil),
                 NSLocalizedString(@"-La comunidad no cuenta con energía eléctrica, únicamente solar por lo que las horas de luz son limitadas",nil)
                 ]
          },
      
      
      @{
          @"section":@"PUNTA ALLEN",
          @"content":
              @[ NSLocalizedString(@"-Zapatos cómodos y Sandalias",nil),
                 NSLocalizedString(@"-Toalla",nil),
                 NSLocalizedString(@"-Personas con alguna reacción alérgica de piquetes de insectos (mosquitos, tábanos, abejas) llevar consigo el medicamento de su preferencia",nil),
                 NSLocalizedString(@"-En la comunidad NO hay señal móvil ni Internet",nil),
                 NSLocalizedString(@"-Solo hay luz eléctrica en ciertos horarios del día", nil)
                ]
          },
      
      

      
      
      @{
          @"section":@"SEÑOR",
          @"content":
              @[
                 NSLocalizedString(@"-Zapatos cómodos",nil),
                 NSLocalizedString(@"-Personas con alguna reacción alérgica de piquetes de insectos (mosquitos, tábanos, abejas) llevar consigo el medicamento de su preferencia",nil)
                ]
          },
      
      
      @{
          @"section":@"TIHOSUCO",
          @"content":
              @[ NSLocalizedString(@"-Zapatos cómodos",nil),
                 NSLocalizedString(@"-Personas con alguna reacción alérgica de piquetes de insectos (mosquitos, tábanos, abejas) llevar consigo el medicamento de su preferencia",nil)
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
   // [self setHeaderArrowImageClosed:[UIImage imageNamed:@"carat-open"]];
   // [self setHeaderArrowImageOpened:[UIImage imageNamed:@"carat"]];
    [self setHeaderFont:[UIFont  boldSystemFontOfSize:16]];
    [self setHeaderTitleColor:[UIColor whiteColor]];
    [self setHeaderSeparatorColor:[UIColor whiteColor]];
    [self setHeaderColor:[UIColor colorWithRed:0.114 green:0.114 blue:0.114 alpha:1]]; //general background color for all of the sections
    [self setOneSectionAlwaysOpen:YES]; // set if one section should always be open. if set to YES, the VC will load with the first section already open, and the open section will not close unless you click a different section
}

- (void)teste {
    KMSection *section = self.sections[2];
    
    UIView *view = section.view;
    view.frame = CGRectMake(0, 0, 320, 400);
    [self reloadOpenedSection];
}

- (NSArray *)getSectionArray {
    
    
    
   

    NSMutableArray *listArray = [[NSMutableArray alloc] init];
    
/*
    UITableView *testSection = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 300)];
    KMSection *section0 = [[KMSection alloc] init];
    section0.view = testSection;
    section0.title = @"Test";
    section0.colorForBackground = self.rowColor;
    //Update data source with the object that you need to add
   UITableViewCell *firstNameCell = [[UITableViewCell alloc] init];
    firstNameCell.backgroundColor = [UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:0.5f];
    UILabel *firstNameText = [[UILabel alloc]initWithFrame:CGRectInset(firstNameCell.contentView.bounds, 15, 0)];
    firstNameText.text = @"Personas con alguna reacción alérgica de piquetes de insectos (mosquitos, tábanos, abejas) llevar consigo el medicamento de su preferencia";
    firstNameText.font = [UIFont systemFontOfSize:16];
    firstNameText.lineBreakMode = NSLineBreakByWordWrapping;
    firstNameText.numberOfLines = 0;
    [firstNameText sizeToFit];
    [firstNameCell addSubview:firstNameText];
    [firstNameCell sizeToFit];
    [testSection addSubview:firstNameCell];
    [listArray  addObject:section0];
 */
    NSMutableArray *generalItems = [[NSMutableArray alloc] init];

    NSArray *items =
        @[
          
          
            @{
                @"title":NSLocalizedString(@"Ropa cómoda",nil),
                @"image":@"tips_ropa_comoda.png"
            },
            @{
                @"title":NSLocalizedString(@"Gorra",nil),
                @"image":@"tips_gorra.png"
            },
            @{
                @"title":NSLocalizedString(@"Bloqueador biodregadable",nil),
                @"image":@"tips_bloqueador.png"
            },
            @{
                @"title":NSLocalizedString(@"Traje de Baño",nil),
                @"image":@"tips_traje_bano.png"
            },
            @{
                @"title":NSLocalizedString(@"Cámara forográfica",nil),
                @"image":@"tips_camara.png"
            },
            
            @{
                @"title":NSLocalizedString(@"Llevar efectivo",nil),
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
            NSLog(@"--6--667");
            break;
        case 414:
            NSLog(@"--6+--667");
            iconWidth = 125;
            iconHeight = 72;
            initialMarginLeft = 20;
            sectionHeight = 300;
            break;
        default:
            break;
    }
    NSLog(@"%i",(int) screenBounds.size.width);
    NSLog(@"%i",(int) screenBounds.size.height);
    
    int iconMarginLeft = initialMarginLeft;
    int initialMarginTop = 20;
    int iconMarginTop = initialMarginTop;
    int labelWidth = iconWidth;
    int labelHeight = 40;
    int labelMarginTop = iconHeight+iconMarginTop;
    
    self.viewGeneralSection = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, sectionHeight)];
    //300
    //375
    //414
    
    
    
    //NSLog(@"%@ -- %f",@"jon",screenBounds.size.width);

    //  initialMarginLeft = 18;
    
    
    int count = 1;
    for (NSDictionary *myItems in generalItems){
        
        UIImageView *tipIcon = [[UIImageView alloc] initWithFrame:CGRectMake(iconMarginLeft, iconMarginTop, iconWidth, iconHeight)];
        tipIcon.image = [UIImage imageNamed:myItems[@"image"]];
        //[tipIcon.layer setBorderColor: [[UIColor blackColor] CGColor]];
        //[tipIcon.layer setBorderWidth: 1.0];
        [self.viewGeneralSection addSubview:tipIcon];
        
        UILabel *tipLabel = [[UILabel alloc] initWithFrame:CGRectMake(iconMarginLeft, labelMarginTop, labelWidth, labelHeight)];
        tipLabel.text = myItems[@"title"];
        tipLabel.font = [UIFont systemFontOfSize:12];
        tipLabel.textColor = [UIColor grayColor];
        tipLabel.lineBreakMode = NSLineBreakByWordWrapping;
        tipLabel.numberOfLines = 0;
        tipLabel.textAlignment = NSTextAlignmentCenter;
        //[tipLabel.layer setBorderColor: [[UIColor redColor] CGColor]];
        //[tipLabel.layer setBorderWidth: 1.0];
        [self.viewGeneralSection addSubview:tipLabel];
        
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
    section1.view = self.viewGeneralSection;
    section1.title = @"General";
    section1.colorForBackground = self.rowColor;
    
     [listArray  addObject:section1];
 
    for (NSDictionary *section in self.items ){
        
        UIView *viewOfSection = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 0)];
        int i = 10;
        int height = 0;
        for (NSString *myitems in section[@"content"]){
            UILabel *cSubsection = [[UILabel alloc] init];
            cSubsection.lineBreakMode = NSLineBreakByWordWrapping;
            cSubsection.numberOfLines = 0;
           
            [cSubsection setText:myitems];
            [cSubsection setFont:[UIFont systemFontOfSize:14]];
            [cSubsection setTextColor:[UIColor grayColor]];
            //[cSubsection.layer setBorderWidth: 1.0];
            [viewOfSection addSubview:cSubsection];
            NSStringDrawingContext *context = [[NSStringDrawingContext alloc] init];
            CGSize labelSize = (CGSize){self.view.frame.size.width, 999};
            CGRect r = [cSubsection.text boundingRectWithSize:labelSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:16]} context:context];
            if (r.size.height >= 20.00){
                cSubsection.frame = CGRectMake(10, i, self.view.frame.size.width-10, r.size.height);
                i=i+r.size.height;
                 height=height+r.size.height+15;
            }
            else{
                cSubsection.frame = CGRectMake(10, i, self.view.frame.size.width-10, r.size.height);
                i=i+r.size.height;
                 height=height+r.size.height;
                
            }
           // NSLog(@"%f",r.size.height);
            
            // NSLog(@"%i",i);
            
            
            
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
- (void) orientationChanged:(NSNotification *)note
{
    UIDevice * device = note.object;
    switch(device.orientation)
    {
        case UIDeviceOrientationLandscapeLeft:{
            CGRect screenBounds = [[UIScreen mainScreen] bounds];
            switch ((int) screenBounds.size.height) {
                case 320:
                    self.viewGeneralSection.frame = CGRectMake(100, 0, self.viewGeneralSection.frame.size.width, self.viewGeneralSection.frame.size.height);
                    break;
                case 375:
                    self.viewGeneralSection.frame = CGRectMake(125, 0, self.viewGeneralSection.frame.size.width, self.viewGeneralSection.frame.size.height);
                    break;
                case 414:
                    self.viewGeneralSection.frame = CGRectMake(150, 0, self.viewGeneralSection.frame.size.width, self.viewGeneralSection.frame.size.height);
                    
                    break;
                default:
                    break;
            }
            
            break;
        }
        case UIDeviceOrientationLandscapeRight:{
            CGRect screenBounds = [[UIScreen mainScreen] bounds];
            switch ((int) screenBounds.size.height) {
                case 320:
                    self.viewGeneralSection.frame = CGRectMake(100, 0, self.viewGeneralSection.frame.size.width, self.viewGeneralSection.frame.size.height);
                    break;
                case 375:
                    self.viewGeneralSection.frame = CGRectMake(125, 0, self.viewGeneralSection.frame.size.width, self.viewGeneralSection.frame.size.height);
                    break;
                case 414:
                    self.viewGeneralSection.frame = CGRectMake(175, 0, self.viewGeneralSection.frame.size.width, self.viewGeneralSection.frame.size.height);

                    break;
                default:
                    break;
            }

            break;
        }
        case UIDeviceOrientationPortrait:
            self.viewGeneralSection.frame = CGRectMake(0, 0, self.viewGeneralSection.frame.size.width, self.viewGeneralSection.frame.size.height);
           
            break;
        default:
            break;
    };
}

- (void)accordionTableViewControllerSectionDidClosed:(KMSection *)section
{
    NSLog(@"%s",__PRETTY_FUNCTION__);
}

- (void)accordionTableViewControllerSectionDidOpened:(KMSection *)section
{
    NSLog(@"%s",__PRETTY_FUNCTION__);
}



@end
