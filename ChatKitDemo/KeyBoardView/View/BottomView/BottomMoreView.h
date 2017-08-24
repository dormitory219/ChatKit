//
//  BottomMoreView.h
//  KeyBoardView
//
//  Created by 余强 on 16/3/20.

//

#import <UIKit/UIKit.h>
#import "KeyBoardHeader.h"


@protocol MoreViewDelegate <NSObject>

- (void)moreViewClick:(MoreViewType)type;

@end

@interface BottomMoreView : UIView


@property(nonatomic,weak) id<MoreViewDelegate>moreViewDelegate;

@end
