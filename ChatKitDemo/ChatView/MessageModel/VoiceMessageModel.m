//
//  VoiceMessageModel.m
//  KeyBoardView
//
//  Created by 余强 on 16/3/22.
//  Copyright © 2016年 你好，我是余强，一位来自上海的ios开发者，现就职于bdcluster(上海大数聚科技有限公司)。这个工程致力于完成一个优雅的IM实现方案，如果您有兴趣，请来到项目交流群：533793277. All rights reserved.
//


#import "VoiceMessageModel.h"

@implementation VoiceMessageModel


+ (instancetype)VoicePath:(NSString *)voicePath
                 voiceUrl:(NSString *)voiceUrl
            voiceDuration:(NSString *)voiceDuration
                 username:(NSString *)username
                timeStamp:(NSString *)timeStamp
                isSender:(BOOL)isSender
{
    return  [[self alloc]initWithVoicePath:voicePath voiceUrl:voiceUrl voiceDuration:voiceDuration username:username timeStamp:timeStamp isRead:NO isSender:isSender];
}


+ (instancetype)VoicePath:(NSString *)voicePath
                 voiceUrl:(NSString *)voiceUrl
            voiceDuration:(NSString *)voiceDuration
                 username:(NSString *)username
                timeStamp:(NSString *)timeStamp
                isRead:(BOOL)isRead
                isSender:(BOOL)isSender


{
    return  [[self alloc]initWithVoicePath:voicePath voiceUrl:voiceUrl voiceDuration:voiceDuration username:username timeStamp:timeStamp isRead:isRead isSender:isSender];
}




- (instancetype)initWithVoicePath:(NSString *)voicePath
                         voiceUrl:(NSString *)voiceUrl
                    voiceDuration:(NSString *)voiceDuration
                         username:(NSString *)username
                        timeStamp:(NSString *)timeStamp
                         isSender:(BOOL)isSender
{
    
    return [self initWithVoicePath:voicePath voiceUrl:voiceUrl voiceDuration:voiceDuration username:username timeStamp:timeStamp isRead:NO isSender:isSender];
    
    
}
- (instancetype)initWithVoicePath:(NSString *)voicePath
                         voiceUrl:(NSString *)voiceUrl
                    voiceDuration:(NSString *)voiceDuration
                         username:(NSString *)username
                        timeStamp:(NSString *)timeStamp
                           isRead:(BOOL)isRead
                         isSender:(BOOL)isSender
{
    
    self = [super init];
    if (self) {
        self.voicePath = voicePath;
        
        
        self.username = username;
        self.timeStamp = timeStamp;
        self.isRead = isRead;
        self.voiceDuration = voiceDuration;
        
        self.bubbleMessageBodyType = MessageBodyTypeVoice;
        self.isSender = isSender;
    }
    return self;
}


@end
