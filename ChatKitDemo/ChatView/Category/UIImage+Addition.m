//
//  UIImage+Addition.m
//  KeyBoardView
//
//  Created by 余强 on 16/3/28.

//

#import "UIImage+Addition.h"
#import <AVFoundation/AVFoundation.h>
#import <MobileCoreServices/MobileCoreServices.h>



@implementation UIImage (Addition)



//得到视频的缩略图
+(UIImage *)VideoThumbImage:(NSURL *)videoURL
{
    AVURLAsset *asset = [[AVURLAsset alloc] initWithURL:videoURL options:nil];
    AVAssetImageGenerator *gen = [[AVAssetImageGenerator alloc] initWithAsset:asset];
    gen.appliesPreferredTrackTransform = YES;
    CMTime time = CMTimeMakeWithSeconds(0.0, 600);
    NSError *error = nil;
    CMTime actualTime;
    CGImageRef image = [gen copyCGImageAtTime:time actualTime:&actualTime error:&error];
    UIImage *thumb = [[UIImage alloc] initWithCGImage:image];
    CGImageRelease(image);
    return thumb;
    
}


//保持原来的长宽比，生成原尺寸比例的缩略图
+ (UIImage *)ThumbnailWithImage:(UIImage *)image scale:(CGFloat)scale;
{
    UIImage *newimage;
    if (nil == image) {
        newimage = nil;
    }
    else{
        
        
        CGSize oldsize = image.size;
        CGSize asize = CGSizeMake(oldsize.width*scale, oldsize.height*scale);
        CGRect rect;
        if (asize.width/asize.height > oldsize.width/oldsize.height) {
            rect.size.width = asize.height*oldsize.width/oldsize.height;
            rect.size.height = asize.height;
            rect.origin.x = (asize.width - rect.size.width)/2;
            rect.origin.y = 0;
        }
        else{
            rect.size.width = asize.width;
            rect.size.height = asize.width*oldsize.height/oldsize.width;
            rect.origin.x = 0;
            rect.origin.y = (asize.height - rect.size.height)/2;
        }
        UIGraphicsBeginImageContext(asize);
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetFillColorWithColor(context, [[UIColor clearColor] CGColor]);
        UIRectFill(CGRectMake(0, 0, asize.width, asize.height));//clear background
        [image drawInRect:rect];
        newimage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    return newimage;
}



//截图
+ (UIImage *)captureWithView:(UIView *)view
{
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.opaque, [UIScreen mainScreen].scale);
    // IOS7及其后续版本
    if ([view respondsToSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)]) {
        [view drawViewHierarchyInRect:view.bounds afterScreenUpdates:NO];
    } else { // IOS7之前的版本
        [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    }
    
    UIImage *screenshot = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return screenshot;
    
}

//可定制截图区域
+ (UIImage *)getImageWithSize:(CGRect)myImageRect FromImage:(UIImage *)bigImage
{
    //大图bigImage
    //定义myImageRect，截图的区域
    CGImageRef imageRef = bigImage.CGImage;
    CGImageRef subImageRef = CGImageCreateWithImageInRect(imageRef, myImageRect);
    CGSize size;
    size.width = CGRectGetWidth(myImageRect);
    size.height = CGRectGetHeight(myImageRect);
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextDrawImage(context, myImageRect, subImageRef);
    UIImage* smallImage = [UIImage imageWithCGImage:subImageRef];
    CGImageRelease(subImageRef);
    UIGraphicsEndImageContext();
    return smallImage;
}



//添加水印
+ (UIImage *)addImage:(UIImage *)image addMsakImage:(UIImage *)maskImage maskRect:(CGRect)rect
{
    UIGraphicsBeginImageContext(image.size);
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    
    [maskImage drawInRect:rect];
    UIImage *resultingImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resultingImage;
}




+ (void)drawImage:(UIImage *)image atFrame:(CGRect)rect isSender:(BOOL)isSender
{
    
    CGFloat width = rect.size.width;
    CGFloat height = rect.size.height;
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    
    
    
    //左上弧度角
    CGPoint leftTopCornerTopPoint  = CGPointMake(KMargin+KCornRadius, KMargin);
    CGPoint leftTopCornerBottomPoint = CGPointMake(KMargin, KMargin+KCornRadius);
    
    
    //右上弧度角
    CGPoint rightTopCornerTopPoint  = CGPointMake(width-KCornRadius-KMargin, leftTopCornerTopPoint.y);
    CGPoint rightTopCornerBottomPoint = CGPointMake(width-KMargin,leftTopCornerBottomPoint.y);
    
    
    
    //左下弧度角
    CGPoint leftBottomCornerTopPoint  = CGPointMake(leftTopCornerBottomPoint.x, height-KMargin-KCornRadius);
    CGPoint leftBottomCornerBottomPoint = CGPointMake(leftTopCornerTopPoint.x, height-KMargin);
    
    
    //右下弧度角
    CGPoint rightBottomCornerTopPoint  = CGPointMake(rightTopCornerBottomPoint.x, leftBottomCornerTopPoint.y);
    CGPoint rightBottomCornerBottomPoint = CGPointMake(rightTopCornerTopPoint.x, leftTopCornerBottomPoint.y);
    
    if (isSender) {
        
        //右上尖嘴符号：三角
        //三角上端点
        CGPoint triangleTopPoint = CGPointMake(rightTopCornerBottomPoint.x, rightTopCornerTopPoint.y+KTriangleSpace);
        CGPoint triangleMiddlePoint = CGPointMake(width, triangleTopPoint.y+KTriangleWidth/2);
        CGPoint trianglBottomPoint = CGPointMake(triangleTopPoint.x, triangleTopPoint.y+KTriangleWidth);
        
        
        //先画左上圆弧
        
        [path moveToPoint:leftTopCornerBottomPoint];
        [path addArcWithCenter:CGPointMake(leftTopCornerTopPoint.x, leftTopCornerBottomPoint.y) radius:KCornRadius startAngle:-M_PI endAngle:-M_PI_2 clockwise:YES];
        
        
        //上边框线
        [path addLineToPoint:rightTopCornerTopPoint];
        
        //右上圆弧
        [path addArcWithCenter:CGPointMake(rightTopCornerTopPoint.x, rightTopCornerBottomPoint.y) radius:KCornRadius startAngle:-M_PI_2 endAngle:0 clockwise:YES];
        
        //气泡尖嘴
        [path addLineToPoint:triangleTopPoint];
        [path addLineToPoint:triangleMiddlePoint];
        [path addLineToPoint:trianglBottomPoint];
        
        
        //右边框线
        [path addLineToPoint:rightBottomCornerTopPoint];
        
        
        //右下圆弧
        [path addArcWithCenter:CGPointMake(rightBottomCornerBottomPoint.x, rightBottomCornerTopPoint.y) radius:KCornRadius startAngle:0 endAngle:M_PI_2 clockwise:YES];
        
        
        //下边框线
        [path addLineToPoint:leftBottomCornerBottomPoint];
        
        
        [path addArcWithCenter:CGPointMake(leftBottomCornerBottomPoint.x, leftBottomCornerTopPoint.y) radius:KCornRadius startAngle:M_PI_2 endAngle:M_PI clockwise:YES];
        
    }
    
    
    
    
    else
    {
        //左上尖嘴符号：三角
        //三角上端点
        CGPoint triangleTopPoint = CGPointMake(leftTopCornerBottomPoint.x, leftTopCornerTopPoint.y+KTriangleSpace);
        CGPoint triangleMiddlePoint = CGPointMake(0, triangleTopPoint.y+KTriangleWidth/2);
        CGPoint trianglBottomPoint = CGPointMake(triangleTopPoint.x, triangleTopPoint.y+KTriangleWidth);
        
        
        //先画左上圆弧
        
        [path moveToPoint:leftTopCornerBottomPoint];
        [path addArcWithCenter:CGPointMake(leftTopCornerTopPoint.x, leftTopCornerBottomPoint.y) radius:KCornRadius startAngle:-M_PI endAngle:-M_PI_2 clockwise:YES];
        
        
        //上边框线
        [path addLineToPoint:rightTopCornerTopPoint];
        
        //右上圆弧
        [path addArcWithCenter:CGPointMake(rightTopCornerTopPoint.x, rightTopCornerBottomPoint.y) radius:KCornRadius startAngle:-M_PI_2 endAngle:0 clockwise:YES];
        
        
        
        //右边框线
        [path addLineToPoint:rightBottomCornerTopPoint];
        
        
        //右下圆弧
        [path addArcWithCenter:CGPointMake(rightBottomCornerBottomPoint.x, rightBottomCornerTopPoint.y) radius:KCornRadius startAngle:0 endAngle:M_PI_2 clockwise:YES];
        
        
        //下边框线
        [path addLineToPoint:leftBottomCornerBottomPoint];
        
        
        [path addArcWithCenter:CGPointMake(leftBottomCornerBottomPoint.x, leftBottomCornerTopPoint.y) radius:KCornRadius startAngle:M_PI_2 endAngle:M_PI clockwise:YES];
        
        
        //气泡尖嘴
        [path addLineToPoint:triangleTopPoint];
        [path addLineToPoint:triangleMiddlePoint];
        [path addLineToPoint:trianglBottomPoint];
        
    }
    
    
    //终于画完了,oh shit
    
    [path addClip];
    
    
    [image drawInRect:rect];
    
}



+ (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}




@end
