//
//  VideoMessageModel.m
//  KeyBoardView
//
//  Created by 余强 on 16/3/22.

//


#import "VideoMessageModel.h"

@implementation VideoMessageModel


+ (instancetype)VideoThumbPhoto:(NSString *)videoThumbPhoto
                          videoThumbUrl:(NSString *)videoThumbUrl
                               videoUrl:(NSString *)videoUrl
                               username:(NSString *)username
                              timeStamp:(NSString *)timeStamp
                               isSender:(BOOL)isSender
{
    
    return [[self alloc]initWithVideoThumbPhoto:videoThumbPhoto videoThumbUrl:videoThumbUrl videoUrl:videoUrl username:username timeStamp:timeStamp isSender:isSender];
}


- (instancetype)initWithVideoThumbPhoto:(NSString *)videoThumbPhoto
                          videoThumbUrl:(NSString *)videoThumbUrl
                               videoUrl:(NSString *)videoUrl
                               username:(NSString *)username
                              timeStamp:(NSString *)timeStamp
                               isSender:(BOOL)isSender
{
    self = [super init];
    if (self) {
        self.videoThumbPhoto = videoThumbPhoto;
        self.videoThumbUrl = videoThumbUrl;
        self.videoUrl = videoUrl;
        
        
        self.username = username;
        self.timeStamp = timeStamp;
        
        self.bubbleMessageBodyType = MessageBodyTypeVideo;
        self.isSender = isSender;
    }
    return self;
    
}
@end
