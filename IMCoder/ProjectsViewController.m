//
//  ProjectsViewController.m
//  IMCoder
//
//  Created by iMokhles on 16/03/2017.
//  Copyright © 2017 iMokhles. All rights reserved.
//

#import "ProjectsViewController.h"
#import "IMCMakerHelper.h"
#import "IMProjectCell.h"
#import "IMConstants.h"
#import "IMProject.h"

@interface ProjectsViewController () <UITableViewDelegate, UITableViewDataSource> {
    NSArray *projectsArray;
}
@property (strong, nonatomic) IBOutlet UITableView *mainTableView;
@end

@implementation ProjectsViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if (IS_IPAD) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateTable) name:kReloadTableNotification object:nil];
    }
    [self updateTable];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)updateTable {
    dispatch_async(dispatch_get_main_queue(), ^{
        projectsArray = [[IMCMakerHelper sharedInstance] fetchAllProjects];
        [self.mainTableView reloadData];
    });
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return projectsArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    IMProjectCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([IMProjectCell class])];
    IMProject *project = [projectsArray objectAtIndex:indexPath.row];
    [cell configureCellWithProject:project];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    IMProject *project = [projectsArray objectAtIndex:indexPath.row];
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        if ([[IMCMakerHelper sharedInstance] deleteProject:project]) {
            [self updateTable];
        }
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
