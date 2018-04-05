//
//  BubbleImageView.m
//  KeyBoardView
//
//  Created by joy_yu on 16/3/21.

//

#import "BubblePhotoView.h"
#import "FLAnimatedImageView.h"
#import "FLAnimatedImage.h"
#import "UIImage+Addition.h"
#import <NSData+ImageContentType.h>




@interface BubblePhotoView ()

@property(nonatomic,strong) FLAnimatedImageView *imageV;

@end

@implementation BubblePhotoView

+ (instancetype)BubblePhotoView
{
    BubblePhotoView *bubbleView = [[self alloc]init];
    return bubbleView;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        self.imageV = [[FLAnimatedImageView alloc]initWithFrame:self.bounds];
        self.imageV.contentMode = UIViewContentModeScaleAspectFill;
        self.imageV.layer.cornerRadius = 6;
        self.imageV.clipsToBounds = YES;
        [self addSubview:self.imageV];
        
        self.backgroundColor = [UIColor clearColor];
        
        
    }
    return self;
}



//接收图片使用sdwebImage进行管理，如果是gif图，则不使用静态图绘制，如果不是，则绘制气泡
- (void)setMessage:(MessageModel *)message
{
    _message = message;
    
    if (_message.isSender) {
        
        if (_message.isGif) {
        
            FLAnimatedImage  *animalImage = [FLAnimatedImage animatedImageWithGIFData:[NSData dataWithContentsOfFile:_message.localPhotoPath]];
            self.imageV.animatedImage = animalImage;
            
        }else{
            self.imageV.image = [UIImage imageWithContentsOfFile:message.localPhotoPath];
        }
       
           [self setNeedsDisplay];
        
    }else{
        
        UIImage *placeHolderImage = [NSBundle imageWithBundle:BundleName imageName:@"placeholderImage@2x"];
        
      
        [self.imageV sd_setImageWithURL:[NSURL URLWithString:_message.thumbnailUrl] placeholderImage:placeHolderImage completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            
            
            
           // 此处传进的UIImage不是源类型的image，都转化为了静态格式
           // NSString *imageContentType = [NSData sd_contentTypeForImageData:UIImageJPEGRepresentation(image, 1)];
            
        
            //sdweb内部，gif图片使用的是_UIAnimatedImage,可用这个进行判断
           // _UIAnimatedImage
            
            //如果不是gif，则需要绘制
            [self setNeedsDisplay];
           
            
        }];
        
    }
   
    
 
   
   // NSLog(@"%f",self.imageV.image.size.width);
}



- (BOOL)isGifWithImagePath:(NSString *)imagePath
{
    NSData *imageData = [NSData dataWithContentsOfFile:imagePath];
    
    NSString *contentType = [NSData sd_contentTypeForImageData:imageData];
    
    if ([contentType isEqualToString:@"image/gif"]) {
        return YES;
    }else{
        return NO;
    }
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    
    //一旦开启image绘图，不能执行这句self.bounds（气泡绘制失效），而gif图,如表情，还有自己选的gif图则不需要渲染气泡，因为没执行drawRect方法，则需要赋值坐标
    if (_message.isGif) {
        self.imageV.frame = self.bounds;
    }else{
        //静态页面绘制也需要设置，否则有问题
        self.imageV.frame = CGRectMake(KMargin, KMargin, self.frame.size.width-2*KMargin, self.frame.size.height-2*KMargin);
    }
  
   
}


- (void)drawRect:(CGRect)rect
{
    
    //接受消息图片展示使用sedWebImage
    if (!_message.isGif) {
        [UIImage drawImage:self.imageV.image atFrame:rect isSender:_message.isSender];
    }
}


//服务器未返回图片尺寸，图片宽大于高时，设置图片宽为最宽，高度按比例;图片宽小于高时，设置图片高为最宽，高度按比例
//发送图片，使用本地图片，自己计算image的size
+ (CGSize)bubblePhotoWithMessage:(MessageModel *)message
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
        
        if (message.localPhotoPath)
        {
            UIImage *photo = [UIImage imageWithContentsOfFile:message.localPhotoPath];
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
