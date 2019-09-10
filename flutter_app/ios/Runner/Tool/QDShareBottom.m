
//
//  QDShareBottom.m
//  QDINFI
//
//  Created by xiaobao on 2019/6/4.
//  Copyright © 2019 quantdo. All rights reserved.
//

#import "QDShareBottom.h"

@interface QDShareBottom()
@property (nonatomic,strong) UIImageView *leftImageView;
@property (nonatomic,strong) UIImageView *rightImageView;
@property (nonatomic,strong) UILabel *topLabel;
@property (nonatomic,strong) UILabel *timeLab;

@end

@implementation QDShareBottom

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        [self createUI];
    }
    return self;
}

-(void)createUI{
    self.backgroundColor = [UIColor whiteColor];
    _leftImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
    _leftImageView.image = [UIImage imageNamed:@"logo"];
    [self addSubview:_leftImageView];
    
    _rightImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
    _rightImageView.backgroundColor = [UIColor yellowColor];
    _rightImageView.image = [UIImage imageNamed:@"qrcode"];
    [self addSubview:_rightImageView];
    
    _topLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    _topLabel.textAlignment = NSTextAlignmentRight;
    _topLabel.numberOfLines = 2;
    _topLabel.font = [UIFont systemFontOfSize:7];
    _topLabel.textColor = [UIColor colorWithHexString:@"898da5"];
    _topLabel.text = @"Establish Asian Pricing Benchmarks\n for Global Commodities";
    [self addSubview:_topLabel];
        
    _timeLab = [[UILabel alloc]initWithFrame:CGRectZero];
    _timeLab.textAlignment = NSTextAlignmentCenter;
    _timeLab.textColor = [UIColor colorWithHexString:@"898da5"];
    _timeLab.text = [NSString getCurrentTime];
    _timeLab.font = [UIFont systemFontOfSize:7];
    [self addSubview:_timeLab];
}

-(void)layoutSubviews{
    [_leftImageView  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(getAutoSizeWidth(10));
        make.centerY.mas_equalTo(0);
        make.width.mas_equalTo(getAutoSizeWidth(61));
        make.height.mas_equalTo(getAutoSizeWidth(28));
    }];
    
    [_rightImageView  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(getAutoSizeWidth(-10));
        make.centerY.mas_equalTo(0);
        make.width.mas_equalTo(getAutoSizeWidth(50));
        make.height.mas_equalTo(getAutoSizeWidth(50));
    }];
    
    [_topLabel  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.rightImageView.mas_left).offset(getAutoSizeWidth(-11));
        make.left.mas_equalTo(self.leftImageView.mas_right).offset(getAutoSizeWidth(5));
        make.top.mas_equalTo(getAutoSizeWidth(10));
        make.height.mas_equalTo(getAutoSizeWidth(28));
    }];
    
    [_timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.topLabel.mas_bottom).offset(4);
        make.right.mas_equalTo(self.rightImageView.mas_left).offset(-11);
    }];
    
}

@end
