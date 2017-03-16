//
//  AppDelegate.h
//  IMCoder
//
//  Created by iMokhles on 16/03/2017.
//  Copyright © 2017 iMokhles. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

