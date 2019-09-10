//
//  QDShareManager.m
//  QDINFI
//
//  Created by xiaobao on 2019/6/4.
//  Copyright © 2019 quantdo. All rights reserved.
//

#import "QDShareManager.h"
#import "QDShareBottom.h"
#import "QDShareView.h"
static NSString* const UMS_THUMB_IMAGE = @"https://mobile.umeng.com/images/pic/home/social/img-1.png";
static NSString* const UMS_IMAGE = @"https://mobile.umeng.com/images/pic/home/social/img-1.png";
static NSString* const UMS_Title = @"【友盟+】社会化组件U-Share";
static NSString* const UMS_Web_Desc = @"W欢迎使用【友盟+】社会化组件U-Share，SDK包最小，集成成本最低，助力您的产品开发、运营与推广！";
static NSString* const UMS_WebLink = @"https://bbs.umeng.com/";

@interface QDShareManager()
@property (nonatomic,strong) UIView *shareBackView;

@property (nonatomic,strong) UIView *shareOutView;


@property (nonatomic,strong) UIImage *screenImage;
@property (nonatomic,strong) QDShareView *shareView;

@property (nonatomic,strong) UIViewController *viewController;

@end


@implementation QDShareManager


-(void)shareToSystem:(UIImage *)image{
//    NSString *testToShare = @"分享的标题";
//    UIImage *imageToShare = [UIImage imageNamed:@"Snip20190628_3"];
//    NSURL *urlToShare = [NSURL URLWithString:@"http://www.baidu.com"];
    NSArray *activityItems = @[image];
    UIActivityViewController *activityVc = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:nil];
    [[KYEFuncTools presentingVC] presentViewController:activityVc animated:YES completion:nil];
    activityVc.completionWithItemsHandler = ^(UIActivityType _Nullable activityType, BOOL completed, NSArray * _Nullable returnedItems, NSError * _Nullable activityError) {
        if (completed) {
            NSLog(@"分享成功");
        }else{
            NSLog(@"分享取消");
        }
    };
}



//MARK:- 分享网页
-(void)shareWebPage:(NSString *)shareTitle shareDesc:(NSString *)desc image:(UIImage *)image url:(NSString *)url viewController:(UIViewController *)viewController{
    _viewController = [UIViewController  new];
    _viewController = viewController;
    NSArray *titlearr     = [NSMutableArray arrayWithCapacity:5];
    NSArray *imageArr     = [NSMutableArray arrayWithCapacity:5];
    
    //    titlearr = @[@"WeChat",@"WeChat Moments",@"Whatsapp",@"Twitter",@"Facebook",@"Email",@"QQ",@"Sina Weibo",@"Save",@""];
    //    imageArr = @[@"WeChat",@"WeChat Moments",@"Whatsapp",@"Twitter",@"Facebook",@"Email",@"QQ",@"Sina Weibo",@"Save",@""];
    
//    titlearr = @[kLocalizedString(@"share_wechat", @"WeChat"),
//                 kLocalizedString(@"share_weChatMoments", @"WeChat Moments"),
//                 kLocalizedString(@"share_whatsapp", @"Whatsapp"),
//                 kLocalizedString(@"share_twitter", @"Twitter"),
//                 kLocalizedString(@"share_sinaWeibo", @"Sina Weibo"),
//                 kLocalizedString(@"share_email", @"Email"),
//                 @"",@"",@"",@""];
    titlearr = @[@"WeChat",@"WeChat Moments",@"Whatsapp",@"Twitter",@"Sina Weibo",@"Email",@"",@"",@"",@""];
    imageArr =  @[@"WeChat",@"WeChat Moments",@"Whatsapp",@"Twitter",@"Sina Weibo",@"Email",@"",@"",@"",@""];
    
    [self doScreenShot];
    _shareView = [[QDShareView alloc] initWithShareHeadOprationWith:titlearr andImageArry:imageArr];
    MJWeakSelf
    _shareView.ShareBlock = ^(NSString * _Nonnull title) {
        //        [_shareView removeFromSuperview];
        [weakSelf.shareView performSelector:@selector(tappedCancel)];
        if ([title isEqualToString:@"WeChat"]) {
//            [weakSelf shareWebPageToSystem:shareTitle image:image url:url platformType:UMSocialPlatformType_WechatSession];
            
            [weakSelf shareWebPageToPlatformType:UMSocialPlatformType_WechatSession title:shareTitle descr:desc image:image url:url];
            
        } else if ([title isEqualToString:@"WeChat Moments"]){
            [weakSelf shareWebPageToPlatformType:UMSocialPlatformType_WechatTimeLine title:shareTitle descr:desc image:image url:url];

//            [weakSelf shareWebPageToSystem:shareTitle image:image url:url platformType:UMSocialPlatformType_WechatTimeLine];
        } else if ([title isEqualToString:@"WhatsApp"]){
            [weakSelf shareWebPageToSystem:shareTitle image:image url:url platformType:UMSocialPlatformType_Whatsapp];
        } else if ([title isEqualToString:@"Twitter"]){
            [weakSelf shareWebPageToPlatformType:UMSocialPlatformType_Twitter title:shareTitle descr:desc image:image url:url];
        } else if ([title isEqualToString:@"Facebook"]){
            [weakSelf shareWebPageToPlatformType:UMSocialPlatformType_Facebook title:shareTitle descr:desc image:image url:url];
        } else if ([title isEqualToString:@"Email"]){
            [weakSelf shareWebPageToPlatformType:UMSocialPlatformType_Email title:shareTitle descr:desc image:image url:url];
        } else if ([title isEqualToString:@"QQ"]){
            [weakSelf shareWebPageToPlatformType:UMSocialPlatformType_QQ title:shareTitle descr:desc image:image url:url];
            //            [self shareTextToPlatformType:UMSocialPlatformType_QQ];
        } else if ([title isEqualToString:@"Sina Weibo"]){
            [weakSelf shareWebPageToPlatformType:UMSocialPlatformType_Sina title:shareTitle descr:desc image:image url:url];
        } else if ([title isEqualToString:@"Save"]){
            [weakSelf savedPhoto];
        }
    };
    _shareView.TappCancelBlock = ^{
        if (weakSelf) {
            [weakSelf.shareBackView removeFromSuperview];
        } else {
            [self.shareBackView removeFromSuperview];
        }
    };
    [[UIApplication sharedApplication].keyWindow addSubview:_shareView];
}


-(void)shareWebPageToSystem:(NSString *)title image:(UIImage *)image url:(NSString *)url platformType:(UMSocialPlatformType)platformType{
        [self shareToSystem:title image:image url:url];
}

-(void)shareToSystem:(NSString *)title image:(UIImage *)image url:(NSString *)url{
    NSURL *urlToShare = [NSURL URLWithString:url];
    NSArray *activityItems = @[title,image,urlToShare];
    UIActivityViewController *activityVc = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:nil];
    [[KYEFuncTools presentingVC] presentViewController:activityVc animated:YES completion:nil];
    activityVc.completionWithItemsHandler = ^(UIActivityType _Nullable activityType, BOOL completed, NSArray * _Nullable returnedItems, NSError * _Nullable activityError) {
        if (completed) {
            NSLog(@"分享成功");
        }else{
            NSLog(@"分享取消");
        }
    };
}


//网页分享
- (void)shareWebPageToPlatformType:(UMSocialPlatformType)platformType title:(NSString *)title descr:(NSString *)descr image:(UIImage *)image url:(NSString *)url
{
    //创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    
    //创建网页内容对象
//    NSString* thumbURL =  @"";
    if (!descr || descr.length<1) {
        descr = title;
    }
    UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:title descr:descr thumImage:image];
    //设置网页地址
    shareObject.webpageUrl = url;
    
    //分享消息对象设置分享内容对象
    messageObject.shareObject = shareObject;
    
#ifdef UM_Swift
    [UMSocialSwiftInterface shareWithPlattype:platformType messageObject:messageObject viewController:_viewController completion:^(UMSocialShareResponse * data, NSError * error) {
#else
        //调用分享接口
        [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:_viewController completion:^(id data, NSError *error) {
#endif
            if (error) {
                UMSocialLogInfo(@"************Share fail with error %@*********",error);
            }else{
                if ([data isKindOfClass:[UMSocialShareResponse class]]) {
                    UMSocialShareResponse *resp = data;
                    //分享结果消息
                    UMSocialLogInfo(@"response message is %@",resp.message);
                    //第三方原始返回的数据
                    UMSocialLogInfo(@"response originalResponse data is %@",resp.originalResponse);
                    
                }else{
                    UMSocialLogInfo(@"response data is %@",data);
                }
            }
            [self alertWithError:error];
        }];
    }






//MARK:-------- 分享截图 start

-(void)shareScreenshot:(UIViewController *)viewController{
    _viewController = [UIViewController  new];
    _viewController = viewController;
    NSArray *titlearr     = [NSMutableArray arrayWithCapacity:5];
    NSArray *imageArr     = [NSMutableArray arrayWithCapacity:5];
    
//    titlearr = @[@"WeChat",@"WeChat Moments",@"Whatsapp",@"Twitter",@"Facebook",@"Email",@"QQ",@"Sina Weibo",@"Save",@""];
//    imageArr = @[@"WeChat",@"WeChat Moments",@"Whatsapp",@"Twitter",@"Facebook",@"Email",@"QQ",@"Sina Weibo",@"Save",@""];
    
    titlearr = @[@"WeChat",@"WeChat Moments",@"Whatsapp",@"Twitter",@"Sina Weibo",@"Email",@"Save",@"",@"",@""];
    imageArr =  @[@"WeChat",@"WeChat Moments",@"Whatsapp",@"Twitter",@"Sina Weibo",@"Email",@"Save",@"",@"",@""];
    
    [self doScreenShot];
    _shareView = [[QDShareView alloc] initWithShareHeadOprationWith:titlearr andImageArry:imageArr];
    [self showScreenShot];
    MJWeakSelf
    _shareView.ShareBlock = ^(NSString * _Nonnull title) {
        //        [_shareView removeFromSuperview];
        [weakSelf.shareView performSelector:@selector(tappedCancel)];
        if ([title isEqualToString:@"WeChat"]) {
            [weakSelf shareImageToPlatformType:UMSocialPlatformType_WechatSession];
        } else if ([title isEqualToString:@"WeChat Moments"]){
            [weakSelf shareImageToPlatformType:UMSocialPlatformType_WechatTimeLine];
        } else if ([title isEqualToString:@"Whatsapp"]){
            [weakSelf shareImageToPlatformType:UMSocialPlatformType_Whatsapp];
        } else if ([title isEqualToString:@"Twitter"]){
            [weakSelf shareImageToPlatformType:UMSocialPlatformType_Twitter];
        } else if ([title isEqualToString:@"Facebook"]){
            [weakSelf shareImageToPlatformType:UMSocialPlatformType_Facebook];
        } else if ([title isEqualToString:@"Email"]){
            [weakSelf shareImageToPlatformType:UMSocialPlatformType_Email];
        } else if ([title isEqualToString:@"QQ"]){
            
            [weakSelf shareImageToPlatformType:UMSocialPlatformType_QQ];
            
            //            [self shareTextToPlatformType:UMSocialPlatformType_QQ];
        } else if ([title isEqualToString:@"Sina Weibo"]){
            [weakSelf shareImageToPlatformType:UMSocialPlatformType_Sina];
        } else if ([title isEqualToString:@"Save"]){
            [weakSelf savedPhoto];
        }
    };
    //    if (weakSelf == nil) {
    //       __weak typeof(self) weakSelf = self;
    //    }
    _shareView.TappCancelBlock = ^{
        if (weakSelf) {
            [weakSelf.shareBackView removeFromSuperview];
        } else {
            [self.shareBackView removeFromSuperview];
        }
    };
    
    //    [shareView setBtnClick:^(NSInteger btnTag) {
    //        NSLog(@"\n点击第几个====%d\n当前选中的按钮title====%@",(int)btnTag,titlearr[btnTag]);
    //        [self shareToPlatform:[typeArr[btnTag] integerValue]];
    //    }];
    [[UIApplication sharedApplication].keyWindow addSubview:_shareView];
}

-(void)showScreenShot{
    _shareBackView = [[UIView alloc]initWithFrame:CGRectZero];
    _shareBackView.backgroundColor = [UIColor blackColor];
    [[UIApplication sharedApplication].keyWindow addSubview:_shareBackView];
    [_shareBackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
        make.height.mas_equalTo(kScreen_Height-120);
    }];
    
    
    
    _shareOutView = [[UIView alloc]initWithFrame:CGRectZero];
    _shareOutView.backgroundColor = [UIColor clearColor];
    [_shareBackView addSubview:_shareOutView];
    [_shareOutView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo((kScreen_Width/kScreen_Height)*224/2);
        make.right.mas_equalTo(-(kScreen_Width/kScreen_Height)*224/2);
        make.height.mas_equalTo(kScreen_Height-145);
    }];
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectZero];
    [_shareOutView addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(kScreen_Height-224);
    }];
    imageView.image = _screenImage;
    
    QDShareBottom *bottomView = [[QDShareBottom alloc]initWithFrame:CGRectZero];
    [_shareOutView addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(imageView.mas_bottom).offset(0);
        make.left.mas_equalTo(imageView.mas_left);
        make.right.mas_equalTo(imageView.mas_right);
        make.height.mas_equalTo(70);
    }];
}



//MARK:- 保存图片
-(void)savedPhoto{
    
    // 开启图片上下文
    UIGraphicsBeginImageContextWithOptions(self.shareOutView.bounds.size, NO, 0);
    // 获取当前上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 截图:实际是把layer上面的东西绘制到上下文中
    [self.shareOutView.layer renderInContext:ctx];
    //iOS7+ 推荐使用的方法，代替上述方法
    // [self.view drawViewHierarchyInRect:self.view.frame afterScreenUpdates:YES];
    // 获取截图
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    // 关闭图片上下文
    UIGraphicsEndImageContext();
    
    
    // 保存相册
    //    UIImageWriteToSavedPhotosAlbum(image, NULL, NULL, NULL);
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    
}


#pragma mark -- <保存到相册>
-(void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    NSString *msg = nil ;
    BOOL isSuccess = NO;
    if(error){
        msg =@"保存图片失败";
    }else{
        msg = @"保存图片成功";
        isSuccess = YES;
    }
    
    
    
    //    [_shareView performSelector:@selector(tappedCancel)];
    
    [UIView animateWithDuration:0.25 animations:^{
        [_shareView.bgView setFrame:CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, 0)];
        _shareView.alpha = 0;
    } completion:^(BOOL finished) {
        if (finished) {
            [_shareView removeFromSuperview];
        }
    }];
    [_shareBackView removeFromSuperview];
    
    //    if (self.SavePhotoBlock) {
    //        self.SavePhotoBlock(isSuccess);
    //    }
//    [WXProgressHUD showErrorWithTittle:msg];
}


/**
 截图
 */
- (void)doScreenShot{
    // 开启图片上下文
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(kScreen_Width, kScreen_Height), NO, 0);
    // 获取当前上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 截图:实际是把layer上面的东西绘制到上下文中
    [[UIApplication sharedApplication].keyWindow.layer renderInContext:ctx];
    //iOS7+ 推荐使用的方法，代替上述方法
    // [self.view drawViewHierarchyInRect:self.view.frame afterScreenUpdates:YES];
    // 获取截图
    _screenImage = UIGraphicsGetImageFromCurrentImageContext();
    // 关闭图片上下文
    UIGraphicsEndImageContext();
}


/**
 分享文本
 @param platformType 分享平台
 */
- (void)shareTextToPlatformType:(UMSocialPlatformType)platformType
{
    //创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    //设置文本
    messageObject.text = UMS_Text;
    
    
    //    [UMSocial]
    //
    //    + (id)shareObjectWithTitle:(NSString *)title
    //descr:(NSString *)descr
    //thumImage:(id)thumImage;
    //
    //    [UMSocialManager defaultManager]
    
    
    
    UIGraphicsBeginImageContextWithOptions(self.shareOutView.bounds.size, NO, 0);
    // 获取当前上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 截图:实际是把layer上面的东西绘制到上下文中
    [self.shareOutView.layer renderInContext:ctx];
    //iOS7+ 推荐使用的方法，代替上述方法
    // [self.view drawViewHierarchyInRect:self.view.frame afterScreenUpdates:YES];
    // 获取截图
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    // 关闭图片上下文
    UIGraphicsEndImageContext();
    
    
    [UMShareObject shareObjectWithTitle:@"APEX" descr:@"描述" thumImage:image];
    
    
#ifdef UM_Swift
    [UMSocialSwiftInterface shareWithPlattype:platformType messageObject:messageObject viewController:self completion:^(UMSocialShareResponse * data, NSError * error) {
#else
        //调用分享接口
        [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:_viewController completion:^(id data, NSError *error) {
#endif
            if (error) {
                UMSocialLogInfo(@"************Share fail with error %@*********",error);
            }else{
                if ([data isKindOfClass:[UMSocialShareResponse class]]) {
                    UMSocialShareResponse *resp = data;
                    //分享结果消息
                    UMSocialLogInfo(@"response message is %@",resp.message);
                    //第三方原始返回的数据
                    UMSocialLogInfo(@"response originalResponse data is %@",resp.originalResponse);
                    
                }else{
                    UMSocialLogInfo(@"response data is %@",data);
                }
            }
            [self alertWithError:error];
        }];
    }
     
 - (void)alertWithError:(NSError *)error
 {
     NSString *result = nil;
     if (!error) {
         result = [NSString stringWithFormat:@"Share succeed"];
     }
     else{
         NSMutableString *str = [NSMutableString string];
         if (error.userInfo) {
             for (NSString *key in error.userInfo) {
                 [str appendFormat:@"%@ = %@\n", key, error.userInfo[key]];
             }
         }
         if (error) {
             result = [NSString stringWithFormat:@"Share fail with error code: %d\n%@",(int)error.code, str];
         }
         else{
             result = [NSString stringWithFormat:@"Share fail"];
         }
         result = @"Share fail";
     }
     UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"share"
                                                     message:result
                                                    delegate:nil
                                           cancelButtonTitle:@"OK"
                                           otherButtonTitles:nil];
     [alert show];
 }
 
 
 
 //分享图片
 - (void)shareImageToPlatformType:(UMSocialPlatformType)platformType
 {
     UIGraphicsBeginImageContextWithOptions(self.shareOutView.bounds.size, NO, 0);
     // 获取当前上下文
     CGContextRef ctx = UIGraphicsGetCurrentContext();
     // 截图:实际是把layer上面的东西绘制到上下文中
     [self.shareOutView.layer renderInContext:ctx];
     //iOS7+ 推荐使用的方法，代替上述方法
     // [self.view drawViewHierarchyInRect:self.view.frame afterScreenUpdates:YES];
     // 获取截图
     UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
     // 关闭图片上下文
     UIGraphicsEndImageContext();
     
//     UMSocialPlatformType_WechatSession      = 1, //微信聊天
//     UMSocialPlatformType_WechatTimeLine     = 2,//微信朋友圈
     
     if(platformType == UMSocialPlatformType_WechatSession || platformType == UMSocialPlatformType_WechatTimeLine){
         [self shareToSystem:image];
         return;
     }
     
     [self shareImageToPlatformType:platformType withThumb:[UIImage imageNamed:@"activityicon"] image:image];
 }
 
 - (void)shareImageToPlatformType:(UMSocialPlatformType)platformType withThumb:(id)thumb image:(id)image
 {
     //创建分享消息对象
     UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
     
     //创建图片内容对象
     UMShareImageObject *shareObject = [[UMShareImageObject alloc] init];
     //如果有缩略图，则设置缩略图本地
     shareObject.thumbImage = thumb;
     
     [shareObject setShareImage:image];
     
     // 设置Pinterest参数
     //if (platformType == UMSocialPlatformType_Pinterest) {
     //    [self setPinterstInfo:messageObject];
     //}
     
     // 设置Kakao参数
     if (platformType == UMSocialPlatformType_KakaoTalk) {
         messageObject.moreInfo = @{@"permission" : @1}; // @1 = KOStoryPermissionPublic
     }
     
     //分享消息对象设置分享内容对象
     messageObject.shareObject = shareObject;
     
     //调用分享接口
#ifdef UM_Swift
     [UMShareSwiftInterface shareWithPlattype:platformType messageObject:messageObject viewController:self completion:^(UMSocialShareResponse * data, NSError * error) {
#else
         [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:_viewController completion:^(id data, NSError *error) {
#endif
             if (error) {
                 UMSocialLogInfo(@"************Share fail with error %@*********",error);
             }else{
                 if ([data isKindOfClass:[UMSocialShareResponse class]]) {
                     UMSocialShareResponse *resp = data;
                     //分享结果消息
                     UMSocialLogInfo(@"response message is %@",resp.message);
                     //第三方原始返回的数据
                     UMSocialLogInfo(@"response originalResponse data is %@",resp.originalResponse);
                     
                 }else{
                     UMSocialLogInfo(@"response data is %@",data);
                 }
             }
             [self alertWithError:error];
         }];
     }
      
-(void)dealloc{
    NSLog(@"安全释放啦%s",__func__);
}
@end
          
          
