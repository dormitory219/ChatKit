//
//  ChatDemoDataSourceHelp.h
//  KeyBoardView
//
//  Created by 余强 on 16/3/21.

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
