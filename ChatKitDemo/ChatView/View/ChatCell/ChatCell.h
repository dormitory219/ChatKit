//
//  ChatLeftCell.h
//  KeyBoardView
//
//  Created by 余强 on 16/3/21.

//

#import <UIKit/UIKit.h>
#import "MessageModel.h"

@interface ChatCell : UITableViewCell
@property(nonatomic,strong) MessageModel *message;


@property(nonatomic,strong)  UIImageView *avateImageV;
@property(nonatomic,strong)  UILabel *nameLabel;

@property(nonatomic,strong)  UIImageView *bubbleImageV;


+ (CGFloat)CellHeight:(MessageModel *)message;


@end
