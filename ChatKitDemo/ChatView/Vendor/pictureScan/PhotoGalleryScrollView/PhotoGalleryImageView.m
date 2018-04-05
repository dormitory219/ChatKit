//
//  PhotoGalleryImageView.m
//  ScanPictureDemo
//
//  Created by joy_yu on 16/3/9.
//  Copyright © 2016年 bdcluster(上海大数聚科技有限公司). All rights reserved.
//

#import "PhotoGalleryImageView.h"

@interface PhotoGalleryImageView()

- (void)handleSingleTap:(UITouch *)touch;
- (void)handleDoubleTap:(UITouch *)touch;

@end

@implementation PhotoGalleryImageView

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        self.userInteractionEnabled = YES;
        
        [self addGesture];
    }
    return self;
}

- (id)initWithImage:(UIImage *)image {
    if ((self = [super initWithImage:image])) {
        self.userInteractionEnabled = YES;
         [self addGesture];
    }
    return self;
}

- (id)initWithImage:(UIImage *)image highlightedImage:(UIImage *)highlightedImage {
    if ((self = [super initWithImage:image highlightedImage:highlightedImage])) {
        self.userInteractionEnabled = YES;
         [self addGesture];
        
        
    }
    return self;
}

- (void)addGesture
{
    UITapGestureRecognizer *singleTap   = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(singleTapAction:)];
    singleTap.numberOfTapsRequired = 1;
    
    [self addGestureRecognizer:singleTap];
    
    
    UITapGestureRecognizer *doubleTap   = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(doubleTapAction:)];
    doubleTap.numberOfTapsRequired = 2;
    
    [self addGestureRecognizer:doubleTap];
    
    [singleTap requireGestureRecognizerToFail:doubleTap];
    

}


- (void)singleTapAction:(UITapGestureRecognizer *)touch
{
    
    if ([self.tapDelegate respondsToSelector:@selector(imageView:singleTapDetected:)])
        [self.tapDelegate imageView:self singleTapDetected:touch];
}

- (void)doubleTapAction:(UITapGestureRecognizer *)touch
{
    if ([self.tapDelegate respondsToSelector:@selector(imageView:doubleTapDetected:)])
        [self.tapDelegate imageView:self doubleTapDetected:touch];
    
}




#pragma mark -- Private method
- (void)handleSingleTap:(UITouch *)touch {
    if ([self.tapDelegate respondsToSelector:@selector(imageView:singleTapDetected:)])
        [self.tapDelegate imageView:self singleTapDetected:touch];
    
}

- (void)handleDoubleTap:(UITouch *)touch {
    if ([self.tapDelegate respondsToSelector:@selector(imageView:doubleTapDetected:)])
        [self.tapDelegate imageView:self doubleTapDetected:touch];
    
}




@end
