//
//  UIView+FrameLayout.m
//  Frame分类
//
//  Created by 余强 on 16/1/28.
//  Copyright © 2016年 你好，我是余强，一位来自上海的ios开发者，现就职于bdcluster(上海大数聚科技有限公司)。这个工程致力于完成一个优雅的IM实现方案，如果您有兴趣，请来到项目交流群：533793277. All rights reserved.
//

#import "UIView+FrameLayout.h"

@implementation UIView (FrameLayout)
- (CGFloat)left0
{
    return self.frame.origin.x;
}

- (CGFloat)right0
{
    return self.frame.origin.x + self.frame.size.width;
}

- (CGFloat)top0
{
    return self.frame.origin.y;
}

- (CGFloat)bottom0
{
    return self.frame.origin.y + self.frame.size.height;
}

- (CGFloat)width0
{
    return self.frame.size.width;
}

- (CGFloat)height0
{
    return self.frame.size.height;
}

- (CGFloat)centerX0
{
    return self.center.x;
}

- (CGFloat)centerY0
{
    return self.center.y;
}

- (void)setLeft0:(CGFloat)left
{
    CGRect frame = self.frame;
    frame.origin.x = left;
    self.frame = frame;
}

- (void)setRight0:(CGFloat)right
{
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (void)setBottom0:(CGFloat)bottom
{
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (void)setSize0:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (void)setTop0:(CGFloat)top
{
    CGRect frame = self.frame;
    frame.origin.y = top;
    self.frame = frame;
}

- (void)setWidth0:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (void)setHeight0:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (void)setOrigin0:(CGPoint)point
{
    CGRect frame = self.frame;
    frame.origin = point;
    self.frame = frame;
}

- (void)setCenterX0:(CGFloat)centerX{
    self.center = CGPointMake(centerX, self.center.y);
}

- (void)setCenterY0:(CGFloat)centerY{
    self.center = CGPointMake(self.center.x, centerY);
}
@end
