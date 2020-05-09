//
//  QDNormalWebViewController.m
//  QDINFI
//
//  Created by yl-yin on 2019/7/16.
//  Copyright © 2019 quantdo. All rights reserved.
//

#import "QDNormalWebViewController.h"
#import "QDCommonTopView.h"
#import <WebKit/WebKit.h>
#import "QDShareManager.h"
static NSString * const QD_UrlThemeLight = @"theme=light";

@interface QDNormalWebViewController ()<WKNavigationDelegate>
@property (nonatomic,strong) QDCommonTopView *topView;
@property (nonatomic,strong)WKWebView *webView;

@end

@implementation QDNormalWebViewController
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}
- (instancetype)initWithUrlString:(NSString *)urlString title:(NSString *)title shareTitle:(NSString *)shareTitle shareDesc:(NSString *)desc {
    self = [super init];
    if (self) {
        self.hidesBottomBarWhenPushed = YES;
        self.urlString = urlString;
        self.title = title;
        self.shareTitle = shareTitle;
        self.shareDesc = desc;
        if (self.shareTitle.length>0 || self.shareDesc.length>0) {
            self.showShareButton = YES;
        }
    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
    self.tabBarController.tabBar.hidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createUI];
//    self.urlString = [self.urlString stringByAppendingString:[NSString stringWithFormat:@"&%@", QD_UrlThemeLight]];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.urlString] cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:5.0];
    [_webView loadRequest:request];
}
-(void)createUI{
    self.view.backgroundColor = [UIColor colorWithHexString:@"#21212B"];
    
    _topView = [QDCommonTopView new];
    [self.view addSubview:_topView];
    _topView.title = self.title;
    [_topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.left.mas_equalTo(0);
        make.height.mas_equalTo(iPhoneX ? 88 : 64);
    }];
    MJWeakSelf
    _topView.LeftClickBlock = ^{
        if ([weakSelf.webView canGoBack]) {
            [weakSelf.webView goBack];
        } else {
//            [weakSelf.navigationController popViewControllerAnimated:YES];
            if (weakSelf.presentingViewController) {
                [weakSelf dismissViewControllerAnimated:YES completion:nil];
            } else {
                [weakSelf.navigationController popViewControllerAnimated:YES];
            }
        }
    };
    _topView.rightButtonHidden = !self.showShareButton;
    _topView.ShareBlock = ^(UIButton * _Nonnull button) {
        QDShareManager *share = [QDShareManager new];
        if (!weakSelf.shareTitle || weakSelf.shareTitle.length<1) {
            weakSelf.shareTitle = weakSelf.title;
        }
        [share shareWebPage:weakSelf.shareTitle shareDesc:weakSelf.shareDesc image:[UIImage imageNamed:@"AppIcon"] url:weakSelf.urlString viewController:weakSelf];
        NSLog(@"%s",__func__);
    };
    
    _webView = [[WKWebView alloc] initWithFrame:CGRectZero];
    _webView.backgroundColor = [UIColor colorWithHexString:@"21212b"];
    _webView.scrollView.backgroundColor = [UIColor colorWithHexString:@"21212b"];
    [_webView setOpaque:NO];
    _webView.navigationDelegate = self;
    [self.view addSubview:_webView];
    
    [_webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(_topView.mas_bottom);
        make.bottom.mas_equalTo(self.view);
    }];
    if (@available(iOS 11.0, *)) {
        self.webView.scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
}



#pragma mark - WKNavigationDelegate
// 页面开始加载时调用
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{
    //    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
}

// 当内容开始返回时调用
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation{
}

// 页面加载完成之后调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    NSLog(@"didFinishNavigation");
    //    [MBProgressHUD hideHUDForView:self.view animated:YES];
}
// 页面加载失败时调用
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation{
    NSLog(@"didFailProvisionalNavigation");
    //    [MBProgressHUD hideHUDForView:self.view animated:YES];
}
// 接收到服务器跳转请求之后调用
- (void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(WKNavigation *)navigation{
    
}
// 在收到响应后，决定是否跳转
- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler{
    
    NSLog(@"decidePolicyForNavigationResponse: %@",navigationResponse.response.URL.absoluteString);
    //允许跳转
    decisionHandler(WKNavigationResponsePolicyAllow);
    //不允许跳转
    //decisionHandler(WKNavigationResponsePolicyCancel);
}
// 在发送请求之前，决定是否跳转
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
    
    NSLog(@"decidePolicyForNavigationAction : %@",navigationAction.request.URL.absoluteString);
    //允许跳转
    decisionHandler(WKNavigationActionPolicyAllow);
    //不允许跳转
    //decisionHandler(WKNavigationActionPolicyCancel);
}


@end
