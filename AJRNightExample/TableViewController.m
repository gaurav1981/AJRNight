//
//  TableViewController.m
//  AJRNight
//
//  Created by Amar Ramachandran on 8/16/15.
//  Copyright © 2015 amarjayr. All rights reserved.
//

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


#import "TableViewController.h"

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.titleTextAttributes = @{};
    self.tableView.backgroundColor = [UIColor whiteColor];
    
    [[UITableViewCell appearance] setNightProperties:@{
                                                       @"backgroundColor": UIColorFromRGB(0x343338)
                                                       }];
    
    self.tableView.nightProperties = @{
                                       @"backgroundColor": UIColorFromRGB(0x343338),
                                       @"separatorColor": UIColorFromRGB(0x2C282E)
                                       };
    
    self.navigationController.navigationBar.nightProperties = @{
                                                                @"barTintColor": UIColorFromRGB(0x2F2D34),
                                                                @"titleTextAttributes": @{NSForegroundColorAttributeName: [UIColor whiteColor]}
                                                                };
    
    [[AJRNight sharedClient] addViewController:self];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if([[AJRNight sharedClient] isNight])
        [cell goodNight];
    else
        [cell goodMorning];
}

- (void)goodNight {
    [self.navigationController.navigationBar goodNight];
    [self.tabBarController.tabBar goodNight];
}

- (void)goodMorning {
    [self.navigationController.navigationBar goodMorning];
    [self.tabBarController.tabBar goodMorning];
}

@end
