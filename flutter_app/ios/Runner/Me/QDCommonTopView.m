//
//  QDCommonTopView.m
//  QDINFI
//
//  Created by xiaobao on 2019/6/11.
//  Copyright © 2019 quantdo. All rights reserved.
//

#import "QDCommonTopView.h"

@interface QDCommonTopView()
@property (nonatomic,strong) UILabel *titleLab;
@property (nonatomic,strong) UIButton *rightButt;

@end

@implementation QDCommonTopView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self createSubView];
    }
    return self;
}


-(void)createSubView{
    //    menu
    self.backgroundColor = [UIColor colorWithHexString:@"#21212B"];
    _backButt = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [_backButt setImage:[UIImage imageNamed:@"back_light"] forState:(UIControlStateNormal)];
    [_backButt addTarget:self action:@selector(leftClick:) forControlEvents:(UIControlEventTouchUpInside)];
    [self addSubview:_backButt];
    [_backButt addTarget:self action:@selector(leftClick:) forControlEvents:(UIControlEventTouchUpInside)];
    
    _backTopButt = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [_backTopButt addTarget:self action:@selector(leftClick:) forControlEvents:(UIControlEventTouchUpInside)];
    [self addSubview:_backTopButt];
    
    _titleLab = [[UILabel alloc]initWithFrame:CGRectZero];
    _titleLab.textColor = [UIColor colorWithHexString:@"#FFFFFF"];
    _titleLab.font = [UIFont boldSystemFontOfSize:20];
    [self addSubview:_titleLab];
    
    _rightButt = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [_rightButt setImage:[UIImage imageNamed:@"light_share"] forState:(UIControlStateNormal)];
    [_rightButt addTarget:self action:@selector(rightClick:) forControlEvents:(UIControlEventTouchUpInside)];
    [self addSubview:_rightButt];
    self.rightButtonHidden = YES;
}

-(void)setTitle:(NSString *)title{
    _title = title;
    _titleLab.text = title;
}


-(void)layoutSubviews{
    [_backButt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-6);
        make.left.mas_equalTo(20);
        make.width.mas_equalTo(24);
        make.height.mas_equalTo(24);
    }];
    
    [_backTopButt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(0);
        make.left.mas_equalTo(0);
        make.width.mas_equalTo(70);
        make.height.mas_equalTo(40);
    }];
    
    [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        //        make.bottom.mas_equalTo(-4);
        make.centerY.equalTo(_backButt);
    }];
    
    [_rightButt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(iPhoneX ? (34+24) : (34));
        make.right.mas_equalTo(0);
        make.width.mas_equalTo(64);
        make.height.mas_equalTo(24);
    }];
}

-(void)leftClick:(UIButton *)sender{
    NSLog(@"%s",__func__);
    if (self.LeftClickBlock) {
        self.LeftClickBlock();
    }
}

-(void)rightClick:(UIButton *)sender{
    NSLog(@"%s",__func__);
    if (self.ShareBlock) {
        self.ShareBlock(sender);
    }
    
}
- (void)setRightButtonHidden:(BOOL)rightButtonHidden {
    _rightButtonHidden = rightButtonHidden;
    self.rightButt.hidden = _rightButtonHidden;
}
@end
