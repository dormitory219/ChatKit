//
//  DownloadFileHelper.h
//  KeyBoardView
//
//  Created by 余强 on 16/3/27.

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
