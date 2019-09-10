//
//  QDCommonTopView.h
//  QDINFI
//
//  Created by xiaobao on 2019/6/11.
//  Copyright © 2019 quantdo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface QDCommonTopView : UIView
@property (nonatomic,strong) UIButton *backTopButt;
@property (nonatomic,strong) UIButton *backButt;

@property(nonatomic,copy)void(^LeftClickBlock)(void);
@property(nonatomic,copy)void(^ShareBlock)(UIButton *button);
@property (nonatomic,strong) NSString *title;
@property (nonatomic,assign) BOOL rightButtonHidden; // 是否隐藏分享按钮，默认隐藏
@end

NS_ASSUME_NONNULL_END
