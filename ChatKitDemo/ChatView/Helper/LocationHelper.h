//
//  LocationHelper.h
//  KeyBoardView
//
//  Created by 余强 on 16/3/27.

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





