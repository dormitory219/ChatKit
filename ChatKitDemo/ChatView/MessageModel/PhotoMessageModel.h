//
//  PhotoMessageModel.h
//  KeyBoardView
//
//  Created by joy_yu on 16/3/22.

//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MessageModel.h"

@interface PhotoMessageModel : MessageModel


+ (instancetype)Photo:(NSString *)localPhotoPath
         thumbnailUrl:(NSString *)thumbnailUrl
       originPhotoUrl:(NSString *)originPhotoUrl
             username:(NSString *)username
            timeStamp:(NSString *)timeStamp
             isSender:(BOOL)isSender;


@end
