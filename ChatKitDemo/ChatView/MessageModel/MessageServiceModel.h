//
//  MessageServiceModel.h
//  KeyBoardView
//
//  Created by 余强 on 16/3/28.
//  Copyright © 2016年 你好，我是余强，一位来自上海的ios开发者，现就职于bdcluster(上海大数聚科技有限公司)。这个工程致力于完成一个优雅的IM实现方案，如果您有兴趣，请来到项目交流群：533793277. All rights reserved.
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
