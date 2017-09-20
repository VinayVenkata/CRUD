//
//  AppDelegate.h
//  CRUD
//
//  Created by Vinay Ponnuri on 9/20/17.
//  Copyright © 2017 Vinay Ponnuri. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

