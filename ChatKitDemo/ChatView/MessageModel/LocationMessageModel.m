//
//  LocationMessageModel.m
//  KeyBoardView
//
//  Created by joy_yu on 16/3/22.

//


#import "LocationMessageModel.h"

@implementation LocationMessageModel

+ (instancetype)LocalPositionPhoto:(NSString *)localPositionPhotoPath
                           address:(NSString *)address
                          location:(CLLocation *)location
                          username:(NSString *)username
                         timeStamp:(NSString *)timeStamp
                          isSender:(BOOL)isSender

{
    return [[self alloc]initWithLocalPositionPhoto:localPositionPhotoPath address:address location:location username:username timeStamp:timeStamp isSender:isSender];
}

- (instancetype)initWithLocalPositionPhoto:(NSString *)localPositionPhotoPath
                                   address:(NSString *)address
                                  location:(CLLocation *)location
                                  username:(NSString *)username
                                 timeStamp:(NSString *)timeStamp
                                  isSender:(BOOL)isSender
{
    self = [super init];
    if (self)
    {
        self.localPositionPhotoPath = localPositionPhotoPath;
        self.address = address;
        self.location = location;
        self.username = username;
        self.timeStamp = timeStamp;
        self.bubbleMessageBodyType = MessageBodyTypeLocation;
        self.isSender = isSender;
    }
    return self;
}

@end
