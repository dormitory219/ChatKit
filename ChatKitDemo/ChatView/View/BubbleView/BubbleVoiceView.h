//
//  BubbleVoiceView.h
//  KeyBoardView
//
//  Created by 余强 on 16/3/21.

//

#import <UIKit/UIKit.h>
#import "MessageModel.h"
@interface BubbleVoiceView : UIView



@property(nonatomic,strong) MessageModel *message;

+ (instancetype)BubbleVoiceView;

+ (CGSize)bubbleVoiceWithMessage:(MessageModel *)model;


- (void)startPlay;


- (void)stopPlay;


@end
