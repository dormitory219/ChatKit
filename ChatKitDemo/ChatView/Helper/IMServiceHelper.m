//
//  IMServiceHelper.m
//  KeyBoardView
//
//  Created by 余强 on 16/3/28.

//

#import "IMServiceHelper.h"

@implementation IMServiceHelper


+ (instancetype)helper
{
    static dispatch_once_t onceToken;
    static IMServiceHelper * helper = nil;
    dispatch_once(&onceToken, ^{
        helper = [[self alloc]init];
    });
    return helper;
}


- (void)sendMessage:(MessageModel *)message
{
    
    MessageServiceModel *imMessage = message.imMessage;
    
    [self sendMessageFrom:imMessage.from to:imMessage.to messageBody:imMessage.messageBody];
    
    
}


- (void)sendMessageFrom:(NSString *)from
                     to:(NSString *)to
            messageBody:(NSString *)body
{
    
}


- (void)didSendMessage:(MessageServiceModel *)imMessage
{
    //1.发送成功后插入数据库
    //数据库操作：dataBaseHelper
    
    
    
    
    //使用代理，
    if (self.delegate && [self.delegate respondsToSelector:@selector(didSendMessage:)])
    {
        
        [self.delegate didSendMessage:imMessage];
        
    }
    
    
    /*
    //2.发通知，更新聊天界面
    [[NSNotificationCenter defaultCenter]postNotificationName:KDidSendMessageNotification object:imMessage];
     */

}


//网络TCP长连接监听：xmpp 或者 webSocket
- (void)didReceiveMessage:(MessageServiceModel *)imMessage
{
    
    
    //使用代理，
    if (self.delegate && [self.delegate respondsToSelector:@selector(didSendMessage:)])
    {
        
        [self.delegate didReceiveMessage:imMessage];
        
    }
    
    /*
    [[NSNotificationCenter defaultCenter]postNotificationName:KReceiveMessageNotification object:imMessage];
     */
    
}

- (void)didRecevieFriendRequest:(MessageServiceModel *)imMessage
{
    //使用代理，
    if (self.delegate && [self.delegate respondsToSelector:@selector(didRecevieFriendRequest:)])
    {
        [self.delegate didRecevieFriendRequest:imMessage];
        
    }
}



@end
