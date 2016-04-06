//
//  NSBundle+KeyBoardExtension.m
//  KeyBoardView
//
//  Created by 余强 on 16/3/20.
//  Copyright © 2016年 你好，我是余强，一位来自上海的ios开发者，现就职于bdcluster(上海大数聚科技有限公司)。这个工程致力于完成一个优雅的IM实现方案，如果您有兴趣，请来到项目交流群：533793277. All rights reserved.
//

#import "NSBundle+KeyBoardExtension.h"

@implementation NSBundle (KeyBoardExtension)


/**
 *  @brief 取出指定bundle名中的image
 *
 *  @param bundleName <#bundleName description#>
 *  @param imageName  <#imageName description#>
 *
 *  @return <#return value description#>
 */
+ (UIImage *)imageWithBundle:(NSString *)bundleName imageName:(NSString *)imageName
{
    
    NSBundle *bundle = [self bundle:bundleName];
    
    NSString *imagePath =  [bundle pathForResource:imageName ofType:@"png"];
   return  [UIImage imageWithContentsOfFile:imagePath];
    
}

/**
 *  @brief 返回bundle对象
 *
 *  @param bundleName <#bundleName description#>
 *
 *  @return <#return value description#>
 */
+ (NSBundle *)bundle:(NSString *)bundleName
{
    NSString *bundlePath =  [[NSBundle mainBundle]pathForResource:bundleName ofType:@"bundle"];
    return [NSBundle bundleWithPath:bundlePath];
}

@end
