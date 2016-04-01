//
//  EmotionViewDelegate.h
//  KeyBoardView
//
//  Created by 余强 on 16/3/25.
//  Copyright © 2016年你好，我是余强，一位来自上海的ios开发者，现就职于bdcluster(上海大数聚科技有限公司)。这个工程致力于完成一个优雅的IM实现方案. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol EmotionViewDelegate <NSObject>


/**
 *  @brief 点击emoij表情，增加内容，或删除最后一个emoij
 *
 *  @param emoij             <#emoij description#>
 *  @param isDeleteLastEmoij <#isDeleteLastEmoij description#>
 */
- (void)addEmoij:(NSString *)emoij isDeleteLastEmoij:(BOOL)isDeleteLastEmoij;

/**
 *  @brief 发送emoij表情
 *
 *  @param text <#text description#>
 */
- (void)sendEmoijMessage:(NSString *)text;

/**
 *  @brief 发送浪小花等图片，扩展功能
 *
 *  @param imagePath <#imagePath description#>
 */
- (void)sendEmotionImage:(NSString *)localPath emotionType:(EmotionType)emotionType;
@end
