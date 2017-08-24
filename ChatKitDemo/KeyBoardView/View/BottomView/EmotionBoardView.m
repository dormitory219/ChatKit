//
//  EmotionBoardView.m
//  KeyBoardView
//
//  Created by 余强 on 16/3/25.

//

#import "EmotionBoardView.h"


#define  KMargin 4

//emoij表情排布
#define  KColumNum 7
#define  KRowNum 3



//其他表情排布
#define  KOtherColumNum 5
#define  KOtherRowNum 2


//类型0 gif表情

//gif  静态图命名：section0_emotion0@2x  动态图命名：emotion0
//第一个gif为section0,依次类推


//此处gif面板可用静态或gif，静态使用UIButton,动态使用FLAnimationView

//gif在bundle中位置： @"/gifFace/gifType1/emotion0"
//
//
//#define KEmoijs0 @[                            \
//                @"/gifFace/gifType1/emotion0",          \
//                @"/gifFace/gifType1/emotion1",          \
//                @"/gifFace/gifType1/emotion2",          \
//                @"/gifFace/gifType1/emotion3",          \
//                @"/gifFace/gifType1/emotion4",          \
//                @"/gifFace/gifType1/emotion5",          \
//                @"/gifFace/gifType1/emotion6",          \
//                @"emotion7",          \
//                @"emotion8",          \
//                @"emotion9",          \
//                @"emotion10",          \
//                @"emotion11",          \
//                @"emotion12",          \
//                @"emotion13",          \
//                @"emotion14",          \
//                @"emotion15",          \
//                    ]                             \

@interface EmotionBoardView ()

@property(nonatomic,strong) NSMutableArray *allEmoijs;

@property(nonatomic,strong) UIScrollView   *scrollView;

@end



@implementation EmotionBoardView




+ (instancetype)faceBoardView:(NSInteger)type scrollView:(UIScrollView *)scrollView frame:(CGRect)frame
{
    EmotionBoardView *face = [[self alloc]initWithFrame:frame];
    
    face.faceType = type;
    face.scrollView = scrollView;
    
    [face setUpUi];
    
    return face;
}



- (void)setUpUi
{
    
    //获得bundle对应路径
    NSString *path =  [@"gifFace" stringByAppendingPathComponent:[NSString stringWithFormat:@"gifType%ld",self.faceType]];
    
    path = [[NSBundle bundle:BundleName] pathForResource:path ofType:nil];
    
    NSArray *fileArray =  [[NSFileManager defaultManager]contentsOfDirectoryAtPath:path error:nil];
    
    
    
    
    
    [self getFaceDataWithFileArray:fileArray];
    
    
    [self layOut];
    
}


- (void)getFaceDataWithFileArray:(NSArray <NSString *>*)fileArray
{
    //emoij
    if (self.faceType == 0)
    {
        self.emotionType = EmotionTypeEmoij;
        [self.allEmoijs addObjectsFromArray:[Emoji allEmoji]];
    }
    
    
    //gif 和 photo
    else
    {
        
        
        
        //gif通用名
        NSString *gifName = nil;
        switch (self.faceType) {
                
            case 1:
                self.emotionType = EmotionTypeGif;
                gifName = @"emotion";
                
                break;
                
            case 2:
                self.emotionType = EmotionTypeGif;
                gifName = @"cuteEmotion";
                
                break;
                
            case 3:
                self.emotionType = EmotionTypeGif;
                gifName = @"niceEmotion";
                
                break;
                
            case 4:
                self.emotionType = EmotionTypePhoto;
                gifName = @"baoManEmotion";
                
                break;
                
            case 5:
                self.emotionType = EmotionTypeGif;
                gifName = @"emotion";
                
                break;
                
            case 6:
                self.emotionType = EmotionTypeGif;
                gifName = @"niceEmotion";
                
                break;
                
            case 7:
                self.emotionType = EmotionTypeGif;
                gifName = @"cuteEmotion";
                
                break;
                
            case 8:
                self.emotionType = EmotionTypeGif;
                gifName = @"emotion";
                
                break;
                
                
            default:
                break;
        }
        
        
        for (int i = 0; i<fileArray.count; i++) {
            
            [self.allEmoijs addObject:[self locationGifPathWithPosition:i gifName:gifName faceType:self.faceType]];
        }
    }
}




- (void)layOut
{
    NSInteger columNum;
    NSInteger rowNum;
    
    if (self.emotionType == EmotionTypeEmoij) {
        columNum = KColumNum;
        rowNum  = KRowNum;
    }else{
        columNum = KOtherColumNum;
        rowNum  = KOtherRowNum;
    }
    
    
    CGFloat width = (self.width0 - KMargin*(columNum+1))/columNum;
    CGFloat height = width;
    
    //标志前一个是delete
    BOOL isDeleteBtn = NO;
    for (int i = 0; i< self.allEmoijs.count; i++)
    {
        
        UIButton *btn = [[UIButton alloc]init];
        NSInteger page = i/(rowNum*columNum);
        btn.frame = [self getFrameWithColumesOfPerRow:columNum rowsOfPerColumn:rowNum itemWidth:width itemHeight:height marginX:KMargin maginY:KMargin atIndex:i atPage:page scrollView:self.scrollView];
        
        //是emoij,删除键和emoij布局
        if (self.emotionType == EmotionTypeEmoij)
        {
            
            if ((i+1) % (columNum*rowNum) == 0  &&  i > 0)
            {
                isDeleteBtn = YES;
                [btn setImage:[NSBundle imageWithBundle:BundleName imageName:@"faceDelete@2x"] forState:UIControlStateNormal];
                [btn addTarget:self action:@selector(emoijClickAction:) forControlEvents:UIControlEventTouchUpInside];
                //标记删除键
                btn.tag = -1;
                
            }
            
            else
            {
                
                if (isDeleteBtn)
                {
                    i --;
                }
                
                
                
                [btn setTitle: self.allEmoijs[i] forState:UIControlStateNormal];
                [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                
                [btn addTarget:self action:@selector(emoijClickAction:) forControlEvents:UIControlEventTouchUpInside];
                btn.tag = i;
                
                isDeleteBtn = NO;
                
            }
            
            
            [self addSubview:btn];
            
        }
        
        //gif
        else if(self.emotionType == EmotionTypeGif)
        {
            
            
            NSString *localPath = [[NSBundle bundle:BundleName]pathForResource:self.allEmoijs[i] ofType:@"gif"];
            FLAnimatedImageView *imageV = [[FLAnimatedImageView alloc]initWithFrame:btn.frame];
            imageV.userInteractionEnabled = YES;
            FLAnimatedImage *animationImage = [FLAnimatedImage animatedImageWithGIFData:[NSData dataWithContentsOfFile:localPath]];
            imageV.animatedImage = animationImage;
            imageV.tag = i;
            UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(emotionImageClickAction:)];
            [self addSubview:imageV];
            [imageV addGestureRecognizer:tapGesture];
            
            
            
            /*
             //gif表情使用静态表情面板：btn
             NSString *imageName = [[[NSString stringWithFormat:@"section%ld_",self.faceType-1]stringByAppendingString:self.allEmoijs[i]]stringByAppendingString:@"@2x"];
             
             [btn setImage:[NSBundle imageWithBundle:BundleName imageName: imageName] forState:UIControlStateNormal];
             [btn addTarget:self action:@selector(emotionImageClickAction:) forControlEvents:UIControlEventTouchUpInside];
             btn.tag = i;
             [self addSubview:btn];
             */
        }
        
        
        
        //photo
        else if(self.emotionType == EmotionTypePhoto)
        {
            
            NSString *localPath = [[NSBundle bundle:BundleName]pathForResource:self.allEmoijs[i] ofType:@"jpg"];
            
            [btn setImage:[UIImage imageWithContentsOfFile:localPath] forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(emotionImageClickAction:) forControlEvents:UIControlEventTouchUpInside];
            btn.tag = i;
            [self addSubview:btn];
        }
        
        
    }
    
    self.page =  self.allEmoijs.count/(columNum*rowNum)+1;
}





/**
 *  @brief 获取指定gif包里的gif文件
 *
 *  @param index    表情所在位置
 *  @param gifName  表情通用名：如emotion,cuteEmotion
 *  @param faceType 表情类型，在toolBar上排位决定
 *
 *  @return <#return value description#>
 */


//@"/gifFace/gifType1/emotion0",
//@"/gifFace/gifType1/emotion1"

- (NSString *)locationGifPathWithPosition:(NSInteger)position
                                  gifName:(NSString *)gifName
                                 faceType:(NSInteger)faceType
{
    NSString *path = [@"gifFace" stringByAppendingPathComponent:[NSString stringWithFormat:@"gifType%ld",faceType]];
    
    path = [path stringByAppendingPathComponent:[NSString stringWithFormat:@"%@%ld",gifName,position]];
    
    
    return path;
}


//gif表情点击：发消息
- (void)emotionImageClickAction:(UIButton *)btn
{
    
    NSString *localPath = nil;
    
    if (self.emotionType == EmotionTypePhoto)
    {
        localPath  = [[NSBundle bundle:BundleName]pathForResource:self.allEmoijs[btn.tag] ofType:@"jpg"];
    }
    
    else if (self.emotionType == EmotionTypeGif)
    {
        
        FLAnimatedImageView *imageV = (FLAnimatedImageView *)[(UIGestureRecognizer * )btn view];
        localPath  = [[NSBundle bundle:BundleName]pathForResource:self.allEmoijs[imageV.tag] ofType:@"gif"];
    }
   
    
    if (self.emotionViewDelegate && [self.emotionViewDelegate respondsToSelector:@selector(sendEmotionImage:emotionType:)])
    {
        
        [self.emotionViewDelegate sendEmotionImage:localPath emotionType:self.emotionType];
        
    }
}



//emoij表情点击：加内容
- (void)emoijClickAction:(UIButton *)btn
{

    if (self.emotionViewDelegate && [self.emotionViewDelegate respondsToSelector:@selector(addEmoij:isDeleteLastEmoij:)]) {
        
        btn.tag == -1 ? [self.emotionViewDelegate addEmoij:btn.titleLabel.text isDeleteLastEmoij:YES] : [self.emotionViewDelegate addEmoij:btn.titleLabel.text isDeleteLastEmoij:NO];
    }
    
    
}



/**
 *  @brief 格式布局
 *
 *  @param columesOfPerRow 多少列
 *  @param rowsOfPerColumn 多少行
 *  @param itemWidth       格宽
 *  @param itemHeight      格高
 *  @param marginX         格子间左右间隙
 *  @param marginY         格子间上下间隙
 *  @param index           格子所在索引
 *  @param page            格子所在页码
 *  @param scrollView      格子所在scrollview
 *
 *  @return <#return value description#>
 */
- (CGRect)getFrameWithColumesOfPerRow:(NSInteger)columesOfPerRow
                      rowsOfPerColumn:(NSInteger)rowsOfPerColumn
                            itemWidth:(CGFloat)itemWidth
                           itemHeight:(NSInteger)itemHeight
                              marginX:(CGFloat)marginX
                               maginY:(CGFloat)marginY
                              atIndex:(NSInteger)index
                               atPage:(NSInteger)page
                           scrollView:(UIScrollView *)scrollView
{
    CGRect itemFrame = CGRectMake((index % columesOfPerRow) * (itemWidth + marginX) + marginX + (page * CGRectGetWidth(scrollView.bounds)), ((index / columesOfPerRow) - rowsOfPerColumn * page) * (itemHeight + marginY) + marginY, itemWidth, itemHeight);
    return itemFrame;
}




- (NSMutableArray *)allEmoijs
{
    if (_allEmoijs == nil) {
        _allEmoijs = [[NSMutableArray alloc]init];
    }
    return _allEmoijs;
}

@end
