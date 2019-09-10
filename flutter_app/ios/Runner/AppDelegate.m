#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"
#import "FirstViewController.h"


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    __weak __typeof(self) weakself = self;
    [UMConfigure initWithAppkey:USHARE_DEMO_APPKEY channel:@"App Store"];
    [self setupUSharePlatforms];   // required: setting platforms on demand

    FlutterViewController *controller = (FlutterViewController *)self.window.rootViewController;
    
    //通道标识，要和flutter端的保持一致
    FlutterMethodChannel *channel = [FlutterMethodChannel methodChannelWithName:@"1234567890" binaryMessenger:controller];
    
    //flutter端通过通道调用原生方法时会进入以下回调
    [channel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
        //call的属性method是flutter调用原生方法的方法名，我们进行字符串判断然后写入不同的逻辑
        if ([call.method isEqualToString:@"callNativeMethond"]) {
            
            
            if (1) {
//                QDShareManager *share = [QDShareManager new];
//                share.SavePhotoBlock = ^(BOOL isSuccess) {
//
//                };
//                [share shareScreenshot:controller];
//                return;
            }
            
           
            //flutter传给原生的参数
            id para = call.arguments;
            
            NSLog(@"flutter传给原生的参数：%@", para);
            if ([para isEqualToString:@"share"]) {
                QDShareManager *share = [QDShareManager new];
                share.SavePhotoBlock = ^(BOOL isSuccess) {
                };
                [share shareWebPage:@"title"  shareDesc:@"baidu" image:[UIImage imageNamed:@"AppIcon"] url:@"www.baidu.com" viewController:controller];
            }
            
            
            //获取一个字符串
            NSString *nativeFinalStr = [weakself getString];
            
            if (nativeFinalStr!=nil) {
                //把获取到的字符串传值给flutter
                result(nativeFinalStr);
                dispatch_async(dispatch_get_main_queue(), ^{
//                    FirstViewController *vc = [FirstViewController new];
//                    [controller presentViewController:vc animated:YES completion:nil];
                });
            }else{
                //异常(比如改方法是调用原生的getString获取一个字符串，但是返回的是nil(空值)，这显然是不对的，就可以向flutter抛出异常 进入catch处理)
                result([FlutterError errorWithCode:@"001" message:[NSString stringWithFormat:@"进入异常处理"] details:@"进入flutter的trycatch方法的catch方法"]);
            }
        }else{
            //调用的方法原生没有对应的处理  抛出未实现的异常
            result(FlutterMethodNotImplemented);
        }
    }];
    
    
    
    [GeneratedPluginRegistrant registerWithRegistry:self];
    // Override point for customization after application launch.
    return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

//返回一个字符串
- (NSString *)getString{
    //    return nil;//返回nil进入异常的情景
    return @"原生传给flutter的值";
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    NSString * urlStr = [url absoluteString];
    [[NSNotificationCenter defaultCenter]
     postNotificationName:@"WeChat" object:nil userInfo:@{@"url":urlStr}];
    return YES;
}

// ios 9.0+
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url
            options:(NSDictionary<NSString*, id> *)options
{
    NSString * urlStr = [url absoluteString];
    [[NSNotificationCenter defaultCenter]
     postNotificationName:@"WeChat" object:nil userInfo:@{@"url":urlStr}];
    return YES;
}


- (void)setupUSharePlatforms
{
    /*
     设置微信的appKey和appSecret
     [微信平台从U-Share 4/5升级说明]http://dev.umeng.com/social/ios/%E8%BF%9B%E9%98%B6%E6%96%87%E6%A1%A3#1_1
     */
    
    //    量投   asiapacificex.com   wx03ccd9a024ae233c    30b04cc92ea203849bc3e4041f17e65a
    //    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_WechatSession appKey:@"wx9a40b5a3777519d2" appSecret:@"b2e11801e95e85dc55abfa55eba942df" redirectURL:nil];
    
    
    //    量投测试   ios123456789    wx4ef6d7f87a1e0ebc    f8d1b6f446c8870b2b4fd5b56b6fd563
    //    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_WechatSession appKey:@"wx4ef6d7f87a1e0ebc" appSecret:@"900158fd3bcb23ba61f7c0961986a8e3" redirectURL:nil];
    
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_WechatTimeLine appKey:@"wx4ef6d7f87a1e0ebc" appSecret:@"f8d1b6f446c8870b2b4fd5b56b6fd563" redirectURL:nil];
    
    
    
    //    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_WechatSession appKey:@"wx3094b5aed46860f2" appSecret:@"d4624c36b6795d1d99dcf0547af5443d" redirectURL:nil];
    
    
    /*
     设置微信的appKey和appSecret
     [微信平台从U-Share 4/5升级说明]http://dev.umeng.com/social/ios/%E8%BF%9B%E9%98%B6%E6%96%87%E6%A1%A3#1_1
     */
    //    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_WechatTimeLine appKey:@"wx9a40b5a3777519d2" appSecret:@"b2e11801e95e85dc55abfa55eba942df" redirectURL:nil];
    
    /*
     * 移除相应平台的分享，如微信收藏
     */
    //    [[UMSocialManager defaultManager] removePlatformProviderWithPlatformTypes:@[@(UMSocialPlatformType_WechatFavorite)]];
    
    /* 设置分享到QQ互联的appID
     * U-Share SDK为了兼容大部分平台命名，统一用appKey和appSecret进行参数设置，而QQ平台仅需将appID作为U-Share的appKey参数传进即可。
     100424468.no permission of union id
     [QQ/QZone平台集成说明]http://dev.umeng.com/social/ios/%E8%BF%9B%E9%98%B6%E6%96%87%E6%A1%A3#1_3
     */
    //    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_QQ appKey:@"1105821097"/*设置QQ平台的appID*/  appSecret:nil redirectURL:nil];
    
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_QQ appKey:@"101596900"/*设置QQ平台的appID*/  appSecret:nil redirectURL:nil];
    
    
    /*
     设置新浪的appKey和appSecret
     [新浪微博集成说明]http://dev.umeng.com/social/ios/%E8%BF%9B%E9%98%B6%E6%96%87%E6%A1%A3#1_2
     */
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_Sina appKey:@"3921700954"  appSecret:@"04b48b094faeb16683c32669824ebdad" redirectURL:@"https://sns.whalecloud.com/sina2/callback"];
    
    /* 钉钉的appKey */
    //    [[UMSocialManager defaultManager] setPlaform: UMSocialPlatformType_DingDing appKey:@"dingoalmlnohc0wggfedpk" appSecret:nil redirectURL:nil];
    
    /* 支付宝的appKey */
    //    [[UMSocialManager defaultManager] setPlaform: UMSocialPlatformType_AlipaySession appKey:@"2015111700822536" appSecret:nil redirectURL:nil];
    
    /* 设置易信的appKey */
    //    [[UMSocialManager defaultManager] setPlaform: UMSocialPlatformType_YixinSession appKey:@"yx35664bdff4db42c2b7be1e29390c1a06" appSecret:nil redirectURL:@"http://mobile.umeng.com/social"];
    
    /* 设置领英的appKey和appSecret */
    //    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_Linkedin appKey:@"81lcv9le14dpqi"  appSecret:@"Po7OB9LxOaxhR9M3" redirectURL:@"https://api.linkedin.com/v1/people"];
    
    /* 设置Twitter的appKey和appSecret */
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_Twitter appKey:@"fB5tvRpna1CKK97xZUslbxiet"  appSecret:@"YcbSvseLIwZ4hZg9YmgJPP5uWzd4zr6BpBKGZhf07zzh3oj62K" redirectURL:nil];
    
    /* 设置Facebook的appKey和UrlString */
    //    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_Facebook appKey:@"506027402887373"  appSecret:nil redirectURL:nil];
    
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_Facebook appKey:@"506027402887373"  appSecret:nil redirectURL:nil];
    
    
    /* 设置Pinterest的appKey */
    //    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_Pinterest appKey:@"4864546872699668063"  appSecret:nil redirectURL:nil];
    
    //    [[UMSocialManager defaultManager] removePlatformProviderWithPlatformTypes:@[@(UMSocialPlatformType_FaceBookMessenger)]];
    
    //    [[UMSocialManager defaultManager] addAddUserDefinePlatformProvider:@[@(UMSocialPlatformType_UserDefine_Begin)] withUserDefinePlatformType:(UMSocialPlatformType_UserDefine_Begin)];
    //
    //    -(BOOL)addAddUserDefinePlatformProvider:(id<UMSocialPlatformProvider>)userDefinePlatformProvider
    //withUserDefinePlatformType:(UMSocialPlatformType)platformType;
    
    
    /* dropbox的appKey */
    //    [[UMSocialManager defaultManager] setPlaform: UMSocialPlatformType_DropBox appKey:@"k4pn9gdwygpy4av" appSecret:@"td28zkbyb9p49xu" redirectURL:@"https://mobile.umeng.com/social"];
    
    /* vk的appkey */
    //    [[UMSocialManager defaultManager]  setPlaform:UMSocialPlatformType_VKontakte appKey:@"5786123" appSecret:nil redirectURL:nil];
    
}



@end
