//
//  IMTemplateFieldCell.h
//  IMCoder
//
//  Created by iMokhles on 16/03/2017.
//  Copyright © 2017 iMokhles. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IMTemplateFieldCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UITextField *textField;

@property (nonatomic, copy) void (^textFieldDidEndEditingBlock)(IMTemplateFieldCell *fieldCell, UITextField *textField);

- (void)configureWithTitle:(NSString *)title;
@end
