//
//  NSDate+Addition.m
//  KeyBoardView
//
//  Created by 余强 on 16/3/29.
//  Copyright © 2016年 你好，我是余强，一位来自上海的ios开发者，现就职于bdcluster(上海大数聚科技有限公司)。这个工程致力于完成一个优雅的IM实现方案. All rights reserved.
//

#import "NSDate+Addition.h"


@implementation NSDate (Addition)


+ (NSDate *)dateString:(NSString *)dateString WithFormate:(NSString *)formate
{
    NSDateFormatter *dataformate= [[NSDateFormatter alloc]init];
    dataformate.dateFormat = formate;
    
    
    return [dataformate dateFromString:dateString];
    
}


+ (NSString *)date:(NSDate *)date WithFormate:(NSString *)formate
{
    NSDateFormatter *dataformate= [[NSDateFormatter alloc]init];
    dataformate.dateFormat = formate;
    
    
    return [dataformate stringFromDate:date];
    
}


+ (CGFloat)timeIntervalWithFormer:(NSDate *)former latter:(NSDate *)latter
{
    
    return [latter timeIntervalSinceDate:former];
}

@end
