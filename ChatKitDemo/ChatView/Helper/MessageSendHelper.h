//
//  ChatSendHelper.h
//  KeyBoardView
//
//  Created by 余强 on 16/3/22.
//  Copyright © 2016年 你好，我是余强，一位来自上海的ios开发者，现就职于bdcluster(上海大数聚科技有限公司)。这个工程致力于完成一个优雅的IM实现方案，如果您有兴趣，请来到项目交流群：533793277. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MessageModel.h"
#import "ChatHelp.h"


@interface MessageSendHelper : NSObject


/**
 *  @brief 发送消息
 *
 *  @param message         消息
 *  @param completionBlock 返回消息,含消息发送状态:
 */
+ (void)sendMessage:(MessageModel *)message
         completion:(void(^)(MessageServiceModel *))completionBlock;

@end
