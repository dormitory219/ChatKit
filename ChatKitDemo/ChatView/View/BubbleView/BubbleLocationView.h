//
//  BubbleLocationView.h
//  KeyBoardView
//
//  Created by 余强 on 16/3/23.

//

#import <UIKit/UIKit.h>
#import "MessageModel.h"


@interface BubbleLocationView : UIView

@property(nonatomic,strong) MessageModel *message;



+ (instancetype)BubbleLocationView;

+ (CGSize)BubbleLocationWithMessage:(MessageModel *)model;


@end
