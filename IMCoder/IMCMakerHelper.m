//
//  IMCMakerHelper.m
//  IMCoder
//
//  Created by iMokhles on 16/03/2017.
//  Copyright © 2017 iMokhles. All rights reserved.
//

#import "IMCMakerHelper.h"


@implementation IMCMakerHelper
+ (instancetype)sharedInstance {
    
    DEFINE_SHARED_INSTANCE_GCD_USING_BLOCK(^{
        return [[IMCMakerHelper alloc] init];
    })
}

- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}

- (NSFetchRequest *)requestWithBundleId:(NSString *)bundle_id {
    NSFetchRequest *request = [IMProject fetchRequest];
    NSPredicate *predicate = [NSPredicate predicateWithFormat: @"bundle_id == %@", bundle_id];
    [request setPredicate:predicate];
    
    return request;
}
- (NSFetchRequest *)requestAll {
    NSFetchRequest *request = [IMProject fetchRequest];
    return request;
}
- (NSArray *)fetchAllProjects {
    NSManagedObjectContext *context = [self managedObjectContext];
    NSFetchRequest *request = [self requestAll];
    NSError *error = nil;
    NSArray *array = [context executeFetchRequest:request error:&error];
    if (error == nil) {
        return array;
    } else {
        IMCLog(@"Can't Fetch! %@ %@", error, [error localizedDescription]);
        return nil;
    }
}
- (void)createProject {
    NSManagedObjectContext *context = [self managedObjectContext];
    NSError *error = nil;
    // Save the object to persistent store
    if (![context save:&error]) {
        IMCLog(@"Can't Create! %@ %@", error, [error localizedDescription]);
    }
    
    
}
- (IMProject *)readProject:(NSString *)bundle_id {
    NSManagedObjectContext *context = [self managedObjectContext];
    NSFetchRequest *request = [self requestWithBundleId:bundle_id];
    NSError *error = nil;
    NSArray *array = [context executeFetchRequest:request error:&error];
    if (error == nil) {
        IMProject *project = [array objectAtIndex:0];
        return project;
    } else {
        IMCLog(@"Can't Read! %@ %@", error, [error localizedDescription]);
        return nil;
    }
}
- (BOOL)updateProject:(IMProject *)project {
    NSManagedObjectContext *context = [self managedObjectContext];
    NSFetchRequest *request = [self requestWithBundleId:project.bundle_id];
    NSError *error = nil;
    NSArray *array = [context executeFetchRequest:request error:&error];
    if (error == nil) {
        IMProject *projectFetched = [array objectAtIndex:0];
        projectFetched = project;
        NSError *error = nil;
        // Save the object to persistent store
        if (![context save:&error]) {
            IMCLog(@"Can't Update! %@ %@", error, [error localizedDescription]);
            return NO;
        }
        return YES;
    } else {
        IMCLog(@"Can't Update! %@ %@", error, [error localizedDescription]);
        return NO;
    }
}
- (BOOL)deleteProject:(IMProject *)project {
    NSManagedObjectContext *context = [self managedObjectContext];
    NSFetchRequest *request = [self requestWithBundleId:project.bundle_id];
    NSError *error = nil;
    NSArray *array = [context executeFetchRequest:request error:&error];
    if (error == nil) {
        IMProject *projectFetched = [array objectAtIndex:0];
        [context deleteObject:projectFetched];
        NSError *error2 = nil;
        if (![context save:&error2]) {
            IMCLog(@"Can't Delete! %@ %@", error, [error localizedDescription]);
            return NO;
        }
        return YES;
    } else {
        IMCLog(@"Can't Delete! %@ %@", error, [error localizedDescription]);
        return NO;
    }
}
@end
