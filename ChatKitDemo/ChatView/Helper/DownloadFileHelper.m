//
//  DownloadFileHelper.m
//  KeyBoardView
//
//  Created by 余强 on 16/3/27.
//  Copyright © 2016年 你好，我是余强，一位来自上海的ios开发者，现就职于bdcluster(上海大数聚科技有限公司)。这个工程致力于完成一个优雅的IM实现方案. All rights reserved.
//

#import "DownloadFileHelper.h"
#import "CacheHelper.h"

@implementation DownloadFileHelper
{
    AFURLSessionManager *_manager;
    
}


+ (instancetype)helper
{
    static dispatch_once_t onceToken;
    static DownloadFileHelper * helper = nil;
    dispatch_once(&onceToken, ^{
        helper = [[self alloc]init];
    });
    return helper;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
        
        _manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:sessionConfiguration];
        
    }
    return self;
}

- (void)downloadRequest:(NSString *)url
        destinationPath:(NSString *)destinationPath
               progress:(progressBlock)progressHandler
               complete:(void(^)(NSURL *url,NSError *error))completionHandler

{
    __block  NSURL *fileUrl = nil;
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    NSURLSessionDownloadTask *downloadTask = [_manager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        
        progressHandler(downloadProgress);
       
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        
        return [NSURL fileURLWithPath:destinationPath];
        
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        
        
          completionHandler(filePath,error);
    }];
    
    
    [downloadTask resume];
   
}

@end
