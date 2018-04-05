//
//  ChatCollectionViewController+Helper.m
//  KeyBoardView
//
//  Created by joy_yu on 16/3/27.

//

#import "ChatCollectionViewController+Helper.h"
#import "MapLocationController.h"
#import <NSData+ImageContentType.h>

@implementation ChatCollectionViewController (Helper)

- (void)pickerPhotoComplection:(DidFinishTakeMediaCompletionBlock)completion
{
    [[CameraHelper helper]showPickerViewControllerSourceType:UIImagePickerControllerSourceTypeSavedPhotosAlbum onViewController:self completion:^(MediaType mediaType, NSData *data) {
        completion ? completion(mediaType,data) : nil;
    }];
}

- (void)takePhotoOrVideoComplection:(DidFinishTakeMediaCompletionBlock)completion
{
    [[CameraHelper helper]showPickerViewControllerSourceType:UIImagePickerControllerSourceTypeCamera onViewController:self completion:^(MediaType mediaType, NSData *data) {
        completion ? completion(mediaType,data) : nil;
    }];
}

- (void)locationMapComplection:(void(^)(NSString *address,CLLocation *location,UIImage *locationPhoto, NSError *error))completion
{
    __weak typeof(self) weakSelf = self;
    MapLocationController *mapLocation = [[MapLocationController alloc]init];
    [mapLocation setCompletion:^(NSString *address,CLLocation *location,UIImage *locationPhoto,NSError *error) {
        [weakSelf.navigationController popViewControllerAnimated:YES];
        completion ? completion(address,location,locationPhoto,error): nil;
    }];
    [self.navigationController pushViewController:mapLocation animated:YES];
}


@end
