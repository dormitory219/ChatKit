//
//  PhotoMessageModel.m
//  KeyBoardView
//
//  Created by joy_yu on 16/3/22.

//

#import "PhotoMessageModel.h"

@implementation PhotoMessageModel

+ (instancetype)Photo:(NSString *)localPhotoPath
         thumbnailUrl:(NSString *)thumbnailUrl
       originPhotoUrl:(NSString *)originPhotoUrl
             username:(NSString *)username
            timeStamp:(NSString *)timeStamp
             isSender:(BOOL)isSender

{
    return [[self alloc]initWithPhoto:localPhotoPath thumbnailUrl:thumbnailUrl originPhotoUrl:originPhotoUrl username:username timeStamp:timeStamp isSender:isSender];
}

- (instancetype)initWithPhoto:(NSString *)localPhotoPath
                 thumbnailUrl:(NSString *)thumbnailUrl
               originPhotoUrl:(NSString *)originPhotoUrl
                     username:(NSString *)username
                    timeStamp:(NSString *)timeStamp
                     isSender:(BOOL)isSender
{
    self = [super init];
    if (self) {
        self.localPhotoPath = localPhotoPath;
        self.thumbnailUrl = thumbnailUrl;
        self.originPhotoUrl = originPhotoUrl;
        self.username = username;
        self.timeStamp = timeStamp;
        self.bubbleMessageBodyType = MessageBodyTypePhoto;
        self.isSender = isSender;
    }
    return self;
}

@end
