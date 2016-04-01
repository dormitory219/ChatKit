//
//  CameraHelper.m
//  KeyBoardView
//
//  Created by 余强 on 16/3/27.
//  Copyright © 2016年 你好，我是余强，一位来自上海的ios开发者，现就职于bdcluster(上海大数聚科技有限公司)。这个工程致力于完成一个优雅的IM实现方案. All rights reserved.
//

#import "CameraHelper.h"
#import <AVFoundation/AVFoundation.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import <NSData+ImageContentType.h>

@interface CameraHelper () <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (nonatomic, copy) DidFinishTakeMediaCompletionBlock didFinishTakeMediaCompletion;
@property(nonatomic,strong) UIImagePickerController *imagePickerController;
@end

@implementation CameraHelper

+ (instancetype)helper
{
    static dispatch_once_t onceToken;
    static CameraHelper * helper = nil;
    dispatch_once(&onceToken, ^{
        helper = [[self alloc]init];
    });
    return helper;
}



- (void)showPickerViewControllerSourceType:(UIImagePickerControllerSourceType)sourceType onViewController:(UIViewController *)viewController completion:(DidFinishTakeMediaCompletionBlock)completion
{
    if (![UIImagePickerController isSourceTypeAvailable:sourceType])
    {
        completion(nil, nil);
        return;
    }
    
    self.didFinishTakeMediaCompletion = completion;
     self.imagePickerController = [[UIImagePickerController alloc] init];
    self.imagePickerController.allowsEditing = NO;
    self.imagePickerController.delegate = self;
    self.imagePickerController.sourceType = sourceType;
    if (sourceType == UIImagePickerControllerSourceTypeCamera)
    {
        self.imagePickerController.mediaTypes =  [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera];
    }
    
    [viewController presentViewController:self.imagePickerController animated:YES completion:NULL];
}

- (void)dismissPickerViewController:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:^{
       
    }];
}



- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
   // NSLog(@"get the media info: %@", info);
    NSString* mediaType = [info objectForKey:UIImagePickerControllerMediaType];
    if ([mediaType isEqualToString:(NSString *)kUTTypeImage])
    {
        
        //获取图片对象
        UIImage* image = [info objectForKey:UIImagePickerControllerOriginalImage];
        NSData *imageData = UIImageJPEGRepresentation(image, 1);
        self.didFinishTakeMediaCompletion ? self.didFinishTakeMediaCompletion(MediaTypePhoto,imageData) : nil;
        
    }
    else if ([mediaType isEqualToString:(NSString *)kUTTypeMovie])
    {
        //获取视频文件的url
        NSURL* mediaURL = [info objectForKey:UIImagePickerControllerMediaURL];
        

        //1.保存视频到相册
        NSData *videoData = [NSData dataWithContentsOfURL:mediaURL];
      self.didFinishTakeMediaCompletion ? self.didFinishTakeMediaCompletion(MediaTypeVideo,videoData) : nil;
        
    }
    
    
    
    
    //退出
    [self dismissPickerViewController:picker];
    
}






- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissPickerViewController:picker];
}





@end
