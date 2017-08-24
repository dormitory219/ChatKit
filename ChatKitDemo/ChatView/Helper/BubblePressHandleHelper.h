//
//  BubbleClickHandleHelper.h
//  KeyBoardView
//
//  Created by 余强 on 16/3/27.

//

#import <Foundation/Foundation.h>
#import "MessageModel.h"
#import "MLEmojiLabel.h"

@interface BubblePressHandleHelper : NSObject


+ (instancetype)helper;

//点击photoBubble,大图浏览图片
- (void)photoBrow:(MessageModel *)message photo:(UIImageView *)photo;

//点击audioBubble,播放或暂停语音播放
- (void)audioPlayOrStop:(MessageModel *)message finishPlay:(void(^)(NSString *url))finishPlay;

//点击videoBubble,浏览视频
- (void)videoPlay:(MessageModel *)message;


//点击locationBubble,浏览地图
- (void)locationMap:(MessageModel *)message viewController:(UIViewController *)controller;

//双击纯文本
- (void)viewTextContent:(MessageModel *)message;

//点击文本中link链接处理
- (void)linkHandle:(NSString *)link type:(MLEmojiLabelLinkType)type;

@end
