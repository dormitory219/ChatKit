//
//  ChatDemoDataSourceHelp.m
//  KeyBoardView
//
//  Created by 余强 on 16/3/21.

//

#import "ChatDemoDataSourceHelper.h"
#import "NSDate+Addition.h"


@implementation ChatDemoDataSourceHelper


+ (MessageModel *)getTextMessage:(BOOL)isSender
{
    NSArray *textArray  = @[
                            @"hello,i am joy,,这个工程致力于完成一个优雅的IM实现方案:https://github.com/dormitory219/ChatKit",
                            @"这是聊天界面,这个工程致力于完成一个优雅的IM实现方案。",
                            @"这是聊天界面",
                            @"这个工程致力于完成一个优雅的IM实现方案。"
                            
                            ];
    MessageModel *textMessage = [TextMessageModel text:textArray[arc4random_uniform(4)]  username:@"qyu" timeStamp:[NSDate date:[NSDate date] WithFormate:KDateFormate] isSender:isSender];
                                
    
    textMessage.avatar = [UIImage imageNamed:@"avatar"];
    
    if (isSender) {
        textMessage.avatarUrl = @"http://d.hiphotos.baidu.com/zhidao/wh%3D450%2C600/sign=603e37439313b07ebde8580c39e7bd15/a8014c086e061d9591b7875a7bf40ad163d9cadb.jpg";
         textMessage.deliveryState = 1+ arc4random_uniform(2);
        
        MessageServiceModel *imMessage = [[MessageServiceModel alloc]init];
        imMessage.from = @"joy";
        imMessage.to = @"lucy";
        imMessage.messageId = [self getMessageId];
        textMessage.imMessage = imMessage;
        
    }else{
        textMessage.avatarUrl = @"http://c.hiphotos.baidu.com/zhidao/wh%3D600%2C800/sign=97a8a22cd139b6004d9b07b1d9601912/9f2f070828381f306b422c66ad014c086f06f0a2.jpg";
        
        textMessage.deliveryState = MessageDeliveryStateDelivered;
        
        MessageServiceModel *imMessage = [[MessageServiceModel alloc]init];
        imMessage.from = @"lucy";
        imMessage.to = @"joy";
        imMessage.messageId = [self getMessageId];
        textMessage.imMessage = imMessage;
    }
  
    textMessage.bubbleMessageBodyType = MessageBodyTypeText;
    
    return textMessage;
}

+ (MessageModel *)getPhotoMessage:(BOOL)isSender
{
    MessageModel *photoMessage = [PhotoMessageModel Photo:nil thumbnailUrl:@"" originPhotoUrl:@"" username:@"joy" timeStamp:[NSDate date:[NSDate date] WithFormate:KDateFormate] isSender:isSender];
    photoMessage.avatar = [UIImage imageNamed:@"avatar"];
    
    NSArray *receiverImageArray = @[
                                    @"http://imgsrc.baidu.com/forum/w%3D580/sign=d5a395f962d0f703e6b295d438f85148/9c670c338744ebf845fca7d1d9f9d72a6159a753.jpg",
                                    @"http://img.hb.aicdn.com/b617afdf7a972b26c438293c762c9f50b7eed0b6146a5-6bQadP_fw580",
                                    @"http://hiphotos.baidu.com/exp/pic/item/8b527d2762d0f7032c3beffb0bfa513d2797c5c9.jpg"
                                    
                                    ];
    
    
    NSArray *sendImageArray = @[
                                [[NSBundle mainBundle]pathForResource:@"house.jpg" ofType:nil],
                                [[NSBundle mainBundle]pathForResource:@"魔漫2.jpg" ofType:nil],
                                [[NSBundle mainBundle]pathForResource:@"114.png" ofType:nil],
                                [[NSBundle mainBundle]pathForResource:@"登录按钮背景@2x.png" ofType:nil]
                                ];
    if (isSender) {
        photoMessage.avatarUrl = @"http://d.hiphotos.baidu.com/zhidao/wh%3D450%2C600/sign=603e37439313b07ebde8580c39e7bd15/a8014c086e061d9591b7875a7bf40ad163d9cadb.jpg";
        photoMessage.localPhotoPath = sendImageArray[arc4random_uniform(4)];
        photoMessage.isGif = NO;
        photoMessage.deliveryState = 1+ arc4random_uniform(2);
        
        MessageServiceModel *imMessage = [[MessageServiceModel alloc]init];
        imMessage.from = @"joy";
        imMessage.to = @"lucy";
        imMessage.messageId = [self getMessageId];
        photoMessage.imMessage = imMessage;
        
    }else{
        //模仿服务器返回图片尺寸size
        NSArray *sizeArray = @[
                               [NSValue valueWithCGSize:CGSizeMake(230/2, 306/2)],
                                [NSValue valueWithCGSize:CGSizeMake(800/2, 564/2)],
                                 [NSValue valueWithCGSize:CGSizeMake(200/2, 200/2)],
                               ];
        photoMessage.avatarUrl = @"http://c.hiphotos.baidu.com/zhidao/wh%3D600%2C800/sign=97a8a22cd139b6004d9b07b1d9601912/9f2f070828381f306b422c66ad014c086f06f0a2.jpg";
        NSInteger receiverRandomindex = arc4random_uniform(3);
        photoMessage.thumbnailUrl = receiverImageArray[receiverRandomindex];
        photoMessage.size = [(NSValue *)sizeArray[receiverRandomindex] CGSizeValue] ;
        photoMessage.deliveryState = MessageDeliveryStateDelivered;
        
        MessageServiceModel *imMessage = [[MessageServiceModel alloc]init];
        imMessage.from = @"lucy";
        imMessage.to = @"joy";
        imMessage.messageId = [self getMessageId];
        photoMessage.imMessage = imMessage;
    }
    photoMessage.bubbleMessageBodyType = MessageBodyTypePhoto;

    
    return photoMessage;
}

+ (MessageModel *)getVideoMessage:(BOOL)isSender
{
 
    MessageModel *videoMessage = [VideoMessageModel VideoThumbPhoto:nil videoThumbUrl:nil videoUrl:nil username:nil timeStamp:[NSDate date:[NSDate date] WithFormate:KDateFormate] isSender:isSender];
    
    
    if (isSender) {
        videoMessage.avatarUrl = @"http://d.hiphotos.baidu.com/zhidao/wh%3D450%2C600/sign=603e37439313b07ebde8580c39e7bd15/a8014c086e061d9591b7875a7bf40ad163d9cadb.jpg";
        videoMessage.videoThumbPhoto = @[[[NSBundle mainBundle]pathForResource:@"playVideo1.jpg" ofType:nil],[[NSBundle mainBundle]pathForResource:@"playVideo2.jpg" ofType:nil]][arc4random_uniform(2)];
        videoMessage.locationVideoPath = [[NSBundle mainBundle]pathForResource:@"150511_JiveBike.mov" ofType:nil];
        videoMessage.isVideoCache = YES;
        videoMessage.deliveryState = 1+ arc4random_uniform(2);
        
        MessageServiceModel *imMessage = [[MessageServiceModel alloc]init];
        imMessage.from = @"joy";
        imMessage.to = @"lucy";
        imMessage.messageId = [self getMessageId];
        videoMessage.imMessage = imMessage;
        
    }else{
        videoMessage.avatarUrl = @"http://c.hiphotos.baidu.com/zhidao/wh%3D600%2C800/sign=97a8a22cd139b6004d9b07b1d9601912/9f2f070828381f306b422c66ad014c086f06f0a2.jpg";
         videoMessage.deliveryState = MessageDeliveryStateDelivered;
        http://www.mydigi.net/article/UploadPic/2013-5/2013514213339424.png
        videoMessage.videoThumbUrl = @[
                       
                                      @"http://imgsrc.baidu.com/baike/pic/item/63d0f703918fa0ec9c44c871249759ee3c6ddbcf.jpg"
                                      ][arc4random_uniform(1)];
        videoMessage.videoUrl = @"http://baobab.wdjcdn.com/14562919706254.mp4";
        
        MessageServiceModel *imMessage = [[MessageServiceModel alloc]init];
        imMessage.from = @"lucy";
        imMessage.to = @"joy";
        imMessage.messageId = [self getMessageId];
        videoMessage.imMessage = imMessage;
    }
    videoMessage.bubbleMessageBodyType = MessageBodyTypeVideo;
   
    

    return videoMessage;
}

+ (MessageModel *)getVoiceMessage:(BOOL)isSender
{
    VoiceMessageModel *voiceMessage = [VoiceMessageModel VoicePath:nil voiceUrl:nil voiceDuration:nil username:nil timeStamp:[NSDate date:[NSDate date] WithFormate:KDateFormate] isSender:isSender];
    
    //本地录音地址：
    NSArray *voicePathArray = @[
                                [[NSBundle mainBundle]pathForResource:@"Love Story.mp3" ofType:nil],
                                [[NSBundle mainBundle]pathForResource:@"贝加尔湖畔.mp3" ofType:nil]
                                ];
    if (isSender) {
        voiceMessage.avatarUrl = @"http://d.hiphotos.baidu.com/zhidao/wh%3D450%2C600/sign=603e37439313b07ebde8580c39e7bd15/a8014c086e061d9591b7875a7bf40ad163d9cadb.jpg";
        voiceMessage.deliveryState = 1+ arc4random_uniform(2);
        
        MessageServiceModel *imMessage = [[MessageServiceModel alloc]init];
        imMessage.from = @"joy";
        imMessage.to = @"lucy";
        imMessage.messageId = [self getMessageId];
        voiceMessage.imMessage = imMessage;
        
    }else{
        voiceMessage.avatarUrl = @"http://c.hiphotos.baidu.com/zhidao/wh%3D600%2C800/sign=97a8a22cd139b6004d9b07b1d9601912/9f2f070828381f306b422c66ad014c086f06f0a2.jpg";
        voiceMessage.deliveryState = MessageDeliveryStateDelivered;
        
        MessageServiceModel *imMessage = [[MessageServiceModel alloc]init];
        imMessage.from = @"lucy";
        imMessage.to = @"joy";
        imMessage.messageId = [self getMessageId];
        voiceMessage.imMessage = imMessage;
       
    }
    voiceMessage.bubbleMessageBodyType = MessageBodyTypeVoice;
    voiceMessage.voicePath = voicePathArray[arc4random_uniform(2)];
    voiceMessage.voiceDuration = @[@"4",@"12",@"100",@"34",@"30",@"120"][arc4random_uniform(6)];
    voiceMessage.isRead = arc4random_uniform(2);
    return voiceMessage;
}

//+ (MessageModel *)getEmotionMessageWithBubbleMessageType:(BubbleMessageType)bubbleMessageType {
//    MessageModel *emotionMessage = [[MessageModel alloc] initWithEmotionPath:[[NSBundle mainBundle] pathForResource:@"emotion1.gif" ofType:nil] sender:@"Jayson" timestamp:[NSDate date]];
//    emotionMessage.avatar = [UIImage imageNamed:@"avatar"];
//    emotionMessage.avatarUrl = @"http://www.pailixiu.com/jack/JieIcon@2x.png";
//    emotionMessage.bubbleMessageBodyType = MessageBodyTypeEmotion;
//    
//    return emotionMessage;
//}
//
+ (MessageModel *)getlocationsMessage:(BOOL)isSender
{
    MessageModel *localPositionMessage = [LocationMessageModel LocalPositionPhoto:
                                          [[NSBundle bundle:BundleName]pathForResource:@"chat_location_preview@2x" ofType:@"png"] address:@"" location:nil username:nil timeStamp:[NSDate date:[NSDate date] WithFormate:KDateFormate] isSender:isSender];
    
    if (isSender) {
        localPositionMessage.avatarUrl = @"http://d.hiphotos.baidu.com/zhidao/wh%3D450%2C600/sign=603e37439313b07ebde8580c39e7bd15/a8014c086e061d9591b7875a7bf40ad163d9cadb.jpg";
        localPositionMessage.deliveryState = 1+ arc4random_uniform(2);
        
        MessageServiceModel *imMessage = [[MessageServiceModel alloc]init];
        imMessage.from = @"joy";
        imMessage.to = @"lucy";
        imMessage.messageId = [self getMessageId];
        localPositionMessage.imMessage = imMessage;
        
    }else{
        localPositionMessage.avatarUrl = @"http://c.hiphotos.baidu.com/zhidao/wh%3D600%2C800/sign=97a8a22cd139b6004d9b07b1d9601912/9f2f070828381f306b422c66ad014c086f06f0a2.jpg";
         localPositionMessage.deliveryState = MessageDeliveryStateDelivered;
        
        MessageServiceModel *imMessage = [[MessageServiceModel alloc]init];
        imMessage.from = @"lucy";
        imMessage.to = @"joy";
        imMessage.messageId = [self getMessageId];
        localPositionMessage.imMessage = imMessage;
    }
    localPositionMessage.address = @[
                                          @"上海市徐汇区柳州路中星城1320号",
                                          @"新疆乌鲁木齐市维吾尔自治区干大木托呼伦贝尔草原一号大帐篷",
                                          @"江西省宜春市奉新县冯川镇城西河头村"
                                          
                                          ][arc4random_uniform(3)];
    localPositionMessage.bubbleMessageBodyType = MessageBodyTypeLocation;
    
    
    return localPositionMessage;
}


+ (NSString *)getChatDateTime
{
    NSDate *currentDate = [NSDate date];
    NSDateFormatter *dateFormate = [[NSDateFormatter alloc]init];
    dateFormate.dateFormat = KDateFormate;
    return [dateFormate stringFromDate:currentDate];
}

+ (MessageModel *)getReceiveMessage
{
    
    NSInteger index = arc4random_uniform(5);
    switch (index) {
        case 0:
            return   [self getPhotoMessage:NO];
            break;
        case 1:
            return   [self getVideoMessage:NO];
            break;
        case 2:
            return [self getVoiceMessage:NO];
            break;
        case 3:
            return[self getlocationsMessage: NO];
            break;
        case 4:
            return[self getTextMessage:NO];
            break;
        default:
            break;
    }

    
    return nil;
   
}


+ (NSString *)getMessageId
{
    return [NSString stringWithFormat:@"%zd",arc4random_uniform(arc4random_uniform(1000)*arc4random_uniform(1000))];
}


+ (NSMutableArray *)getFakeMessages
{
    NSMutableArray *messages = [[NSMutableArray alloc] init];
    
    for (NSInteger i = 0; i < 8; i ++) {
        [messages addObject:[self getPhotoMessage:(i % 2) ? YES : NO]];
        
       [messages addObject:[self getVideoMessage:(i % 2) ? YES : NO]];
        
        [messages addObject:[self getVoiceMessage:(i % 2) ? YES : NO]];
        
        [messages addObject:[self getChatDateTime]];
        
        [messages addObject:[self getlocationsMessage:(i % 2) ? YES : NO]];
        
        [messages addObject:[self getTextMessage:(i % 2) ? YES : NO]];
    }
    return messages;
}






@end
