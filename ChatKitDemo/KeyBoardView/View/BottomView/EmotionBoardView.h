//
//  EmotionBoardView.h
//  KeyBoardView
//
//  Created by 余强 on 16/3/25.
//  Copyright © 2016年 你好，我是余强，一位来自上海的ios开发者，现就职于bdcluster(上海大数聚科技有限公司)。这个工程致力于完成一个优雅的IM实现方案，如果您有兴趣，请来到项目交流群：533793277. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "KeyBoardHeader.h"
#import "FLAnimatedImageView.h"
#import "FLAnimatedImage.h"
#import "Emoji.h"
#import "EmotionViewDelegate.h"


@interface EmotionBoardView : UIView

+ (instancetype)faceBoardView:(NSInteger)type scrollView:(UIScrollView *)scrollView frame:(CGRect)frame;


/**
 *  @brief 第一页为emoij，其他页为gif
 */
@property(nonatomic,assign) NSInteger faceType;

//该表情面板有多少页
@property(nonatomic,assign) NSInteger page;

//@property(nonatomic,assign) BOOL isEmoij;
@property(nonatomic,assign) EmotionType emotionType;

@property(nonatomic,weak) id<EmotionViewDelegate> emotionViewDelegate;
@end
