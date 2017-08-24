//
//  SubView.m
//  121212121
//
//  Created by 余强 on 16/3/30.

//

#import "BubbleView.h"
#import "UIImage+Addition.h"


@implementation BubbleView


- (void)setBubbleImage:(UIImage *)bubbleImage isSender:(BOOL)isSender
{
    _bubbleImage = bubbleImage;
    _isSender = isSender;
    [self setNeedsDisplay];
}


- (void)drawRect:(CGRect)rect
{
    [UIImage drawImage:_bubbleImage atFrame:rect isSender:_isSender];
}

@end
