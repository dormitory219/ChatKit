//
//  BubbleVideoView.m
//  KeyBoardView
//
//  Created by 余强 on 16/3/23.

//

#import "BubbleVideoView.h"
#import "UIImage+Addition.h"

//与BubbleImageView类似，几乎是拷贝代码，为什么分开，主要是希望功能模块化

@interface BubbleVideoView ()


@property(nonatomic,strong) UIImageView *imageV;

@end

@implementation BubbleVideoView

+ (instancetype)BubbleVideoView
{
    BubbleVideoView *bubbleView = [[self alloc]init];
    return bubbleView;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        self.imageV = [[UIImageView alloc]initWithFrame:self.bounds];
        self.imageV.contentMode = UIViewContentModeCenter;
        self.imageV.clipsToBounds = YES;
        self.imageV.layer.cornerRadius = 6;
        [self addSubview:self.imageV];
        
        
        self.backgroundColor = [UIColor clearColor];
        
        
    }
    return self;
}


- (void)setMessage:(MessageModel *)message
{
    _message = message;
    if (_message.isSender) {
        self.imageV.image = [UIImage imageWithContentsOfFile:_message.videoThumbPhoto];
    }else{
        
        UIImage *placeHolderImage = [NSBundle imageWithBundle:BundleName imageName:@"placeholderImage@2x"];
        
        
        [self.imageV sd_setImageWithURL:[NSURL URLWithString:_message.videoThumbUrl] placeholderImage:placeHolderImage completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            
            
            
            // 此处传进的UIImage不是源类型的image，都转化为了静态格式
            // NSString *imageContentType = [NSData sd_contentTypeForImageData:UIImageJPEGRepresentation(image, 1)];
            
            
            //sdweb内部，gif图片使用的是_UIAnimatedImage,可用这个进行判断
            // _UIAnimatedImage
            
            //如果不是gif，则需要绘制
            _message.isGif = NO;
            [self setNeedsDisplay];
            
        }];
    }
    
}

- (void)drawRect:(CGRect)rect
{
    
    //接受消息图片展示使用sedWebImage
    if (!_message.isGif) {
        
        [UIImage drawImage:self.imageV.image atFrame:rect isSender:_message.isSender];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    
    //一旦开启image绘图，不能执行这句，而gif图不需要渲染气泡
    if (_message.isGif) {
        self.imageV.frame = self.bounds;
    }
    
    
}



//服务器未返回图片尺寸，图片宽大于高时，设置图片宽为最宽，高度按比例;图片宽小于高时，设置图片高为最宽，高度按比例
//发送图片，使用本地图片，自己计算image的size
+ (CGSize)bubbleVideoWithMessage:(MessageModel *)message
{
    CGSize imageSize = message.size;
    
    /*
    //未返回尺寸
    if (imageSize.width == 0 || imageSize.height == 0) {
        
        if (message.localPhotoPath) {
            
            UIImage *photo = [UIImage imageWithContentsOfFile:message.localPhotoPath];
            imageSize = photo.size;
            if (imageSize.width>KBubbleImageMaxWidth) {
                
                
                imageSize.height *= KBubbleImageMaxWidth/imageSize.width;
                imageSize.width = KBubbleImageMaxWidth;
            }
        }else{ //正常接口不会走这步，demo使用网络图片才会走这步
            imageSize.width = KBubbleImageMaxWidth;
            imageSize.height = KBubbleImageMaxWidth;
        }
        
        
    }
    else{
        
        //返回服务器图片尺寸，不能超过最大图片显示宽度
        if (imageSize.width>KBubbleImageMaxWidth) {
            
            imageSize.height *= KBubbleImageMaxWidth/imageSize.width;
            imageSize.width = KBubbleImageMaxWidth;
        }
    }
     
     */
    
    //  改变图片处理方式：微信方式：长>宽  ，图片长为固定最大长度，宽按比例缩放，长<宽，图片宽为最大宽度，长按比例缩放
    if (imageSize.width == 0 || imageSize.height == 0) {
        
        if (message.videoThumbPhoto)
        {
            UIImage *photo = [UIImage imageWithContentsOfFile:message.videoThumbPhoto];
            imageSize = photo.size;
            if (imageSize.width>imageSize.height)
            {
                imageSize.height *= KBubbleImageMaxWidth/imageSize.width;
                imageSize.width = KBubbleImageMaxWidth;
            }else{
                
                imageSize.width *= KBubbleImageMaxHeight/imageSize.height;
                imageSize.height = KBubbleImageMaxHeight;
            }
        }
        
        else
        { //正常接口不会走这步，demo使用网络图片才会走这步
            imageSize.width = KBubbleImageMaxWidth;
            imageSize.height = KBubbleImageMaxHeight;
        }
        
        
    }
    else{
        
        //返回服务器图片尺寸
        if (imageSize.width>imageSize.height)
        {
            imageSize.height *= KBubbleImageMaxWidth/imageSize.width;
            imageSize.width = KBubbleImageMaxWidth;
        }else{
            
            imageSize.width *= KBubbleImageMaxHeight/imageSize.height;
            imageSize.height = KBubbleImageMaxHeight;
        }
    }
    
    
    
    return imageSize;
}


@end
