//
//  BubbleTextView.h
//  KeyBoardView
//
//  Created by joy_yu on 16/3/21.

//

#import "MessageModel.h"
#import "MLEmojiLabel.h"


@protocol LabelLinkDelegate <NSObject>

- (void)didSelectLink:(NSString *)link withType:(MLEmojiLabelLinkType)type;

@end

@interface BubbleTextView : UIView

@property(nonatomic,strong) MessageModel *message;
@property(nonatomic,weak) id <LabelLinkDelegate> linkSelectDelegate;

+ (instancetype)BubbleTextView;

+ (CGSize)BubbleTextViewSize:(MessageModel *)message;


@end
