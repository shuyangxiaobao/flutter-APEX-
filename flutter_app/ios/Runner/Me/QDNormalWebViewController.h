//
//  QDNormalWebViewController.h
//  QDINFI
//
//  Created by yl-yin on 2019/7/16.
//  Copyright © 2019 quantdo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface QDNormalWebViewController : UIViewController
@property(nonatomic,copy)NSString *urlString;
@property(nonatomic,assign)BOOL showShareButton; // 是否显示分享按钮，默认不显示
@property(nonatomic,strong)NSString *shareTitle;
@property(nonatomic,strong)NSString *shareDesc;

- (instancetype)initWithUrlString:(NSString *)urlString title:(NSString *)title shareTitle:(NSString *)shareTitle shareDesc:(NSString *)desc;
@end

NS_ASSUME_NONNULL_END
