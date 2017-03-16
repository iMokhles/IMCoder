//
//  IMTemplateFieldCell.m
//  IMCoder
//
//  Created by iMokhles on 16/03/2017.
//  Copyright © 2017 iMokhles. All rights reserved.
//

#import "IMTemplateFieldCell.h"

@interface IMTemplateFieldCell () <UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;


@end
@implementation IMTemplateFieldCell

- (void)configureWithTitle:(NSString *)title {
    [self.titleLabel setText:title];
    [self.textField setPlaceholder:[NSString stringWithFormat:@"%@ placeholder", title]];
}
- (void)textFieldDidEndEditing:(UITextField *)textField {
    [textField resignFirstResponder];
    self.textFieldDidEndEditingBlock(self, textField);
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
