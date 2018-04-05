//
//  VideoMessageModel.h
//  KeyBoardView
//
//  Created by joy_yu on 16/3/22.

//

#import <Foundation/Foundation.h>
#import "MessageModel.h"

@interface VideoMessageModel : MessageModel


+ (instancetype)VideoThumbPhoto:(NSString *)videoThumbPhoto
                  videoThumbUrl:(NSString *)videoThumbUrl
                       videoUrl:(NSString *)videoUrl
                       username:(NSString *)username
                      timeStamp:(NSString *)timeStamp
                       isSender:(BOOL)isSender;

@end
