//
//  IMTemplateCell.m
//  IMCoder
//
//  Created by iMokhles on 16/03/2017.
//  Copyright © 2017 iMokhles. All rights reserved.
//

#import "IMTemplateCell.h"

@interface IMTemplateCell ()
@property (strong, nonatomic) IBOutlet UILabel *templateName;

@end
@implementation IMTemplateCell

- (void)configureWithTemplateName:(NSString *)name {
    [self.templateName setText:name];
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
