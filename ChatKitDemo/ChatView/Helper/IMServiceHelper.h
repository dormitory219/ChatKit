//
//  IMServiceHelper.h
//  KeyBoardView
//
//  Created by 余强 on 16/3/28.
//  Copyright © 2016年 你好，我是余强，一位来自上海的ios开发者，现就职于bdcluster(上海大数聚科技有限公司)。这个工程致力于完成一个优雅的IM实现方案. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MessageModel.h"


//网络TCP长连接监听：xmpp 或者 webSocket

@protocol IMServiceDelegate <NSObject>


/**
 *  @brief 消息成功或失败回调
 *
 *  @param imMessage <#imMessage description#>
 */
- (void)didSendMessage:(MessageServiceModel *)imMessage;


//
/**
 *  @brief 接受实时聊天消息
 *
 *  @param imMessage <#imMessage description#>
 */
- (void)didReceiveMessage:(MessageServiceModel *)imMessage;


/**
 *  @brief 接收到好友请求消息
 *
 *  @param imMessage <#imMessage description#>
 */
- (void)didRecevieFriendRequest:(MessageServiceModel *)imMessage;

@end

@interface IMServiceHelper : NSObject

@property(nonatomic,weak) id <IMServiceDelegate>delegate;

+ (instancetype)helper;


- (void)sendMessage:(MessageModel *)message;



@end
