//
//  CacheHelper.h
//  KeyBoardView
//
//  Created by 余强 on 16/3/27.
//  Copyright © 2016年 你好，我是余强，一位来自上海的ios开发者，现就职于bdcluster(上海大数聚科技有限公司)。这个工程致力于完成一个优雅的IM实现方案，如果您有兴趣，请来到项目交流群：533793277. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ChatHelp.h"

@interface CacheHelper : NSObject


//对媒体类型附件进行硬盘缓存：照片，音频，视频
+ (instancetype)helper;


- (void)saveMediaTypeWithMediaType:(MessageBodyType)meidaType  FileData:(NSData *)fileData completion:(void (^)(NSString *mediaPath))completion;



/**
 *  @brief 媒体文件的存储路径
 *
 *  @param mediaType <#mediaType description#>
 *
 *  @return <#return value description#>
 */
- (NSString *)savePathFormediaType:(MessageBodyType)mediaType;


///**
// *  @brief 图片存储
// *
// *  @param fileData   <#fileData description#>
// *  @param completion <#completion description#>
// */
//- (void)savePhotoMediaTypeWithFile:(NSData *)fileData
//                        completion:(void(^)(NSString *))completion;
//
//
//
///**
// *  @brief 音频存储
// *
// *  @param fileData   <#fileData description#>
// *  @param completion <#completion description#>
// */
//- (void)saveAudioMediaTypeWithFile:(NSData *)fileData
//                        completion:(void(^)(NSString *))completion;
//
//
//
///**
// *  @brief 视频及其缩略图存储
// *
// *  @param videoFileData <#videoFileData description#>
// *  @param thumbFileData <#thumbFileData description#>
// *  @param completion    <#completion description#>
// */
//- (void)saveVideoMediaTypeWithVideoFile:(NSData *)videoFileData
//                        videoThumbPhoto:(NSData *)thumbFileData
//                             completion:(void(^)(NSString *,NSString *))completion;
//



@end
