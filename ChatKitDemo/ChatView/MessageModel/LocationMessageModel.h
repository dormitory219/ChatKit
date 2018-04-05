//
//  LocationMessageModel.h
//  KeyBoardView
//
//  Created by joy_yu on 16/3/22.

//


#import <Foundation/Foundation.h>
#import "MessageModel.h"
@interface LocationMessageModel : MessageModel


+ (instancetype)LocalPositionPhoto:(NSString *)localPositionPhotoPath
                           address:(NSString *)address
                          location:(CLLocation *)location
                          username:(NSString *)username
                         timeStamp:(NSString *)timeStamp
                          isSender:(BOOL)isSender;



@end
