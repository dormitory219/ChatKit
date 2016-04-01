//
//  BubbleClickHandleHelper.m
//  KeyBoardView
//
//  Created by 余强 on 16/3/27.
//  Copyright © 2016年 你好，我是余强，一位来自上海的ios开发者，现就职于bdcluster(上海大数聚科技有限公司)。这个工程致力于完成一个优雅的IM实现方案. All rights reserved.
//

#import "BubblePressHandleHelper.h"
#import "KYPhotoGallery.h"
#import "VideoPlayController.h"
#import "MapLocationController.h"
#import "WebVController.h"
#import "AudioPlayHelper.h"


@interface BubblePressHandleHelper ()
@property(nonatomic,strong) UIWindow *keyWindow;
@end


@implementation BubblePressHandleHelper

+ (instancetype)helper
{
    static dispatch_once_t onceToken;
    static BubblePressHandleHelper * helper = nil;
    dispatch_once(&onceToken, ^{
        helper = [[self alloc]init];
    });
    return helper;
}






//点击photoBubble,大图浏览图片
- (void)photoBrow:(MessageModel *)message photo:(UIImageView *)photo
{
    KYPhotoGallery *photoVc = [KYPhotoGallery sharedKYPhotoGallery];
    
    //默认浏览当前照片
    NSArray *imageUrlArray = nil;
   
    imageUrlArray =  (message.localPhotoPath?[@[message.localPhotoPath]mutableCopy] :[@[message.thumbnailUrl]mutableCopy]);
    [photoVc tappedImageView:photo andImageUrls:[imageUrlArray mutableCopy] andInitialIndex:1];
    
    photoVc.imageViewArray = [@[photo] mutableCopy];
    
    //异步加载完图片present
    [photoVc finishAsynDownload:^{
        
        
        UIViewController *rootController = [self.keyWindow rootViewController];
        [rootController presentViewController:photoVc animated:NO completion:nil];
        
        
    }];
    
    
}

//点击audioBubble,播放或暂停语音播放
- (void)audioPlayOrStop:(MessageModel *)message finishPlay:(void(^)(NSString *url))finishPlay
{
    NSURL *url = nil;

    //音频不存在网络播放，完全下载成功后再插入消息ui中的
    url = [NSURL fileURLWithPath:message.voicePath];
    
    if (message.isPlaying) {
        [[AudioPlayHelper helper]playAudioWithFileUrl:url finishPlay:^(NSString *url) {
            finishPlay ? finishPlay(url) : nil;
        }];
    }else{
        [[AudioPlayHelper helper]pauseAudioWithFileUrl:url];
    }
    
}




//点击videoBubble,浏览视频
- (void)videoPlay:(MessageModel *)message
{
    UIViewController *rootController = [self.keyWindow rootViewController];
    
    
    VideoPlayController *videoPlayVc = [[VideoPlayController alloc]init];
    
//视频可能没有完全被下载，未下载完前使用网络播放，下载后用本地播放
    
    
    if (!message.isVideoCache) {
        NSLog(@"视频正在下载中，正使用网络播放");
        videoPlayVc.videoURL = [NSURL URLWithString:message.videoUrl];
    }else{
         NSLog(@"视频已下载完，使用本地播放");
        videoPlayVc.videoURL = [NSURL fileURLWithPath:message.locationVideoPath];
    }

    [rootController presentViewController:videoPlayVc animated:NO completion:nil];
    
}


//点击locationBubble,浏览地图
- (void)locationMap:(MessageModel *)message viewController:(UIViewController *)controller
{
    MapLocationController *mapVc = [[MapLocationController alloc]init];
    mapVc.mapType = MapTypePosition;
    mapVc.location = message.location;
    
    controller.navigationController ? [controller.navigationController pushViewController:mapVc animated:YES] : nil;
    
}

//双击纯文本,浏览
- (void)viewTextContent:(MessageModel *)message
{
    
}


//点击locationBubble,浏览地图
- (void)linkHandle:(NSString *)link type:(MLEmojiLabelLinkType)type
{
    switch (type) {
        case MLEmojiLabelLinkTypeURL: {
            NSLog(@"点击了网址");
            //AlertShow(@"点击了网址");
             WebVController*webVc = [[WebVController alloc]init];
            
            UINavigationController *rootController = [self.keyWindow rootViewController];
            webVc.url = link;
            [rootController pushViewController:webVc animated:YES];
            
            break;
        }
        case MLEmojiLabelLinkTypeEmail: {
            NSLog(@"点击了邮箱");
            AlertShow(@"点击的可能是个邮箱");
            break;
        }
        case MLEmojiLabelLinkTypePhoneNumber: {
            NSLog(@"点击了电话");
            AlertShow(@"点击了电话");
            break;
        }
        case MLEmojiLabelLinkTypeAt: {
            NSLog(@"点击了@");
            break;
        }
        case MLEmojiLabelLinkTypePoundSign: {
            //NSLog(@"点击了网址");
            break;
        }
    }
}




//lazy
- (UIWindow *)keyWindow
{
    if(_keyWindow == nil)
    {
        _keyWindow = [[UIApplication sharedApplication] keyWindow];
    }
    
    return _keyWindow;
}


@end
