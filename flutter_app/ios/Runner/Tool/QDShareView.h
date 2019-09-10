//
//  QDShareView.h
//  QDINFI
//
//  Created by xiaobao on 2019/6/3.
//  Copyright © 2019 quantdo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface QDShareView : UIView<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UIGestureRecognizerDelegate>


//    所有标题
@property (nonatomic, strong) NSArray  *shareBtnTitleArray;
//    所有图片
@property (nonatomic, strong) NSArray  *shareBtnImageArray;
//    整个底部分享面板的 backgroundView
@property (nonatomic, strong) UIView   *bgView;

@property (nonatomic,strong)UICollectionView *collection;

@property (nonatomic,strong) UIPageControl *pageControl;





@property(nonatomic,copy)void(^ShareBlock)(NSString *title); //!< 分享block

@property(nonatomic,copy)void(^TappCancelBlock)(void); //!< 取消block

- (instancetype)initWithShareHeadOprationWith:(NSArray *)titleArray andImageArry:(NSArray *)imageArray;

- (void)tappedCancel;

@end

NS_ASSUME_NONNULL_END
