//
//  DownloadFileHelper.h
//  KeyBoardView
//
//  Created by 余强 on 16/3/27.
//  Copyright © 2016年 你好，我是余强，一位来自上海的ios开发者，现就职于bdcluster(上海大数聚科技有限公司)。这个工程致力于完成一个优雅的IM实现方案. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>
#import "ChatHelp.h"

@interface DownloadFileHelper : NSObject

+ (instancetype)helper;

- (void)downloadRequest:(NSString *)url
        destinationPath:(NSString *)destinationPath
               progress:(progressBlock)progressHandler
               complete:(void(^)(NSURL *url,NSError *error))completionHandler;

@end
