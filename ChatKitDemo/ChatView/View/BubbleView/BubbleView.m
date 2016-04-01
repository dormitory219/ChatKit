//
//  SubView.m
//  121212121
//
//  Created by 余强 on 16/3/30.
//  Copyright © 2016年 你好，我是余强，一位来自上海的ios开发者，现就职于bdcluster(上海大数聚科技有限公司)。这个工程致力于完成一个优雅的IM实现方案. All rights reserved.
//

#import "BubbleView.h"
#import "UIImage+Addition.h"


@implementation BubbleView


- (void)setBubbleImage:(UIImage *)bubbleImage isSender:(BOOL)isSender
{
    _bubbleImage = bubbleImage;
    _isSender = isSender;
    [self setNeedsDisplay];
}


- (void)drawRect:(CGRect)rect
{
    [UIImage drawImage:_bubbleImage atFrame:rect isSender:_isSender];
}

@end
