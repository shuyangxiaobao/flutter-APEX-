//
//  QDShareView.m
//  QDINFI
//
//  Created by xiaobao on 2019/6/3.
//  Copyright © 2019 quantdo. All rights reserved.
//

#import "QDShareView.h"
#import "QDShareCell.h"
#import "NSString+QDMethod.h"

#define ANIMATE_DURATION    0.25f
#define LINE_HEIGHT         74
#define BUTTON_HEIGHT       50
#define NORMAL_SPACE        7
#define LABEL_HEIGHT        45
@interface QDShareView ()


@end

@implementation QDShareView
- (instancetype)initWithShareHeadOprationWith:(NSArray *)titleArray andImageArry:(NSArray *)imageArray{
    
    self = [super init];
    if (self) {
        
        _shareBtnTitleArray = titleArray;
        _shareBtnImageArray = imageArray;
        
        self.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        //    背景，带灰度
        self.backgroundColor = [UIColor colorWithHexString:@"000000" alpha:0.4];
        //    可点击
        self.userInteractionEnabled = YES;
        //    点击背景，收起底部分享面板，移除本视图
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tappedCancel)];
        [self addGestureRecognizer:tapGesture];
        tapGesture.delegate = self;
        
        //    加载分享面板
        [self loadUIConfig];
    }
    return self;
}

- (void)loadUIConfig {
    
    [self addSubview:self.bgView];
    [self createBottomMenuBar];


    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectZero];
    [self.bgView addSubview:_pageControl];
    _pageControl.numberOfPages = 2;
    _pageControl.currentPage = 0;
    _pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
    _pageControl.pageIndicatorTintColor = [UIColor colorWithHexString:@"95959d"];
    [_pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.width.mas_equalTo(20);
        make.top.mas_equalTo(self.collection.mas_bottom).offset(15);
        make.height.mas_equalTo(10);
    }];
    
    
    //    弹出
    [UIView animateWithDuration:ANIMATE_DURATION animations:^{
        self.bgView.frame = CGRectMake(0, SCREEN_HEIGHT - CGRectGetHeight(self.bgView.frame), SCREEN_WIDTH, CGRectGetHeight(self.bgView.frame));
    }];
    
    //    icon 动画
    //    [self iconAnimation];
}

- (UIView *)bgView {
    
    if (_bgView == nil) {
        
        _bgView = [[UIView alloc] init];
        _bgView.backgroundColor = [UIColor colorWithHexString:@"#2c2c3a"];
        
        //    根据图标个数，计算行数，计算 backgroundView 的高度
        NSInteger index;
        if (_shareBtnTitleArray.count % 3 == 0) {
            
            index = _shareBtnTitleArray.count / 3;
        } else {
            
            index = _shareBtnTitleArray.count / 3 + 1;
        }
        _bgView.frame = CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, 120);
    }
    return _bgView;
}



- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    
    NSLog(@"%@",NSStringFromClass([touch.view class]));
    
//    // 若为UIButton
    if ([NSStringFromClass([touch.view class]) isEqualToString:@"UIView"]) {
        // UIButton 不需要响应 父视图的手势，保证出发方法 可以正常
        return NO;
    }
//    //默认都需要响应
    return  YES;
}


#pragma mark --------------------------- Selector

/**
 点击取消
 */
- (void)tappedCancel {
        [UIView animateWithDuration:ANIMATE_DURATION animations:^{
            [self.bgView setFrame:CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, 0)];
            self.alpha = 0;
            [self removeFromSuperview];
            if (self.TappCancelBlock) {
                self.TappCancelBlock();
            }
        } completion:^(BOOL finished) {
//            if (finished) {
//                [self removeFromSuperview];
//                if (self.TappCancelBlock) {
//                    self.TappCancelBlock();
//                }
//            }
        }];
}



// 创建底部菜单栏
-(void)createBottomMenuBar{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    //cell之间最小左右距离
    layout.minimumInteritemSpacing = 0;
    //cell之间最小上下距离
    layout.minimumLineSpacing = 0;
    
    //滚动方向
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    _collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    //注册cell
    [_collection registerClass:[QDShareCell class] forCellWithReuseIdentifier:@"QDShareCell"];
    
    //设置代理
    _collection.delegate = self;
    _collection.dataSource = self;
    
    //xlp0417 调节颜色
    
    //    _collection.backgroundColor = [UIColor colorWithHexString:@"293752"];
    _collection.backgroundColor = [UIColor colorWithHexString:@"#2c2c3a"];
    
    _collection.bounces = YES;
    _collection.alwaysBounceHorizontal = YES;
    [self.bgView addSubview:_collection];
    _collection.showsHorizontalScrollIndicator = NO;
    _collection.pagingEnabled = YES;
    [_collection mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(0));
        make.right.equalTo(@(0));
        make.top.equalTo(@(0));
        make.height.equalTo(@(84));
    }];
    
}


#pragma mark ---- UICollectionViewDelegate && UICollectionViewDatasource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _shareBtnTitleArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    QDShareCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"QDShareCell" forIndexPath:indexPath];

    QDWeakSelf(cell);
    cell.titleLab.text = [NSString stringWithFormat:@"%@",_shareBtnTitleArray[indexPath.row]];
    cell.headImgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",_shareBtnImageArray[indexPath.row]]];
    return cell;
}

//设置cell的偏移量
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(1, 0, 1, 2);
}

//设置cell的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(kScreen_Width/5, 84);
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%ld",indexPath.row);
    if (self.ShareBlock) {
        self.ShareBlock(self.shareBtnTitleArray[indexPath.row]);

    }
}

//已经停止减速<重点>
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //取到当前页数
    int index = scrollView.contentOffset.x / SCREEN_WIDTH;
    
    //设置当前page的页数为index
    self.pageControl.currentPage = index;
}


@end
