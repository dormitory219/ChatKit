//
//  AudioPlayHelper.m
//  KeyBoardView
//
//  Created by 余强 on 16/3/28.
//  Copyright © 2016年 你好，我是余强，一位来自上海的ios开发者，现就职于bdcluster(上海大数聚科技有限公司)。这个工程致力于完成一个优雅的IM实现方案，如果您有兴趣，请来到项目交流群：533793277. All rights reserved.
//

#import "AudioPlayHelper.h"
#import <AVFoundation/AVFoundation.h>


@interface AudioPlayHelper ()<AVAudioPlayerDelegate>

@property(nonatomic,strong) AVAudioPlayer *player;

//@property(nonatomic,strong) NSURL *lastUrl;

@end
@implementation AudioPlayHelper

+ (instancetype)helper
{
    static dispatch_once_t onceToken;
    static AudioPlayHelper * helper = nil;
    dispatch_once(&onceToken, ^{
        helper = [[self alloc]init];
        
    });
    return helper;
}


- (void)playAudioWithFileUrl:(NSURL *)url finishPlay:(void(^)(NSString *))didFinishPlaying
{
    
    self.audioPlayerDidFinishPlaying = didFinishPlaying;
  
    self.player = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:nil];
    self.player.delegate = self;
    
    [self.player prepareToPlay];
    
    
    [self.player play];
    
}

- (void)pauseAudioWithFileUrl:(NSURL *)url
{
    [self.player stop];
}


- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    self.audioPlayerDidFinishPlaying ? self.audioPlayerDidFinishPlaying(self.player.url.path) : nil;
}







@end
