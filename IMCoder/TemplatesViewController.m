//
//  TemplatesViewController.m
//  IMCoder
//
//  Created by iMokhles on 16/03/2017.
//  Copyright © 2017 iMokhles. All rights reserved.
//

#import "TemplatesViewController.h"
#import "IMTemplateCell.h"
#import "IMTemplateFieldCell.h"
#import "IMProject.h"
#import "IMCMakerHelper.h"

@interface TemplatesViewController () <UITableViewDelegate, UITableViewDataSource> {
    NSArray *templatesArray;
    NSArray *fieldsArray;
    BOOL isTemplates;
    
    NSInteger templateSelected;
    
    // fields
    NSString *nameString;
    NSString *bundle_idString;
    NSString *short_descriptionString;
    NSString *authorString;
    NSArray *filtersArray;
}
@property (strong, nonatomic) IBOutlet UITableView *mainTableView;
@property (strong, nonatomic) IBOutlet UIButton *createButton;
@end

@implementation TemplatesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    isTemplates = YES;
    [self.createButton setTitle:@"Next" forState:UIControlStateNormal];
    
    
    templatesArray = @[
                       @"Tweak",
                       @"Library",
                       @"Tool",
                       @"Application",
                       @"Preferences"];
    
    fieldsArray = @[
                    @"Project Name",
                    @"Bundle ID",
                    @"Short Description",
                    @"Author",
                    @"Filters"];
    [self updateTable];
}
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}
- (void)updateTable {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.mainTableView reloadData];
    });
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (!isTemplates) {
        return @"Configurations";
    }
    return @"Templates";
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (!isTemplates) {
        return fieldsArray.count;
    }
    return templatesArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (!isTemplates) {
        IMTemplateFieldCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([IMTemplateFieldCell class])];
        [cell configureWithTitle:[fieldsArray objectAtIndex:indexPath.row]];
        switch (indexPath.row) {
            case 0: {
                [cell setTextFieldDidEndEditingBlock:^(IMTemplateFieldCell *cell, UITextField *field) {
                    nameString = field.text;
                }];
            }
                break;
            case 1: {
                [cell setTextFieldDidEndEditingBlock:^(IMTemplateFieldCell *cell, UITextField *field) {
                    bundle_idString = field.text;
                }];
            }
                break;
            case 2: {
                [cell setTextFieldDidEndEditingBlock:^(IMTemplateFieldCell *cell, UITextField *field) {
                    short_descriptionString = field.text;
                }];
            }
                break;
            case 3: {
                [cell setTextFieldDidEndEditingBlock:^(IMTemplateFieldCell *cell, UITextField *field) {
                    authorString = field.text;
                }];
            }
                break;
            case 4: {
                [cell setTextFieldDidEndEditingBlock:^(IMTemplateFieldCell *cell, UITextField *field) {
                    filtersArray = [field.text componentsSeparatedByString:@","];
                }];
            }
                break;
            default:
                break;
        }
        return cell;
    } else {
        IMTemplateCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([IMTemplateCell class])];
        [cell configureWithTemplateName:[templatesArray objectAtIndex:indexPath.row]];
        if (indexPath.row == templateSelected) {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        } else {
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
        return cell;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath   *)indexPath
{
    if (isTemplates) {
        templateSelected = indexPath.row;
        [self updateTable];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (IBAction)createButtonTapped:(UIButton *)sender {
    if (isTemplates) {
        isTemplates = NO;
        [self.createButton setTitle:@"Create" forState:UIControlStateNormal];
        [self updateTable];
    } else {
        isTemplates = YES;
        [self.createButton setTitle:@"Next" forState:UIControlStateNormal];
        
        IMTemplateFieldCell *filtersCell = [self.mainTableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:4 inSection:0]];
        filtersArray = [filtersCell.textField.text componentsSeparatedByString:@","];
        IMProject *newProject = [IMProject initAsNewObject];
        newProject.name = nameString;
        newProject.bundle_id = bundle_idString;
        newProject.short_description = short_descriptionString;
        newProject.author = authorString;
        newProject.filters = filtersArray;
        newProject.executables = @[@"SpringBoard"];
        newProject.id = [[NSDate date] timeIntervalSince1970];
        newProject.include_mode_any = NO;
        newProject.type = (int)templateSelected;
        
        [[IMCMakerHelper sharedInstance] createProject];
        if (IS_IPAD) {
            [[NSNotificationCenter defaultCenter] postNotificationName:kReloadTableNotification object:nil];
        }
        [self dismissViewControllerAnimated:YES completion:^{
            
        }];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
