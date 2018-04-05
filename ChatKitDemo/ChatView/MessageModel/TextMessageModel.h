//
//  TextMessageModel.h
//  KeyBoardView
//
//  Created by joy_yu on 16/3/22.

//

#import <Foundation/Foundation.h>
#import "MessageModel.h"

@interface TextMessageModel : MessageModel

+ (instancetype)text:(NSString *)text
            username:(NSString *)username
           timeStamp:(NSString *)timeStamp
            isSender:(BOOL)isSender;



@end
