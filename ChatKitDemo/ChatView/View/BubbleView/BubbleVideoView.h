//
//  BubbleVideoView.h
//  KeyBoardView
//
//  Created by joy_yu on 16/3/23.

//

#import <UIKit/UIKit.h>
#import "BubblePhotoView.h"

@interface BubbleVideoView : UIView

@property(nonatomic,strong) MessageModel *message;

+ (instancetype)BubbleVideoView;

+ (CGSize)bubbleVideoWithMessage:(MessageModel *)model;

@end
