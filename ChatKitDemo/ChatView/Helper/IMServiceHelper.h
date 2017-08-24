//
//  IMServiceHelper.h
//  KeyBoardView
//
//  Created by 余强 on 16/3/28.

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
