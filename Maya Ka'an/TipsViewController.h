//
//  TipsViewController.h
//  Maya Ka'an
//
//  Created by Punk on 1/5/15.
//  Copyright (c) 2015 Punk E-Marketing & Consulting. All rights reserved.
//

#import "KMAccordionTableViewController.h"

@interface TipsViewController : KMAccordionTableViewController
@property (nonatomic,strong)  UIColor *rowColor;
@property (strong, nonatomic) IBOutlet UITableView *myTable;
@property (nonatomic,strong) NSMutableArray *items;

@end
