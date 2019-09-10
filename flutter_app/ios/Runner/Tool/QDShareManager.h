//
//  QDShareManager.h
//  QDINFI
//
//  Created by xiaobao on 2019/6/4.
//  Copyright © 2019 quantdo. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


/**
 分享管理器
 */
@interface QDShareManager : NSObject

@property(nonatomic,copy) void(^SavePhotoBlock)(BOOL isSuccess);

//分享截图（外部调用）
-(void)shareScreenshot:(UIViewController *)viewController;


/**
 分享网页(外部调用)

 @param title title
 @param image image
 @param url url
 */
-(void)shareWebPage:(NSString *)title shareDesc:(NSString *)desc image:(UIImage *)image url:(NSString *)url viewController:(UIViewController *)viewController;

///**
// 显示分享截图
// */
//-(void)showScreenShot;
//
//
//
///**
// 保存图片
// */
//-(void)savedPhoto;
//
//
//
///**
// 截图
// */
//-(void)doScreenShot;
//
//
//
///**
// 分享文本
// @param platformType 分享平台
// */
//- (void)shareTextToPlatformType:(UMSocialPlatformType)platformType;
//
////分享图片
//- (void)shareImageToPlatformType:(UMSocialPlatformType)platformType;

@end

NS_ASSUME_NONNULL_END
