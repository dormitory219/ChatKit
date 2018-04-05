//
//  NSDate+Addition.m
//  KeyBoardView
//
//  Created by joy_yu on 16/3/29.

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
