//
//  MapLocationController.h
//  KeyBoardView
//
//  Created by 余强 on 16/3/28.
//  Copyright © 2016年 你好，我是余强，一位来自上海的ios开发者，现就职于bdcluster(上海大数聚科技有限公司)。这个工程致力于完成一个优雅的IM实现方案，如果您有兴趣，请来到项目交流群：533793277. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>


typedef  NS_ENUM(NSInteger,MapType)
{
    MapTypelocation,   //定位
    MapTypePosition    //查看位置
    
};

@interface MapLocationController : UIViewController


@property(nonatomic,copy) void(^completion)(NSString *address,CLLocation *loction,UIImage *, NSError *error);

@property(nonatomic,assign) MapType mapType;
@property(nonatomic,strong) CLLocation *location;

@end
