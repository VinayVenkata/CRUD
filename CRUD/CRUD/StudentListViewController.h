//
//  StudentListViewController.h
//  CRUD
//
//  Created by Vinay Ponnuri on 9/20/17.
//  Copyright © 2017 Vinay Ponnuri. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NamesTableViewCell.h"
#import "AppDelegate.h"
#import "StudentEntity+CoreDataClass.h"

@interface StudentListViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *studentList;

- (IBAction)filterButtonClicked:(UISegmentedControl *)sender;

@end
