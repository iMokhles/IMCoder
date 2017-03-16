//
// Created by iMokhles on 16/03/2017.
// Copyright (c) 2017 iMokhles. All rights reserved.
//

#import "IMProject.h"
#import "IMConstants.h"

@implementation IMProject

+ (NSFetchRequest<IMProject *> *)fetchRequest {
    return [[NSFetchRequest alloc] initWithEntityName:kProjectEntityName];
}
+ (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}
+ (id)initAsNewObject {
    return [NSEntityDescription insertNewObjectForEntityForName:kProjectEntityName inManagedObjectContext:[self managedObjectContext]];
}
@dynamic type;
@dynamic name;
@dynamic id;
@dynamic author;
@dynamic short_description;
@dynamic bundle_id;
@dynamic filters;
@dynamic executables;
@dynamic include_mode_any;

- (NSArray *)executables {
    if (!self.executables)
        return nil;
    
    return [NSKeyedUnarchiver unarchiveObjectWithData:self.executables];
}
- (void)setExecutables:(id)executables {
    NSData *executables_data = [NSKeyedArchiver archivedDataWithRootObject:executables];
    [self setValue:executables_data forKey:@"executables"];
}

- (NSArray *)filters {
    if (!self.filters)
        return nil;
    
    return [NSKeyedUnarchiver unarchiveObjectWithData:self.filters];
}
- (void)setFilters:(id)filters {
    NSData *filters_data = [NSKeyedArchiver archivedDataWithRootObject:filters];
    [self setValue:filters_data forKey:@"filters"];
}
@end
