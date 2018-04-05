//
//  MediaAttachmentHelper.h
//  KeyBoardView
//
//  Created by joy_yu on 16/3/28.

//

#import <Foundation/Foundation.h>


@interface MediaAttachmentHelper : NSObject

+ (instancetype)helper;

/**
 *  @brief 图片处理：裁剪，压缩
 *
 *  @param data            <#data description#>
 *  @param completionCache <#completionCache description#>
 */
- (void)imageHandle:(NSData *)data
    completionCache:(void(^)(NSString *))completionCache;


/**
 *  @brief 音频处理
 *
 *  @param data            <#data description#>
 *  @param completionCache <#completionCache description#>
 */
- (void)audioHandle:(NSData *)data
    completionCache:(void(^)(NSString *))completionCache;


/**
 *  @brief 视频处理：转码，压缩
 *
 *  @param data            <#data description#>
 *  @param completionCache <#completionCache description#>
 */
- (void)videoHandle:(NSData *)data
    completionCache:(void(^)(NSString *videoPath,NSString *videoThumbPath))completionCache;
@end
