//
//  MediaAttachmentHelper.h
//  KeyBoardView
//
//  Created by 余强 on 16/3/28.
//  Copyright © 2016年 你好，我是余强，一位来自上海的ios开发者，现就职于bdcluster(上海大数聚科技有限公司)。这个工程致力于完成一个优雅的IM实现方案，如果您有兴趣，请来到项目交流群：533793277. All rights reserved.
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
