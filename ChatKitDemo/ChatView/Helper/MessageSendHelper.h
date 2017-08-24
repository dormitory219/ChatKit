//
//  ChatSendHelper.h
//  KeyBoardView
//
//  Created by 余强 on 16/3/22.

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
