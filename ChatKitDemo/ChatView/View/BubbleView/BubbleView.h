//
//  SubView.h
//  121212121
//
//  Created by joy_yu on 16/3/30.

//

#import <UIKit/UIKit.h>

@interface BubbleView : UIView

@property(nonatomic,strong) UIImage *bubbleImage;
@property(nonatomic,assign) BOOL isSender;


- (void)setBubbleImage:(UIImage *)bubbleImage
              isSender:(BOOL)isSender;
@end
