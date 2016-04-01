//
//  PhotoGalleryImageView.h
//  ScanPictureDemo
//
//  Created by 余强 on 16/3/9.
//  Copyright © 2016年 bdcluster(上海大数聚科技有限公司). All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DetectingImageViewDelegate <NSObject>
@optional
- (void)imageView:(UIImageView *)imageView singleTapDetected:(UITapGestureRecognizer *)touch;
- (void)imageView:(UIImageView *)imageView doubleTapDetected:(UITapGestureRecognizer *)touch;
@end

@interface PhotoGalleryImageView : UIImageView

@property (nonatomic, assign) id <DetectingImageViewDelegate> tapDelegate;

@end
