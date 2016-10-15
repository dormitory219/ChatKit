//
//  ChatDemoDataSourceHelp.h
//  KeyBoardView
//
//  Created by 余强 on 16/3/21.
//  Copyright © 2016年 你好，我是余强，一位来自上海的ios开发者，现就职于bdcluster(上海大数聚科技有限公司)。这个工程致力于完成一个优雅的IM实现方案. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MessageModel.h"
#import "TextMessageModel.h"
#import "PhotoMessageModel.h"
#import "VideoMessageModel.h"
#import "VoiceMessageModel.h"
#import "LocationMessageModel.h"

@interface ChatDemoDataSourceHelper : NSObject


//获取模拟消息数据
+ (NSMutableArray *)getFakeMessages;


//模拟接收的消息
+ (MessageModel *)getReceiveMessage;

@end
