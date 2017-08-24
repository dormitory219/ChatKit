//
//  MapLocationController.h
//  KeyBoardView
//
//  Created by 余强 on 16/3/28.

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
