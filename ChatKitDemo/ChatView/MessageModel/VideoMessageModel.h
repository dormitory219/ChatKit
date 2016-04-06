//
//  VideoMessageModel.h
//  KeyBoardView
//
//  Created by 余强 on 16/3/22.
//  Copyright © 2016年 你好，我是余强，一位来自上海的ios开发者，现就职于bdcluster(上海大数聚科技有限公司)。这个工程致力于完成一个优雅的IM实现方案，如果您有兴趣，请来到项目交流群：533793277. All rights reserved.
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
