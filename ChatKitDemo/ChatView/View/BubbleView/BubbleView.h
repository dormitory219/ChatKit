//
//  SubView.h
//  121212121
//
//  Created by 余强 on 16/3/30.
//  Copyright © 2016年 你好，我是余强，一位来自上海的ios开发者，现就职于bdcluster(上海大数聚科技有限公司)。这个工程致力于完成一个优雅的IM实现方案. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BubbleView : UIView

@property(nonatomic,strong) UIImage *bubbleImage;
@property(nonatomic,assign) BOOL isSender;


- (void)setBubbleImage:(UIImage *)bubbleImage
              isSender:(BOOL)isSender;
@end
