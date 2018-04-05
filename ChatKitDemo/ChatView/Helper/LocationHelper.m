//
//  LocationHelper.m
//  KeyBoardView
//
//  Created by joy_yu on 16/3/27.

//

#import "LocationHelper.h"
#import <UIKit/UIKit.h>

@interface LocationHelper ()<CLLocationManagerDelegate>

@property (nonatomic, readwrite, strong) CLLocationManager *locationManager;
@property (nonatomic, readwrite, strong) CLGeocoder *gcodeer;

@property (nonatomic, readwrite, copy) SystemLocationBlock systemLocationBlock;

@end



@implementation LocationHelper

+ (instancetype)helper
{
    static dispatch_once_t onceToken;
    static LocationHelper * helper = nil;
    dispatch_once(&onceToken, ^{
        helper = [[self alloc]init];
    });
    return helper;
}

//ios8使用地图定位功能，要弹出授权框用户选择授权后定位方法才会调用。弹出授权框在plist文件设置：NSLocationAlwaysUsageDescription

//授权状态监听
- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    if (status == kCLAuthorizationStatusNotDetermined)
    {
        NSLog(@"等待用户授权");
    }
    else if(status == kCLAuthorizationStatusAuthorizedAlways || status == kCLAuthorizationStatusAuthorizedWhenInUse)
    {
        NSLog(@"授权成功");
    }
}

#pragma mark - 高德地图

- (void)startSystemLocationWithRes:(SystemLocationBlock)systemLocationBlock
{
    self.systemLocationBlock = systemLocationBlock;
    self.locationManager =[[CLLocationManager alloc] init];
    self.locationManager.desiredAccuracy=kCLLocationAccuracyBest;
    if ([UIDevice currentDevice].systemVersion.integerValue >=8)
    {
        [self.locationManager requestAlwaysAuthorization];//使用程序其间允许访问位置数据（iOS8定位需要）
    }
    self.locationManager.delegate=self;
    [self.locationManager startUpdatingLocation];//开启定位
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *currLocation=[locations lastObject];
    self.locationManager.delegate = nil;
    [self.locationManager stopUpdatingLocation];
    self.systemLocationBlock(currLocation, nil);
}

- (void)address:(CLLocation *)location completion:(void(^)(NSString *,CLLocation *, NSError *))completion
{
    //地理反向编码
    [self.gcodeer reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error) {
        CLPlacemark *placeMark = [placemarks firstObject];
        NSString *name = placeMark.name;
        if (error)
        {
            completion ? completion(nil,nil,error) : nil;
        }
        else
        {
            completion ? completion(name,location,nil) : nil;
        }
    }];
}

/**
 *定位失败，回调此方法
 */
-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    if ([error code]==kCLErrorDenied)
    {
        NSLog(@"访问被拒绝");
    }
    if ([error code]==kCLErrorLocationUnknown)
    {
        NSLog(@"无法获取位置信息");
    }
    self.locationManager.delegate = nil;
    [self.locationManager stopUpdatingLocation];
    self.systemLocationBlock(nil, error);
}

- (CLGeocoder *)gcodeer
{
    if (_gcodeer == nil)
    {
        _gcodeer = [[CLGeocoder alloc]init];
    }
    return _gcodeer;
}

@end
