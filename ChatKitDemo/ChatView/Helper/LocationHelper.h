//
//  LocationHelper.h
//  KeyBoardView
//
//  Created by 余强 on 16/3/27.
//  Copyright © 2016年 你好，我是余强，一位来自上海的ios开发者，现就职于bdcluster(上海大数聚科技有限公司)。这个工程致力于完成一个优雅的IM实现方案. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
typedef void(^SystemLocationBlock)(CLLocation *loction, NSError *error);

@interface LocationHelper : NSObject

+ (instancetype)helper;


/**
 *  启动系统定位
 *
 *  @param systemLocationBlock 系统定位成功或失败回调成功
 */
- (void)startSystemLocationWithRes:(SystemLocationBlock)systemLocationBlock;


- (void)address:(CLLocation *)location completion:(void(^)(NSString *,CLLocation *, NSError *))completion;

@end





