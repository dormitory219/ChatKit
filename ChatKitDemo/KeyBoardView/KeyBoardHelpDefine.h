//
//  ChatHelpDefine.h
//  KeyBoardView
//
//  Created by 余强 on 16/3/20.
//  Copyright © 2016年 你好，我是余强，一位来自上海的ios开发者，现就职于bdcluster(上海大数聚科技有限公司)。这个工程致力于完成一个优雅的IM实现方案，如果您有兴趣，请来到项目交流群：533793277. All rights reserved.
//

#ifndef ChatHelpDefine_h
#define ChatHelpDefine_h



typedef enum  {
    MoreViewTypePhotoAblums,
    MoreViewTypePhotoLocation,
    MoreViewTypeTakePicture,
    MoreViewTypePhoneCall,
    MoreViewTypeVideoCall,
} MoreViewType;


typedef enum  {
    KeyBoardTypeVoiceRecoder,   //录音
    KeyBoardTypeEmoij,          //emoij
    KeyBoardTypeMore,           //更多
    KeyBoardTypeSystem          //系统键盘
}  KeyBoardType;



/**
 Emotion面板表情类型
 */
typedef enum  {
    EmotionTypeEmoij,           //emoij
    EmotionTypeGif,             //gif
    EmotionTypePhoto,           //静态
}  EmotionType;




#define      SCREEN_WIDTH                     [UIScreen mainScreen].bounds.size.width
#define      SCREEN_HEIGHT                    [UIScreen mainScreen].bounds.size.height




#define KeyToolBarHeight 44

#define KTextViewHeightChangeNotification  @"textViewHeightChangeNotification"




#define kHorizontalPadding 8
#define kVerticalPadding 5



#define KTextHeight 33
#define  KMaxInputViewHeight 140


#define kVoiceRecorderTotalTime 120.0


#define  BundleName @"chatUiResource"

#endif /* ChatHelpDefine_h */
