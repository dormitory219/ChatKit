//
//  EmoijFaceToolBar.h
//  KeyBoardView
//
//  Created by joy_yu on 16/3/24.

//

#import <UIKit/UIKit.h>
#import "KeyBoardHeader.h"

@interface EmotionFaceToolBar : UIView

/**
 *  @brief 表情中可能不是emoij，也可能是其他图片，就另外处理了
 */
@property(nonatomic,assign) BOOL isEmoij;
@property(nonatomic,copy) void(^switchEmoijBlock)(NSInteger);
@property(nonatomic,copy) void(^sendEmoijBlock)();

- (void)setBtnIndexSelect:(NSInteger)index;

@end
