
//
//  TextMessageModel.m
//  KeyBoardView
//
//  Created by joy_yu on 16/3/22.

//

#import "TextMessageModel.h"

@implementation TextMessageModel

+ (instancetype)text:(NSString *)text
            username:(NSString *)username
           timeStamp:(NSString *)timeStamp
            isSender:(BOOL)isSender

{
    return [[self alloc]initWithText:text username:username timeStamp:timeStamp isSender:isSender];
}

- (instancetype)initWithText:(NSString *)text
                      username:(NSString *)username
                   timeStamp:(NSString *)timeStamp
                    isSender:(BOOL)isSender

{
    self = [super init];
    if (self)
    {
        self.text = text;
        self.username = username;
        self.timeStamp = timeStamp;
        self.bubbleMessageBodyType = MessageBodyTypeText;
        self.isSender = isSender;
    }
    return self;
}

@end
