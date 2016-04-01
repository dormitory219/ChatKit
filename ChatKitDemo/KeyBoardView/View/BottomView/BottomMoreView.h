//
//  BottomMoreView.h
//  KeyBoardView
//
//  Created by 余强 on 16/3/20.
//  Copyright © 2016年 你好，我是余强，一位来自上海的ios开发者，现就职于bdcluster(上海大数聚科技有限公司)。这个工程致力于完成一个优雅的IM实现方案. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KeyBoardHeader.h"


@protocol MoreViewDelegate <NSObject>

- (void)moreViewClick:(MoreViewType)type;

@end

@interface BottomMoreView : UIView


@property(nonatomic,weak) id<MoreViewDelegate>moreViewDelegate;

@end
