//
//  EmotionBoardView.h
//  KeyBoardView
//
//  Created by 余强 on 16/3/25.

//

#import <UIKit/UIKit.h>

#import "KeyBoardHeader.h"
#import "FLAnimatedImageView.h"
#import "FLAnimatedImage.h"
#import "Emoji.h"
#import "EmotionViewDelegate.h"


@interface EmotionBoardView : UIView

+ (instancetype)faceBoardView:(NSInteger)type scrollView:(UIScrollView *)scrollView frame:(CGRect)frame;


/**
 *  @brief 第一页为emoij，其他页为gif
 */
@property(nonatomic,assign) NSInteger faceType;

//该表情面板有多少页
@property(nonatomic,assign) NSInteger page;

//@property(nonatomic,assign) BOOL isEmoij;
@property(nonatomic,assign) EmotionType emotionType;

@property(nonatomic,weak) id<EmotionViewDelegate> emotionViewDelegate;
@end
