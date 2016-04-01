//
//  PhotoZoomScrollView.m
//  KYElegantPhotoGallery-Demo
//
//  Created by Kitten Yang on 6/5/15.
//  Copyright (c) 2015 Kitten Yang. All rights reserved.
//

#import "PhotoZoomScrollView.h"



@interface PhotoZoomScrollView() <DetectingImageViewDelegate,UIScrollViewDelegate>

@property (nonatomic,strong)KYPhotoGallery *photoGallery;
@property (nonatomic,strong)UIActivityIndicatorView *indicatorView;

#pragma mark -- Private method
- (CGRect)zoomRectForScale:(float)scale withCenter:(CGPoint)center;

@end

@implementation PhotoZoomScrollView

-(id)initWithPhotoGallery:(KYPhotoGallery *)photoGallery{
    self = [super init];
    if (self) {
        _photoGallery = photoGallery;
        self.delegate = self;
        self.maximumZoomScale = 4.0f;
    
        
        
        
        UILongPressGestureRecognizer *longGesture = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPressAction:)];
        
        [self addGestureRecognizer:longGesture];
        
        
    }
    
    return self;
}




- (void)longPressAction:(UILongPressGestureRecognizer *)gesture
{
    if (gesture.state == UIGestureRecognizerStateEnded) {
        
        [self saveImage];
    }
}


- (void)saveImage
{
    
    
    UIImageView *currentImageView = nil;
    for (UIView *subView in self.subviews) {
        if ([subView isKindOfClass:[PhotoGalleryImageView class]]) {
            
            currentImageView = (UIImageView *)subView;
        }
    }
    
    
    UIImageWriteToSavedPhotosAlbum(currentImageView.image, self, @selector(image:didFinishSavingWithError:contextInfo:), NULL);
    
    
    _indicatorView = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 120, 120)];
    _indicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
    _indicatorView.center =  CGPointMake([UIScreen mainScreen].bounds.size.width/2, [UIScreen mainScreen].bounds.size.height/2);
    
    [self addSubview:_indicatorView];
    [_indicatorView startAnimating];
    
 
}



- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo;
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.6 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [_indicatorView stopAnimating];
        [_indicatorView removeFromSuperview];
        
        UILabel *label = [[UILabel alloc] init];
        label.textColor = [UIColor whiteColor];
        label.backgroundColor = [UIColor colorWithRed:0.1f green:0.1f blue:0.1f alpha:0.90f];
        label.layer.cornerRadius = 5;
        label.clipsToBounds = YES;
        label.bounds = CGRectMake(0, 0, 150, 30);
        label.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2, [UIScreen mainScreen].bounds.size.height/2);
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont boldSystemFontOfSize:17];
        [[UIApplication sharedApplication].keyWindow addSubview:label];
        [[UIApplication sharedApplication].keyWindow bringSubviewToFront:label];
        if (error) {
            label.text = @"保存失败";
        }   else {
            label.text = @"保存成功";
        }
        [label performSelector:@selector(removeFromSuperview) withObject:nil afterDelay:1.0];
    });



}

#pragma private method
- (CGRect)zoomRectForScale:(float)scale withCenter:(CGPoint)center {
    CGRect zoomRect;
    
    zoomRect.size.height = [self frame].size.height / scale;
    zoomRect.size.width  = [self frame].size.width  / scale;
    zoomRect.origin.x    = center.x - (zoomRect.size.width  / 2.0);
    zoomRect.origin.y    = center.y - (zoomRect.size.height / 2.0);
    
    return zoomRect;
}


#pragma mark -- Public method
- (void)layout {
    
    // Center the image as it becomes smaller than the size of the screen
    CGSize boundsSize = self.bounds.size;
    CGRect frameToCenter = self.currentPhoto.frame;
    
    // Horizontally
    if (frameToCenter.size.width < boundsSize.width) {
        frameToCenter.origin.x = floorf((boundsSize.width - frameToCenter.size.width) / 2.0);
    } else {
        frameToCenter.origin.x = 0;
    }
    
    // Vertically
    if (frameToCenter.size.height < boundsSize.height) {
        frameToCenter.origin.y = floorf((boundsSize.height - frameToCenter.size.height) / 2.0);
    } else {
        frameToCenter.origin.y = 0;
    }
    
    // Center
    if (!CGRectEqualToRect(self.currentPhoto.frame, frameToCenter))
        self.currentPhoto.frame = frameToCenter;
}



#pragma DetectingImageViewDelegate
- (void)imageView:(UIImageView *)imageView singleTapDetected:(UITouch *)touch{
    [self.photoGallery performSelector:@selector(dismissPhotoGalleryAnimated:) withObject:@(YES) afterDelay:0];
  //  NSLog(@"singleTap");
}

- (void)imageView:(UIImageView *)imageView doubleTapDetected:(UITapGestureRecognizer *)touch{
    [NSObject cancelPreviousPerformRequestsWithTarget:self.photoGallery];
    
   // NSLog(@"doubleTap");
    
    // Zoom
    if (self.zoomScale == self.maximumZoomScale) {
        
        // Zoom out
        [self setZoomScale:self.minimumZoomScale animated:YES];
        
    } else {
        CGPoint touchPoint = [touch locationInView:imageView];
        touchPoint = [self convertPoint:touchPoint fromView:imageView];
        
        // Zoom in
        CGRect zoomRect = [self zoomRectForScale:self.maximumZoomScale withCenter:touchPoint];
        [self zoomToRect:zoomRect animated:YES];
    
    }
    
}


#pragma UISrollViewDelegate
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return self.currentPhoto;
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
    [self layout];
}



@end
