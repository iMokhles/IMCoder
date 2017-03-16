//
//  IMProjectCell.m
//  IMCoder
//
//  Created by iMokhles on 16/03/2017.
//  Copyright © 2017 iMokhles. All rights reserved.
//

#import "IMProjectCell.h"

@interface IMProjectCell ()
@property (strong, nonatomic) IBOutlet UIImageView *projectImageView;
@property (strong, nonatomic) IBOutlet UILabel *projectName;
@property (strong, nonatomic) IBOutlet UILabel *projectBundleId;
@property (strong, nonatomic) IBOutlet UILabel *projectShortDescription;
@property (strong, nonatomic) IBOutlet UILabel *projectAuthor;
@end

@implementation IMProjectCell

- (void)configureCellWithProject:(IMProject *)project {
    UIImage *typeImage;
    switch (project.type) {
        case 0:
            // tweak
            typeImage = [UIImage imageNamed:@"tweak"];
            break;
        case 1:
            // library
            typeImage = [UIImage imageNamed:@"library"];
            break;
        case 2:
            // tool
            typeImage = [UIImage imageNamed:@"tool"];
            break;
        case 3:
            // application
            typeImage = [UIImage imageNamed:@"application"];
            break;
        case 4:
            // preferences
            typeImage = [UIImage imageNamed:@"preferences"];
            break;
        default:
            break;
    }
    [self.projectImageView setImage:typeImage];
    [self.projectName setText:project.name];
    [self.projectBundleId setText:project.bundle_id];
    [self.projectShortDescription setText:project.short_description];
    [self.projectAuthor setText:project.author];
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
