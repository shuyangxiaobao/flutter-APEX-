//
//  leftSlideCell.m
//  BankCard
//
//  Created by xiaobao on 2019/4/11.
//  Copyright © 2019年 戈强宝. All rights reserved.
//

#import "leftSlideCell.h"

@implementation leftSlideCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.titleLab.font = [UIFont systemFontOfSize:getAutoSizeWidth(15)];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
