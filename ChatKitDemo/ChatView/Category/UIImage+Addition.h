//
//  UIImage+Addition.h
//  KeyBoardView
//
//  Created by 余强 on 16/3/28.
//  Copyright © 2016年 你好，我是余强，一位来自上海的ios开发者，现就职于bdcluster(上海大数聚科技有限公司)。这个工程致力于完成一个优雅的IM实现方案. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Addition)


/**
 *  @brief 取路径下的视频一帧做缩略图
 *
 *  @param videoURL <#videoURL description#>
 *
 *  @return <#return value description#>
 */
+(UIImage *)VideoThumbImage:(NSURL *)videoURL;



/**
 *  @brief 图片原比例缩放处理
 *
 *  @param image <#image description#>
 *  @param scale <#scale description#>
 *
 *  @return <#return value description#>
 */
+ (UIImage *)ThumbnailWithImage:(UIImage *)image
                          scale:(CGFloat)scale;


/**
 *  @brief  截图指定view成图片
 *
 *  @param view 一个view
 *
 *  @return 图片
 */
+ (UIImage *)captureWithView:(UIView *)view;



//可定制截图区域
+ (UIImage *)getImageWithSize:(CGRect)myImageRect FromImage:(UIImage *)bigImage;


/**
 *  @brief 添加水印
 *
 *  @param image     <#image description#>
 *  @param maskImage <#maskImage description#>
 *  @param rect      <#rect description#>
 *
 *  @return <#return value description#>
 */
+ (UIImage *)addImage:(UIImage *)image
         addMsakImage:(UIImage *)maskImage
             maskRect:(CGRect)rect;





/**
 *  @brief KMargin参数很重要，不能乱调
 *
 *  @param void <#void description#>
 *
 *  @return <#return value description#>
 */
#define KMargin 5
#define KCornRadius 7
#define KTriangleWidth 10
#define KTriangleSpace 15
/**
 *  @brief 绘制聊天气泡：可绘制图片
 *
 *  @param image    <#image description#>
 *  @param rect     <#rect description#>
 *  @param isSender <#isSender description#>
 */
+ (void)drawImage:(UIImage *)image atFrame:(CGRect)rect isSender:(BOOL)isSender;




+ (UIImage *)imageWithColor:(UIColor *)color;


@end
