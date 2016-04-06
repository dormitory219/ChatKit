//
//  CacheHelper.m
//  KeyBoardView
//
//  Created by 余强 on 16/3/27.
//  Copyright © 2016年 你好，我是余强，一位来自上海的ios开发者，现就职于bdcluster(上海大数聚科技有限公司)。这个工程致力于完成一个优雅的IM实现方案，如果您有兴趣，请来到项目交流群：533793277. All rights reserved.
//

#import "CacheHelper.h"

@implementation CacheHelper


+ (instancetype)helper
{
    static dispatch_once_t onceToken;
    static CacheHelper * helper = nil;
    dispatch_once(&onceToken, ^{
        helper = [[self alloc]init];
    });
    return helper;
}



- (void)saveMediaTypeWithMediaType:(MessageBodyType)meidaType FileData:(NSData *)fileData completion:(void (^)(NSString *mediaPath))completion
{
    
    NSString *mediaPath = nil;
    switch (meidaType) {
            

        case MessageBodyTypePhoto: {
            
            mediaPath = [self savePathFormediaType:MessageBodyTypePhoto];
          
            break;
        }
        case MessageBodyTypeVideo: {
             mediaPath = [self savePathFormediaType:MessageBodyTypeVideo];
            break;
        }
        case MessageBodyTypeVoice: {
             mediaPath = [self savePathFormediaType:MessageBodyTypeVoice];
            break;
        }

    }
    
     [fileData writeToFile:mediaPath atomically:YES];
     completion ? completion(mediaPath) : nil;
}


- (NSString *)savePathFormediaType:(MessageBodyType)mediaType
{
    
    NSDate *date = [[NSDate alloc]init];
    
    NSDateFormatter *dateFormate = [[NSDateFormatter alloc]init];
    dateFormate.dateFormat = @"YYYY-MM-dd hh-mm-ss";
    NSString *dateStr = [dateFormate stringFromDate:date];
    
    
    NSString *rootPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    
    NSString *meidaPath = nil;
    switch (mediaType) {
            
        case MessageBodyTypeText:
            break;
        case MessageBodyTypeLocation:
            break;
        case MessageBodyTypePhoto: {
            
            //数据格式待定：jpg/gif/tiff
            meidaPath = [[rootPath stringByAppendingPathComponent:dateStr]stringByAppendingString:@"picture"];
            break;
        }
        case MessageBodyTypeVideo: {
            meidaPath = [[rootPath stringByAppendingPathComponent:dateStr]stringByAppendingString:@"video.mov"];
            break;
        }
        case MessageBodyTypeVoice: {
            meidaPath = [[rootPath stringByAppendingPathComponent:dateStr]stringByAppendingString:@"voice.m4a"];
            break;
        }
            
    }
    
    return meidaPath;
}






@end
