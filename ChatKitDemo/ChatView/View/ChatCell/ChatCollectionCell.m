//
//  ChatCollectionCell.m
//  KeyBoardView
//
//  Created by joy_yu on 16/3/25.

//

#import "ChatCollectionCell.h"

#import "UIImage+Addition.h"
#import "BubbleTextView.h"
#import "BubblePhotoView.h"
#import "BubbleVoiceView.h"
#import "BubbleLocationView.h"
#import "BubbleVideoView.h"

#import "BubbleView.h"

@interface ChatCollectionCell ()<LabelLinkDelegate>

//头像
@property(nonatomic,strong)  UIImageView *avateImageV;

//昵称
@property(nonatomic,strong)  UILabel *nameLabel;

//聊天气泡：消息内容容器，含文本，音频，视频，图片，位置
@property(nonatomic,strong)  BubbleView *bubbleImageV;


//消息发送状态

@property(nonatomic,strong)  UIView *messageSendStateView;


@end


@implementation ChatCollectionCell

- (void)awakeFromNib {
    // Initialization code
}




- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
         [self setUpUi];
        
    }
    return self;
}



- (void)setMessage:(MessageModel *)message
{
    _message = message;
    [self.avateImageV sd_setImageWithURL:[NSURL URLWithString:_message.avatarUrl] placeholderImage:nil];
    
    
#pragma mark -- change //开始思路是使用固定图片进行拉伸，后期使用自定义绘制
    //头像布局
    //气泡图左右处理不一样
    if (_message.isSender)
    {
        self.avateImageV.frame = CGRectMake(self.width0-45-KLeftMargin, KTopMargin, 45, 45);
        //self.bubbleImageV.image = [[NSBundle imageWithBundle:BundleName imageName:@"weChatBubble_Sending_Solid@2x"]stretchableImageWithLeftCapWidth:5 topCapHeight:35];
       [self.bubbleImageV setBubbleImage:[UIImage imageWithColor:[KRandomColour colorWithAlphaComponent:0.45]] isSender:YES];
        
    }else
    {
        
        self.avateImageV.frame = CGRectMake(KLeftMargin, KTopMargin, 45, 45);
       // self.bubbleImageV.image = [[NSBundle imageWithBundle:BundleName imageName:@"weChatBubble_Receiving_Solid@2x"]stretchableImageWithLeftCapWidth:35 topCapHeight:35];
        [self.bubbleImageV setBubbleImage:[UIImage imageWithColor:[KRandomColour colorWithAlphaComponent:0.45]] isSender:NO];
    }
    
    
    //bubbleImageV中的视图是不确定的，所以不打算复用，每次赋值移除之前视图，重新加新视图
    [self.bubbleImageV.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    
    
    
    
    //bubbleImagev内根据消息类型布局子视图
    switch (self.message.bubbleMessageBodyType) {
        case MessageBodyTypeText: {
            
            BubbleTextView *bubbleView = [BubbleTextView BubbleTextView];
            bubbleView.linkSelectDelegate = self;
            bubbleView.message = message;
            [self.bubbleImageV addSubview:bubbleView];
            
            
            CGSize size = [BubbleTextView BubbleTextViewSize:message];
            
            
            //注意self.bubbleImageV是在内部bubble的size.width上增加间距定的frame
            if (_message.isSender) {
                self.bubbleImageV.frame = CGRectMake(CGRectGetMinX(self.avateImageV.frame)-(size.width+2*KLeftMargin),KTopMargin,size.width+2*KLeftMargin,size.height+2*KTopMargin);
                
            }else{
                self.bubbleImageV.frame = CGRectMake(CGRectGetMaxX(self.avateImageV.frame),KTopMargin,size.width+2*KLeftMargin,size.height+2*KTopMargin);
            }
            
            bubbleView.frame = CGRectMake(KLeftMargin, KTopMargin, size.width, size.height);
            
            break;
        }
        case MessageBodyTypePhoto: {
            BubblePhotoView *bubbleView = [BubblePhotoView BubblePhotoView];
            bubbleView.message = message;
            [self.bubbleImageV addSubview:bubbleView];
            
            
            CGSize size = [BubblePhotoView bubblePhotoWithMessage:message];
            
            
            //注意self.bubbleImageV是在内部bubble的size.width上增加间距定的frame
            if (_message.isSender) {
                self.bubbleImageV.frame = CGRectMake(CGRectGetMinX(self.avateImageV.frame)-(size.width+KSenderLeftBubbleImageMargin+KSenderRightBubbleImageMargin),KTopBubbleImageMargin,size.width+KSenderLeftBubbleImageMargin+KSenderRightBubbleImageMargin,size.height+2*KTopBubbleImageMargin);
                bubbleView.frame = CGRectMake(KSenderLeftBubbleImageMargin,KTopBubbleImageMargin, size.width, size.height);
            }else{
                self.bubbleImageV.frame = CGRectMake(CGRectGetMaxX(self.avateImageV.frame),KTopBubbleImageMargin,size.width+KReceiverLeftBubbleImageMargin+KReceiverRightBubbleImageMargin,size.height+2*KTopBubbleImageMargin);
                bubbleView.frame = CGRectMake(KReceiverLeftBubbleImageMargin,KTopBubbleImageMargin, size.width, size.height);
            }
            
            
            //隐藏外部气泡图形
      //      self.bubbleImageV.image = nil;

            //change
             self.bubbleImageV.bubbleImage = nil;
            
            break;
        }
        case MessageBodyTypeVideo: {
            BubbleVideoView *bubbleView = [BubbleVideoView BubbleVideoView];
            bubbleView.message = message;
            [self.bubbleImageV addSubview:bubbleView];
            
            
            CGSize size = [BubbleVideoView bubbleVideoWithMessage:message];
            
            //注意self.bubbleImageV是在内部bubble的size.width上增加间距定的frame
            if (_message.isSender) {
                self.bubbleImageV.frame = CGRectMake(CGRectGetMinX(self.avateImageV.frame)-(size.width+KSenderLeftBubbleImageMargin+KSenderRightBubbleImageMargin),KTopBubbleImageMargin,size.width+KSenderLeftBubbleImageMargin+KSenderRightBubbleImageMargin,size.height+2*KTopBubbleImageMargin);
                bubbleView.frame = CGRectMake(KSenderLeftBubbleImageMargin,KTopBubbleImageMargin, size.width, size.height);
            }else{
                self.bubbleImageV.frame = CGRectMake(CGRectGetMaxX(self.avateImageV.frame),KTopBubbleImageMargin,size.width+KReceiverLeftBubbleImageMargin+KReceiverRightBubbleImageMargin,size.height+2*KTopBubbleImageMargin);
                bubbleView.frame = CGRectMake(KReceiverLeftBubbleImageMargin,KTopBubbleImageMargin, size.width, size.height);
            }
            
            //隐藏外部气泡图形
           // self.bubbleImageV.image = nil;
            //change
            self.bubbleImageV.bubbleImage = nil;
            break;
        }
        case MessageBodyTypeVoice: {
            
            BubbleVoiceView *bubbleView = [BubbleVoiceView BubbleVoiceView];
            bubbleView.message = message;
            [self.bubbleImageV addSubview:bubbleView];
            
            
            CGSize size = [BubbleVoiceView bubbleVoiceWithMessage:message];
            
            
            //注意self.bubbleImageV是在内部bubble的size.width上增加间距定的frame
            if (_message.isSender) {
                self.bubbleImageV.frame = CGRectMake(CGRectGetMinX(self.avateImageV.frame)-(size.width+2*KLeftMargin),KTopMargin,size.width+2*KLeftMargin,size.height+2*KTopMargin);
                
            }else{
                self.bubbleImageV.frame = CGRectMake(CGRectGetMaxX(self.avateImageV.frame),KTopMargin,size.width+2*KLeftMargin,size.height+2*KTopMargin);
            }
            
            bubbleView.frame = CGRectMake(KLeftMargin, KTopMargin, size.width, size.height);
            
            break;
        }
   
        case MessageBodyTypeLocation: {
            BubbleLocationView *bubbleView = [BubbleLocationView BubbleLocationView];
            bubbleView.message = message;
            [self.bubbleImageV addSubview:bubbleView];
            
            
            CGSize size = [BubbleLocationView BubbleLocationWithMessage:message];
            
            
            //注意self.bubbleImageV是在内部bubble的size.width上增加间距定的frame
            if (_message.isSender) {
                self.bubbleImageV.frame = CGRectMake(CGRectGetMinX(self.avateImageV.frame)-(size.width+2*KLeftMargin),KTopMargin,size.width+2*KLeftMargin,size.height+2*KTopMargin);
                
            }else{
                self.bubbleImageV.frame = CGRectMake(CGRectGetMaxX(self.avateImageV.frame),KTopMargin,size.width+2*KLeftMargin,size.height+2*KTopMargin);
            }
            
            bubbleView.frame = CGRectMake(KLeftMargin, KTopMargin, size.width, size.height);
            
            
            break;
        }
    }
    
    
    
    
    //左侧状态显示
    if (_message.isSender) {
        
         self.messageSendStateView.hidden = NO;

        
        self.messageSendStateView.frame = CGRectMake(CGRectGetMinX(self.bubbleImageV.frame)-20-KLeftMargin/2, CGRectGetHeight(self.bubbleImageV.frame)/2, 20, 20);
        [self.messageSendStateView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        switch (_message.deliveryState) {
            case MessageDeliveryStateDelivering: {
                
                UIActivityIndicatorView *activityView = [[UIActivityIndicatorView alloc]initWithFrame:self.messageSendStateView.bounds];
                [self.messageSendStateView addSubview:activityView];
                [activityView startAnimating];
                
            
                break;
            }
            case MessageDeliveryStateDelivered: {
        
                
                
                break;
            }
            case MessageDeliveryStateFailure: {

                
                UIButton *failureImageBtn = [[UIButton alloc]initWithFrame:self.messageSendStateView.bounds];
                [self.messageSendStateView addSubview:failureImageBtn];
                [failureImageBtn addTarget:self action:@selector(resendMessageAction:) forControlEvents:UIControlEventTouchUpInside];
                [failureImageBtn setImage:[NSBundle imageWithBundle:BundleName imageName:@"messageSendFail@2x"] forState:UIControlStateNormal];


                break;
            }
        }
    
    }
    
    else
    {
        self.messageSendStateView.hidden = YES;
    }
    
    
    
    
    
    
    //事件监听
   self.bubbleImageV.userInteractionEnabled = YES;
    
    if (_message.bubbleMessageBodyType == MessageBodyTypeText)
    {
        
        //手势也被复用了，进行移除
        for (UIGestureRecognizer *gesture in self.bubbleImageV.gestureRecognizers)
        {
            [self.bubbleImageV removeGestureRecognizer:gesture];
        }
        
        
        UITapGestureRecognizer *doubleTapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(doubleTapAction:)];
        doubleTapGesture.numberOfTapsRequired = 2;
        [self.bubbleImageV addGestureRecognizer:doubleTapGesture];
        
    }
    
    
    else
    {
        
        //手势也被复用了，进行移除
        for (UIGestureRecognizer *gesture in self.bubbleImageV.gestureRecognizers)
        {
     
            [self.bubbleImageV removeGestureRecognizer:gesture];
        }
        
    
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
       
        [self.bubbleImageV addGestureRecognizer:tapGesture];
    }
    
    
    
}



- (void)setUpUi
{
    
    self.avateImageV = [[UIImageView alloc]init];
    self.avateImageV.image = self.message.avatar;
    self.avateImageV.layer.cornerRadius = 45.0/2;
    self.avateImageV.clipsToBounds = YES;
    self.avateImageV.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(avaterTapAction:)];
    [self.avateImageV addGestureRecognizer:tapGesture];
    
    
    
    self.bubbleImageV = [[BubbleView alloc]init];
    self.bubbleImageV.backgroundColor = [UIColor clearColor];
    
    
    self.messageSendStateView = [[UIView alloc]init];
    
    
    
    
    
    [self.contentView addSubview:self.avateImageV];
    [self.contentView addSubview:self.bubbleImageV];
    [self.contentView addSubview:self.messageSendStateView];
    
}

- (void)doubleTapAction:(UITapGestureRecognizer *)tapGeture
{
    if (_delegate && [_delegate respondsToSelector:@selector(textBubbleDidSelectedOnMessage:)]) {
        [_delegate textBubbleDidSelectedOnMessage:_message];
    }
}


- (void)tapAction:(UITapGestureRecognizer *)tapGeture
{
    switch (_message.bubbleMessageBodyType) {
     
        case MessageBodyTypeText:
               break;
            
        case MessageBodyTypePhoto: {
            if (_delegate && [_delegate respondsToSelector:@selector(photoBubbleDidSelectedOnMessage:photo:)]) {
                
                //传imageView:留存足够接口给第三方
                BubblePhotoView *bubleView = self.bubbleImageV.subviews.lastObject;
                
                [_delegate photoBubbleDidSelectedOnMessage:_message photo:bubleView.subviews.lastObject];
            }
            break;
        }
        case MessageBodyTypeVideo: {
            if (_delegate && [_delegate respondsToSelector:@selector(videoBubbleDidSelectedOnMessage:)]) {
                [_delegate videoBubbleDidSelectedOnMessage:_message];
            }
            break;
        }
        case MessageBodyTypeVoice: {
            if (_delegate && [_delegate respondsToSelector:@selector(audioRecoderBubbleDidSelectedOnMessage:)]) {
                [_delegate audioRecoderBubbleDidSelectedOnMessage:_message];
            }
            break;
        }
        case MessageBodyTypeLocation: {
            if (_delegate && [_delegate respondsToSelector:@selector(locationBubbleDidSelectedOnMessage:)]) {
                [_delegate locationBubbleDidSelectedOnMessage:_message];
            }
            break;
        }
    }
}


- (void)resendMessageAction:(UIButton *)btn
{
    if (_delegate && [_delegate respondsToSelector:@selector(resendMessage:)]) {
        [_delegate resendMessage:_message];
    }
}

- (void)didSelectLink:(NSString *)link withType:(MLEmojiLabelLinkType)type
{
    if (_delegate && [_delegate respondsToSelector:@selector(didSelectLink:withType:)]) {
        
        [_delegate didSelectLink:link withType:type];
    }
}



- (void)avaterTapAction:(UITapGestureRecognizer *)tapGesture
{
    if (_delegate && [_delegate respondsToSelector:@selector(avaterDidSelectedOnMessage:)]) {
        
        [_delegate avaterDidSelectedOnMessage:_message];
    }
}


+ (CGFloat)CellHeight:(MessageModel *)message
{
    CGFloat avaterImageHeight = 45;
    
    
    CGFloat bubbleViewHeight = 0;
    switch (message.bubbleMessageBodyType) {
        case MessageBodyTypeText: {
            bubbleViewHeight = [BubbleTextView BubbleTextViewSize:message].height;
            bubbleViewHeight += KTopMargin*2;
            break;
        }
        case MessageBodyTypePhoto: {
            bubbleViewHeight = [BubblePhotoView bubblePhotoWithMessage:message].height;
            bubbleViewHeight += KTopMargin*2;
            break;
        }
        case MessageBodyTypeVideo: {
            bubbleViewHeight = [BubbleVideoView bubbleVideoWithMessage:message].height;
            bubbleViewHeight += KTopMargin*2;
            break;
        }
        case MessageBodyTypeVoice: {
            bubbleViewHeight = [BubbleVoiceView bubbleVoiceWithMessage:message].height;
            bubbleViewHeight += KTopMargin*2;
            break;
        }
  
        case MessageBodyTypeLocation: {
            bubbleViewHeight = [BubbleLocationView BubbleLocationWithMessage:message].height;
            bubbleViewHeight += KTopMargin*2;
            
            break;
        }
    }
    
    
    if (bubbleViewHeight<avaterImageHeight) {
        bubbleViewHeight = avaterImageHeight;
    }
    
    return KTopMargin+bubbleViewHeight+KTopMargin;
}
@end
