//
//  AudioPlayHelper.m
//  KeyBoardView
//
//  Created by joy_yu on 16/3/28.

//

#import "AudioPlayHelper.h"
#import <AVFoundation/AVFoundation.h>

@interface AudioPlayHelper ()<AVAudioPlayerDelegate>

@property(nonatomic,strong) AVAudioPlayer *player;

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
