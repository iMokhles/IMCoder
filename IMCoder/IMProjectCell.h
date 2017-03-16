//
//  IMProjectCell.h
//  IMCoder
//
//  Created by iMokhles on 16/03/2017.
//  Copyright © 2017 iMokhles. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IMProject.h"
#import "IMConstants.h"
#import "IMConstants.h"

@interface IMProjectCell : UITableViewCell

- (void)configureCellWithProject:(IMProject *)project;
@end
