//
//  ChatHelp.h
//  KeyBoardView
//
//  Created by joy_yu on 16/3/21.
//  Copyright © 2016年 bdcluster(上海大数聚科技有限公司). All rights reserved.
//

#ifndef ChatHelp_h
#define ChatHelp_h

#import "KeyBoardHeader.h"
#import <UIImageView+WebCache.h>


//chatCell内部视图间距
#define KTopMargin 10
#define KLeftMargin 12


//BubbleImageView

#define KTopBubbleImageMargin 3.5

//由于图片左右拉伸导致图片左右间隙需要调整
#define KReceiverLeftBubbleImageMargin 9
#define KReceiverRightBubbleImageMargin 4

#define KSenderLeftBubbleImageMargin 4
#define KSenderRightBubbleImageMargin 9
#define KBubbleImageMaxWidth 145
#define KBubbleImageMaxHeight 145

//bubbleView最大宽度
#define KMaxWidth SCREEN_WIDTH*3/5


//BubbleVoiceRecoderView
#define KBubbleVoiceMaxWidth SCREEN_WIDTH*3/5
// 发送

#define KSendVoiceImageDefault @"SenderVoiceNodePlaying@2x"      // 小喇叭默认图片
#define KSendVoiceAnimationArray    @[                                   \
                                      @"SenderVoiceNodePlaying000@2x",  \
                                      @"SenderVoiceNodePlaying001@2x",  \
                                      @"SenderVoiceNodePlaying002@2x",  \
                                      @"SenderVoiceNodePlaying003@2x"   \
                                    ]



// 接收
#define KReceiveVoiceImageDefault @"ReceiverVoiceNodePlaying@2x"    // 小喇叭默认图片

#define KReceiveVoiceAnimationArray  @[                                    \
                                      @"ReceiverVoiceNodePlaying000@2x",  \
                                      @"ReceiverVoiceNodePlaying001@2x",  \
                                      @"ReceiverVoiceNodePlaying002@2x",  \
                                      @"ReceiverVoiceNodePlaying003@2x"   \
                                    ]
#define      KRandomColour                        [UIColor colorWithRed:0.1*(arc4random()%10) green:0.1*(arc4random()%10)  blue:0.1*(arc4random()%10)  alpha:1]


//BubbleLocationView
#define KBubbleLocationImageDefault @"chat_location_preview@2x"

//AlertView
#define AlertShow(msg) [[[UIAlertView alloc] initWithTitle:nil message:msg delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil] show]


//时间格式
#define KDateFormate @"YYYY/MM/dd hh:mm:ss"
//时间戳出现时间间隔
#define kTimeInterval 60


//接收到消息通知
#define KReceiveMessageNotification @"receiveMessageNotification"
//消息发送成功通知
#define KDidSendMessageNotification @"didSendMessageNotification"



/**
 *  @brief 消息类型
 */
typedef NS_ENUM(NSInteger, MessageBodyType) {
    /**
     *  纯文本消息
     */
    MessageBodyTypeText = 0,
    /**
     *  图片消息
     */
    MessageBodyTypePhoto = 1,
    /**
     *  视频消息
     */
    MessageBodyTypeVideo = 2,
    /**
     *  音频消息
     */
    MessageBodyTypeVoice = 3,
    /**
     *  位置消息
     */
    MessageBodyTypeLocation = 4,
};



/**
 监听进度响应block
 */
typedef void (^progressBlock)(NSProgress *);


/**
 *  @brief 聊天消息发送状态
 */
typedef NS_ENUM(NSInteger, MessageDeliveryState) {
    /**
     *  正在发送
     */
    MessageDeliveryStateDelivering,
    /**
     *  已发送, 成功
     */
    MessageDeliveryStateDelivered,
    /**
     *  已发送, 失败
     */
    MessageDeliveryStateFailure
};

#endif /* ChatHelp_h */
