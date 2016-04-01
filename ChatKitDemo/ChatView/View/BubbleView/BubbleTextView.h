//
//  BubbleTextView.h
//  KeyBoardView
//
//  Created by 余强 on 16/3/21.
//  Copyright © 2016年 你好，我是余强，一位来自上海的ios开发者，现就职于bdcluster(上海大数聚科技有限公司)。这个工程致力于完成一个优雅的IM实现方案. All rights reserved.
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
