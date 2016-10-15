//
//  MessageModel.h
//  KeyBoardView
//
//  Created by 余强 on 16/3/21.
//  Copyright © 2016年 你好，我是余强，一位来自上海的ios开发者，现就职于bdcluster(上海大数聚科技有限公司)。这个工程致力于完成一个优雅的IM实现方案. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ChatHelp.h"
#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

#import "MessageServiceModel.h"


//chatUi界面模型

@interface MessageModel : NSObject


//textMessage
@property (nonatomic,copy)     NSString *text;


//photoMessage
/**
 *  @brief 发送图片本地图片大小，接收图片服务器返回图片大小
 */
@property (nonatomic,assign)   CGSize size;

//@property (nonatomic,strong)   UIImage *photo;


/**
 *  @brief 本地图片路径:设置path，而不是UIImage对象，是为了能实现gif图片与静态图片的显示:
 */
@property (nonatomic,copy)   NSString *localPhotoPath;


/**
 *  @brief photo缩略图url
 */
@property (nonatomic,copy)     NSString *thumbnailUrl;
/**
 *  @brief photo大图url
 */
@property (nonatomic,copy)     NSString *originPhotoUrl;

/**
 *  @brief 是否是gif图片：emotion中gif,相册中gif图片：另外处理
 */
@property (nonatomic,assign)    BOOL isGif;


//videoMessage
/**
 *  @brief video的缩略图的本地路径
 */
@property (nonatomic,copy)   NSString *videoThumbPhoto;
/**
 *  @brief video缩略图的url地址
 */
@property (nonatomic,copy)     NSString *videoThumbUrl;

@property (nonatomic,copy)     NSString *videoUrl;
@property (nonatomic,copy)     NSString *locationVideoPath;
/**
 *  @brief 本地是否缓存了
 */
@property (nonatomic,assign)   BOOL      isVideoCache ;

/**
 *  @brief 是否正在下载
 */
@property (nonatomic,assign)   BOOL      isDownloading ;

//voiceMessage
@property (nonatomic,copy)     NSString *voicePath;
@property (nonatomic,copy)     NSString *voiceUrl;

@property (nonatomic,assign)   BOOL      isPlaying;
/**
 *  @brief 录音时长,以秒(s)为单位
 */
@property (nonatomic,copy)     NSString *voiceDuration;






//locationMessage
/**
 *  @brief 地图截屏本地地址
 */
@property (nonatomic,copy)  NSString *localPositionPhotoPath;
@property (nonatomic,copy)    NSString *address;
@property (nonatomic,strong)  CLLocation *location;





//User
@property (nonatomic,strong)  UIImage *avatar;
@property (nonatomic,copy)    NSString *avatarUrl;

@property (nonatomic,strong)  NSString *messageId;
@property (nonatomic,strong)  NSString *nickName;
@property (nonatomic,strong)  NSString *username;
@property (nonatomic,assign)  BOOL isSender;



//others
@property (nonatomic,strong)  NSString *timeStamp;
@property (nonatomic,assign)  BOOL sended;
@property (nonatomic,assign)  MessageBodyType bubbleMessageBodyType;
@property (nonatomic,assign)  BOOL isRead;
@property (nonatomic,assign)  MessageDeliveryState deliveryState;



/**
 *  @brief 业务层model
 */
@property(nonatomic,strong)  MessageServiceModel *imMessage;




@end
