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
    self.items = [[NSMutableArray alloc] init];
    NSArray *directoryItems=
                @[
                   @{
                       @"title":@"Kiichpam K’áax (Selva Bonita) Cooperativa",
                       @"phone":@"+52 (983) 114 31 21"
                    },
                   @{
                       @"title":@"Damian Leonel Gómez Xool.",
                       @"phone":@"+521 (983) 113 28 82"}
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

    UIView *viewOfSection1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 500)];
    viewOfSection1.backgroundColor = [UIColor grayColor];
    KMSection *section1 = [[KMSection alloc] init];
    section1.view = viewOfSection1;
    section1.title = [@"CHUNHUHUB" capitalizedString];
    
    section1.colorForBackground = self.rowColor; // individual background color for a specific section, overrides the general color if set
    section1.image = [UIImage imageNamed:@"icono-escapadas"];
    
    UIView *minhaview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    minhaview.backgroundColor = [UIColor redColor];
    section1.overHeaderView = minhaview;
    
    UIView *viewOfSection2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 300)];
    viewOfSection2.backgroundColor = [UIColor redColor];
    KMSection *section2 = [[KMSection alloc] init];
    section2.view = viewOfSection2;
    section2.title = [@"FELIPE CARRILLO PUERTO" capitalizedString];
    section2.colorForBackground = self.rowColor;
    section2.image = [UIImage imageNamed:@"linkdin_Email"];
    
    UIView *viewOfSection3 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
    
   // UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
   // [button setTitle:@"click meeeeeee" forState:UIControlStateNormal];
   // [button addTarget:self action:@selector(teste) forControlEvents:UIControlEventTouchUpInside];
   // [viewOfSection3 addSubview:button];
    
    
    
    
    int i= 50;
    for (NSDictionary *myitems in self.items){
        NSLog(@"%i",i);
        UILabel *cTitle = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 320, i)];
        [cTitle setText:myitems[@"title"]];
        [cTitle setFont:[UIFont boldSystemFontOfSize:11]];
        [cTitle setTextColor:[UIColor grayColor]];
        [viewOfSection3 addSubview:cTitle];
        
        UILabel *cPhone = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, self.view.frame.size.width, i+30)];
        [cPhone setText:myitems[@"phone"]];
        [cPhone setFont:[UIFont fontWithName:@"Helvetica" size:11]];
        [cPhone setTextColor:[UIColor grayColor]];
        [viewOfSection3 addSubview:cPhone];
        i=i+80;
        NSLog(@"%i",i);
    }
    
    
    KMSection *section3 = [[KMSection alloc] init];
    section3.view = viewOfSection3;
    section3.title = [@"KANTEMÓ" capitalizedString];
    section3.colorForBackground = self.rowColor;
    section3.image = [UIImage imageNamed:@"Skype_Email"];
    
    UIView *viewOfSection5 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 300)];
    viewOfSection5.backgroundColor = [UIColor redColor];
    KMSection *section5 = [[KMSection alloc] init];
    section5.view = viewOfSection5;
    section5.title = [@"MUYIL" capitalizedString];
    section5.colorForBackground = self.rowColor;
    section5.image = [UIImage imageNamed:@"facebook_email"];
    
    UIView *viewOfSection6 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 700)];
    viewOfSection6.backgroundColor = [UIColor greenColor];
    KMSection *section6 = [[KMSection alloc] init];
    section6.view = viewOfSection6;
    section6.title = [@"NOH-BEC" capitalizedString];
    section6.colorForBackground = self.rowColor;
    section6.image = [UIImage imageNamed:@"Skype_Email"];
    
    UIView *viewOfSection7 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 700)];
    viewOfSection7.backgroundColor = [UIColor greenColor];
    KMSection *section7 = [[KMSection alloc] init];
    section7.view = viewOfSection7;
    section7.title = [@"PUNTA ALLEN" capitalizedString];
    section7.colorForBackground = self.rowColor;
    section7.image = [UIImage imageNamed:@"Skype_Email"];

    
    UIView *viewOfSection8 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 700)];
    viewOfSection8.backgroundColor = [UIColor colorWithRed:0.216 green:0.773 blue:0.847 alpha:1]; /*#37c5d8*/
    KMSection *section8 = [[KMSection alloc] init];
    section8.view = viewOfSection8;
    section8.title = [@"TIHOSUCO" capitalizedString];
    section8.colorForBackground = self.rowColor; /*#37c5d8*/
    section8.image = [UIImage imageNamed:@"Skype_Email"];

    
    UIView *viewOfSection9 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 700)];
    viewOfSection9.backgroundColor = [UIColor whiteColor];
    KMSection *section9 = [[KMSection alloc] init];
    section9.view = viewOfSection9;
    section9.title = [@"NOH-BEC" capitalizedString];
    section9.colorForBackground = self.rowColor;
    section9.image = [UIImage imageNamed:@"Skype_Email"];

    
    return @[section1, section2, section3, section5, section6, section7, section8, section9];
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

