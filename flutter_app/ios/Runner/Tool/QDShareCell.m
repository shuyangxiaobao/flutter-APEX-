//
//  QDShareCell.m
//  QDINFI
//
//  Created by xiaobao on 2019/6/3.
//  Copyright © 2019 quantdo. All rights reserved.
//

#import "QDShareCell.h"

@implementation QDShareCell
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setUpAllChildView];
    }
    return self;
}

-(void)setUpAllChildView{
    _headImgView = [[UIImageView alloc]initWithFrame:CGRectZero];
    _headImgView.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:_headImgView];
    [_headImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.width.and.height.mas_equalTo(34);
        make.top.mas_equalTo(20);
    }];

    self.titleLab = [[UILabel alloc]initWithFrame:CGRectZero];
    self.titleLab.textColor = [UIColor colorWithHexString:@"#7E829D"];
    self.titleLab.textAlignment = NSTextAlignmentCenter;
    self.titleLab.font = [UIFont systemFontOfSize:getAutoSizeWidth(11)];
    self.titleLab.text = @"WeChat";
    [self.contentView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.mas_equalTo(self.headImgView.mas_bottom).offset(6);
        make.height.mas_equalTo(18);
    }];
}
@end
