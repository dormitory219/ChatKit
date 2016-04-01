//
//  MyAnnoation.h
//  Map
//
//  Created by 余强 on 15/8/28.
//  Copyright (c) 2015年 你好，我是余强，一位来自上海的ios开发者，现就职于bdcluster(上海大数聚科技有限公司)。这个工程致力于完成一个优雅的IM实现方案. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

//遵守协议
@interface MyAnnoation : NSObject <MKAnnotation>
/**
 *  大头针的位置
 */
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;



@end
