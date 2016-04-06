//
//  EmoijFaceToolBar.h
//  KeyBoardView
//
//  Created by 余强 on 16/3/24.
//  Copyright © 2016年 你好，我是余强，一位来自上海的ios开发者，现就职于bdcluster(上海大数聚科技有限公司)。这个工程致力于完成一个优雅的IM实现方案，如果您有兴趣，请来到项目交流群：533793277. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KeyBoardHeader.h"

@interface EmotionFaceToolBar : UIView


/**
 *  @brief 表情中可能不是emoij，也可能是其他图片，就另外处理了
 */
@property(nonatomic,assign) BOOL isEmoij;
@property(nonatomic,copy) void(^switchEmoijBlock)(NSInteger);
@property(nonatomic,copy) void(^sendEmoijBlock)();



- (void)setBtnIndexSelect:(NSInteger)index;

@end
