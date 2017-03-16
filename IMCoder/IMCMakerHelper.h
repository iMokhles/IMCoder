//
//  IMCMakerHelper.h
//  IMCoder
//
//  Created by iMokhles on 16/03/2017.
//  Copyright © 2017 iMokhles. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "IMCHeader.h"
#import "IMConstants.h"
#import "IMProject.h"

@interface IMCMakerHelper : NSObject
+ (instancetype)sharedInstance;

// project CRUD
- (NSArray *)fetchAllProjects;
- (void)createProject;
- (IMProject *)readProject:(NSString *)bundle_id;
- (BOOL)updateProject:(IMProject *)project;
- (BOOL)deleteProject:(IMProject *)project;
@end
