//
//  AudioPlayHelper.h
//  KeyBoardView
//
//  Created by 余强 on 16/3/28.
//  Copyright © 2016年 你好，我是余强，一位来自上海的ios开发者，现就职于bdcluster(上海大数聚科技有限公司)。这个工程致力于完成一个优雅的IM实现方案. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AudioPlayHelper : NSObject

@property(nonatomic,copy) void(^audioPlayerDidFinishPlaying)(NSString *);

+ (instancetype)helper;



- (void)playAudioWithFileUrl:(NSURL *)url finishPlay:(void(^)(NSString *url))didFinishPlaying;
- (void)pauseAudioWithFileUrl:(NSURL *)url;

@end
