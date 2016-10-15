//
//  UIView+FrameLayout.h
//  Frame分类
//
//  Created by 余强 on 16/1/28.
//  Copyright © 2016年 你好，我是余强，一位来自上海的ios开发者，现就职于bdcluster(上海大数聚科技有限公司)。这个工程致力于完成一个优雅的IM实现方案. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (FrameLayout)
- (CGFloat)left0;
- (CGFloat)right0;
- (CGFloat)top0;
- (CGFloat)bottom0;
- (CGFloat)width0;
- (CGFloat)height0;
- (CGFloat)centerX0;
- (CGFloat)centerY0;

- (void)setLeft0:(CGFloat)left;
- (void)setRight0:(CGFloat)right;
- (void)setBottom0:(CGFloat)bottom;
- (void)setSize0:(CGSize)size;
- (void)setTop0:(CGFloat)top;
- (void)setWidth0:(CGFloat)width;
- (void)setHeight0:(CGFloat)height;
- (void)setOrigin0:(CGPoint)point;
- (void)setCenterX0:(CGFloat)centerX;
- (void)setCenterY0:(CGFloat)centerY;
@end
