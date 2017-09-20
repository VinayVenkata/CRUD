//
//  ViewController.h
//  CRUD
//
//  Created by Vinay Ponnuri on 9/20/17.
//  Copyright © 2017 Vinay Ponnuri. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "CRUD+CoreDataModel.h"
#import <CoreData/CoreData.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *nameTxt;
@property (weak, nonatomic) IBOutlet UITextField *emailTxt;
@property (weak, nonatomic) IBOutlet UITextField *phoneTxt;
@property (weak, nonatomic) IBOutlet UITextField *gender;

- (IBAction)saveClicked:(UIButton *)sender;
- (IBAction)getClicked:(UIButton *)sender;

@end

