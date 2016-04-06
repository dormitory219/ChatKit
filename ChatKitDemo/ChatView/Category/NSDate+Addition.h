//
//  NSDate+Addition.h
//  KeyBoardView
//
//  Created by 余强 on 16/3/29.
//  Copyright © 2016年 你好，我是余强，一位来自上海的ios开发者，现就职于bdcluster(上海大数聚科技有限公司)。这个工程致力于完成一个优雅的IM实现方案，如果您有兴趣，请来到项目交流群：533793277. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSDate (Addition)

+ (NSDate *)dateString:(NSString *)dateString WithFormate:(NSString *)formate;
+ (CGFloat)timeIntervalWithFormer:(NSDate *)former latter:(NSDate *)latter;
+ (NSString *)date:(NSDate *)date WithFormate:(NSString *)formate;

@end
