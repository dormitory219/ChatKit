//
//  CacheHelper.m
//  KeyBoardView
//
//  Created by 余强 on 16/3/27.

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
