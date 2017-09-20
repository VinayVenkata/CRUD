//
//  ViewController.m
//  CRUD
//
//  Created by Vinay Ponnuri on 9/20/17.
//  Copyright © 2017 Vinay Ponnuri. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)saveClicked:(UIButton *)sender {
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    NSManagedObjectContext *context = delegate.persistentContainer.viewContext;
    
    StudentEntity *saveData = [NSEntityDescription insertNewObjectForEntityForName:@"StudentEntity" inManagedObjectContext:context];
    
    saveData.name = self.nameTxt.text;
    saveData.emai = self.emailTxt.text;
    saveData.phone = self.phoneTxt.text;
    saveData.gender = self.gender.text;
    
    NSError *save;
    if ([context save:&save]) {
        NSLog(@"save successfully");
    }else{
        NSLog(@"not saved");
    }
    
}

- (IBAction)getClicked:(UIButton *)sender {
    
}
@end
