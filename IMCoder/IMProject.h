//
// Created by iMokhles on 16/03/2017.
// Copyright (c) 2017 iMokhles. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface IMProject : NSManagedObject

+ (NSFetchRequest<IMProject *> *)fetchRequest;
+ (id)initAsNewObject;

@property (nonatomic) int32_t type;
@property (nullable, nonatomic, copy) NSString *name;
@property (nonatomic) int32_t id;
@property (nullable, nonatomic, copy) NSString *author;
@property (nullable, nonatomic, copy) NSString *short_description;
@property (nullable, nonatomic, copy) NSString *bundle_id;
@property (nullable, nonatomic, retain) id filters;
@property (nullable, nonatomic, retain) id executables;
@property (nonatomic) BOOL include_mode_any;

@end

NS_ASSUME_NONNULL_END
