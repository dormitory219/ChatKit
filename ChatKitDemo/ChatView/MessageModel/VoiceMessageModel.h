//
//  VoiceMessageModel.h
//  KeyBoardView
//
//  Created by 余强 on 16/3/22.

//


#import <Foundation/Foundation.h>
#import "MessageModel.h"
@interface VoiceMessageModel : MessageModel

+ (instancetype)VoicePath:(NSString *)voicePath
                 voiceUrl:(NSString *)voiceUrl
            voiceDuration:(NSString *)voiceDuration
                 username:(NSString *)username
                timeStamp:(NSString *)timeStamp
                 isSender:(BOOL)isSender;



+ (instancetype)VoicePath:(NSString *)voicePath
                 voiceUrl:(NSString *)voiceUrl
            voiceDuration:(NSString *)voiceDuration
                 username:(NSString *)username
                timeStamp:(NSString *)timeStamp
                   isRead:(BOOL)isRead
                 isSender:(BOOL)isSender;



@end
