//
//  MessageInputView.h
//  KeyBoardView
//
//  Created by 余强 on 16/3/20.

//

#import <UIKit/UIKit.h>

@protocol TextInputDelegate <NSObject>

@required

/**
 *  发送消息
 */
- (void)sendTextMessage:(NSString *)text;


@end

@interface MessageInputView : UITextView


@property(nonatomic,weak) id<TextInputDelegate> textInputDelegate;



@property(nonatomic,strong)NSString * placeholder;

@property(nonatomic,strong)UIColor * placeholderTextColor;


@end
