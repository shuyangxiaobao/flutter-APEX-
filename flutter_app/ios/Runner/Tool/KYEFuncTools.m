//
//  KYEFuncTools.m
//  Reactgqb
//
//  Created by geqiangbao on 2019/1/29.
//  Copyright © 2019年 Facebook. All rights reserved.
//

#import "KYEFuncTools.h"
@implementation KYEFuncTools

+ (UIViewController *)presentingVC{
  UIWindow * window = [[UIApplication sharedApplication] keyWindow];
  if (window.windowLevel != UIWindowLevelNormal)
  {
    NSArray *windows = [[UIApplication sharedApplication] windows];
    for(UIWindow * tmpWin in windows)
    {
      if (tmpWin.windowLevel == UIWindowLevelNormal)
      {
        window = tmpWin;
        break;
      }
    }
  }
  UIViewController *result = window.rootViewController;
  while (result.presentedViewController) {
    result = result.presentedViewController;
  }
  
  if ([result isKindOfClass:[UITabBarController class]]) {
    result = [(UITabBarController *)result selectedViewController];
  }
  if ([result isKindOfClass:[UINavigationController class]]) {
    result = [(UINavigationController *)result topViewController];
  }
  return result;
}




@end

