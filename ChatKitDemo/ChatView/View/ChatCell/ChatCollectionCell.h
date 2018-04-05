//
//  ChatCollectionCell.h
//  KeyBoardView
//
//  Created by joy_yu on 16/3/25.

//

#import <UIKit/UIKit.h>
#import "MessageModel.h"
#import "MLEmojiLabel.h"


@protocol chatCellClickDelegate <NSObject>


//bubble点击

/**
 *  @brief 点击音频bubble
 *
 *  @param message   <#message description#>
 */
- (void)audioRecoderBubbleDidSelectedOnMessage:(MessageModel *)message;

/**
 *  @brief 点击视频bubble
 *
 *  @param message   <#message description#>
 */
- (void)videoBubbleDidSelectedOnMessage:(MessageModel *)message;

/**
 *  @brief 双击纯文本Bubble
 *
 *  @param message   <#message description#>
 */
- (void)textBubbleDidSelectedOnMessage:(MessageModel *)message;


/**
 *  @brief 点击位置bubble
 *
 *  @param message   <#message description#>
 */
- (void)locationBubbleDidSelectedOnMessage:(MessageModel *)message;

/**
 *  @brief 点击图片bubble
 *
 *  @param message   <#message description#>
 */
- (void)photoBubbleDidSelectedOnMessage:(MessageModel *)message photo:(UIImageView *)photo;




//other点击

/**
 *  @brief 头像点击
 *
 *  @param message   <#message description#>
 */
- (void)avaterDidSelectedOnMessage:(MessageModel *)message;


/**
 *  @brief 消息发送失败后重新发送消息
 *
 *  @param message   <#message description#>
 */
- (void)resendMessage:(MessageModel *)message;



/**
 *  @brief 富文本消息，点击链接
 *
 *  @param link <#link description#>
 *  @param type 连接类型
 */
- (void)didSelectLink:(NSString*)link withType:(MLEmojiLabelLinkType)type;



@end

@interface ChatCollectionCell : UICollectionViewCell
@property(nonatomic,strong) MessageModel *message;


@property(nonatomic,weak) id <chatCellClickDelegate> delegate;

+ (CGFloat)CellHeight:(MessageModel *)message;
@end
