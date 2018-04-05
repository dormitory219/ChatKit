//
//  BottomMoreView.m
//  KeyBoardView
//
//  Created by joy_yu on 16/3/20.

//

#import "KeyBoardHeader.h"
#import "BottomMoreView.h"
#import "MoreViewBtn.h"
#define  KMargin 10

#define  KColumNum 4
#define  KRowNum 2

@interface BottomMoreView ()<UIScrollViewDelegate>

@property(nonatomic,strong) UIScrollView *scrollview;
@property(nonatomic,strong) UIPageControl *pageControl;
@end

@implementation BottomMoreView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setUpUi];
        self.backgroundColor = [[UIColor lightGrayColor]colorWithAlphaComponent:0.1];
    
        
        
    }
    return self;
}



- (void)setUpUi
{
    
    
    NSArray *normalImageArray = @[
                                  @"chatBar_colorMore_photo@2x",
                                  @"chatBar_colorMore_location@2x",
                                  @"chatBar_colorMore_camera@2x",
                                  @"chatBar_colorMore_audioCall@2x",
                                  @"chatBar_colorMore_videoCall@2x",
                                  ];
    NSArray *hightImageArray = @[
                                 @"chatBar_colorMore_photoSelected@2x",
                                 @"chatBar_colorMore_locationSelected@2x",
                                 @"chatBar_colorMore_cameraSelected@2x",
                                 @"chatBar_colorMore_audioCallSelected@2x",
                                 @"chatBar_colorMore_videoCallSelected@2x",
                                  ];
    NSArray *titleArray = @[
                            @"照片",
                            @"位置",
                            @"拍照",
                            @"语音电话",
                            @"视频通话",
                            ];
    self.scrollview = [[UIScrollView alloc]initWithFrame:self.bounds];
    self.scrollview.contentSize = CGSizeMake(self.bounds.size.width*2, 0);
    self.scrollview.showsHorizontalScrollIndicator = NO;
    self.scrollview.delegate = self;
    self.scrollview.pagingEnabled = YES;
    [self addSubview:self.scrollview];
    
    CGFloat width = (self.width0 - KMargin*(KColumNum+1))/KColumNum;
    CGFloat height = 85;
    for (int i = 0; i<titleArray.count; i++)
    {
        MoreViewBtn *btn = [[MoreViewBtn alloc]init];
                           // WithFrame:CGRectMake(KMargin+(i%KColumNum)*(width+KMargin), KMargin+(i/KColumNum)*(height+KMargin/2), width,height)];
        NSInteger page = i/(KRowNum*KColumNum);
        btn.frame = [self getFrameWithColumesOfPerRow:KColumNum rowsOfPerColumn:KRowNum itemWidth:width itemHeight:height marginX:KMargin maginY:KMargin atIndex:i atPage:page scrollView:self.scrollview];
        [btn setImage:[NSBundle imageWithBundle:BundleName imageName:normalImageArray[i]] forState:UIControlStateNormal];
         [btn setImage:[NSBundle imageWithBundle:BundleName imageName:hightImageArray[i]] forState:UIControlStateHighlighted];
        [btn setTitle:titleArray[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnClickAction:) forControlEvents:UIControlEventTouchUpInside];
         [self.scrollview addSubview:btn];
        btn.tag = i;
        
    }
    
    self.pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(self.width0/2, self.height0-15, 10, 10)];
    self.pageControl.numberOfPages = self.scrollview.contentSize.width/self.width0;
    self.pageControl.currentPageIndicatorTintColor = [UIColor grayColor];
    self.pageControl.pageIndicatorTintColor = [[UIColor lightGrayColor]colorWithAlphaComponent:0.6];
    [self addSubview:self.pageControl];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSInteger page = scrollView.contentOffset.x/self.width0;
    self.pageControl.currentPage = page;
}

/**
 *  @brief 格式布局
 *
 *  @param columesOfPerRow 多少列
 *  @param rowsOfPerColumn 多少行
 *  @param itemWidth       格宽
 *  @param itemHeight      格高
 *  @param marginX         格子间左右间隙
 *  @param marginY         格子间上下间隙
 *  @param index           格子所在索引
 *  @param page            格子所在页码
 *  @param scrollView      格子所在scrollview
 *
 *  @return <#return value description#>
 */
- (CGRect)getFrameWithColumesOfPerRow:(NSInteger)columesOfPerRow
                      rowsOfPerColumn:(NSInteger)rowsOfPerColumn
                            itemWidth:(CGFloat)itemWidth
                           itemHeight:(NSInteger)itemHeight
                              marginX:(CGFloat)marginX
                               maginY:(CGFloat)marginY
                              atIndex:(NSInteger)index
                               atPage:(NSInteger)page
                           scrollView:(UIScrollView *)scrollView
{
    CGRect itemFrame = CGRectMake((index % columesOfPerRow) * (itemWidth + marginX) + marginX + (page * CGRectGetWidth(scrollView.bounds)), ((index / columesOfPerRow) - rowsOfPerColumn * page) * (itemHeight + marginY) + marginY, itemWidth, itemHeight);
    return itemFrame;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    NSArray *titleArray = @[
                            @"照片",
                            @"位置",
                            @"拍照",
                            @"语音电话",
                            @"视频通话",
                            ];
    CGFloat width = (self.width0 - KMargin*(KColumNum+1))/KColumNum;
    CGFloat height = 85;
    for (int i = 0; i<titleArray.count; i++)
    {
        MoreViewBtn *btn = self.scrollview.subviews[i];
        NSInteger page = i/(KRowNum*KColumNum);
        btn.frame = [self getFrameWithColumesOfPerRow:KColumNum rowsOfPerColumn:KRowNum itemWidth:width itemHeight:height marginX:KMargin maginY:KMargin atIndex:i atPage:page scrollView:self.scrollview];
    }
    self.pageControl.frame = CGRectMake(self.width0/2, self.height0-15, 10, 10);
}

- (void)btnClickAction:(UIButton *)btn
{
    if (_moreViewDelegate && [_moreViewDelegate respondsToSelector:@selector(moreViewClick:)])
    {
        [_moreViewDelegate moreViewClick:(MoreViewType)btn.tag];
    }
}
@end
