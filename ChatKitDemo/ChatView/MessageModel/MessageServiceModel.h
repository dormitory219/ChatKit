//
//  MessageServiceModel.h
//  KeyBoardView
//
//  Created by joy_yu on 16/3/28.

//

#import <Foundation/Foundation.h>
#import "ChatHelp.h"


//im业务服务方面的模型：针对网络服务层

@interface MessageServiceModel : NSObject
/**
 *  @brief 消息来源用户
 */
@property(nonatomic,copy)  NSString *from;

/**
 *  @brief 消息到达用户
 */
@property(nonatomic,copy)  NSString *to;

/**
 *  @brief 消息发送或接收的时间
 */
@property(nonatomic,copy) NSString *timeStamp;

/**
 *  @brief 消息是否已读：远程标记
 */
@property(nonatomic,assign) BOOL isRead;


/**
 *  @brief 消息发送状态
 */
@property (nonatomic,assign) MessageDeliveryState deliveryState;


/**
 *  @brief 消息类型
 */
@property (nonatomic,assign) MessageBodyType messageType;

//不同于messageModel,这里messageBody只是一段文本：为纯文消息，或照片/音频/视频的远程地址
@property (nonatomic,copy)  NSString *messageBody;

//message唯一标识
@property (nonatomic,copy)  NSString *messageId;



@end
