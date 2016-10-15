//
//  ChatViewController.m
//  KeyBoardView
//
//  Created by 余强 on 16/3/22.
//  Copyright © 2016年 你好，我是余强，一位来自上海的ios开发者，现就职于bdcluster(上海大数聚科技有限公司)。这个工程致力于完成一个优雅的IM实现方案. All rights reserved.
//


#import "ChatViewController.h"
#import "ChatCell.h"
#import "ChatTimeCell.h"
#import "ChatHelp.h"
#import "ChatDemoDataSourceHelper.h"
#import "NSDate+Addition.h"
@interface ChatViewController ()<UITableViewDataSource,UITableViewDelegate,VoiceReordingDelegate,TextInputDelegate,MoreViewDelegate,EmotionViewDelegate>

@property(nonatomic,strong) UITableView *chatTable;


@property(nonatomic,strong) KeyBoardView *keyBoardView;
@property(nonatomic,strong) VoiceRecordHelper *voiceRecordHelper;

@property(nonatomic,strong) NSMutableArray *chatFakeMessages;
@end

@implementation ChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    [self.view addSubview:self.chatTable];
    

    [self.view addSubview:self.keyBoardView];
     [self.chatTable addObserver:self forKeyPath:@"contentSize" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.15 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.chatTable scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:self.chatFakeMessages.count-1 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    });

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}






- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.keyBoardView.hideKeyBoard = YES;
}





NSString *const leftChatCellIdentifier = @"cellleftCellId";
NSString *const rightChatCellIdentifier = @"cellleftCellId";
NSString *const chatTimeCellIdentifier = @"timeCellId";
#pragma mark -- chatTable
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.chatFakeMessages.count;
}






- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id obj = self.chatFakeMessages[indexPath.row];
    UITableViewCell *cell = nil;
    
    if ([obj isKindOfClass:[MessageModel class]]) {
        
        ChatCell *messageCell = (ChatCell *)cell;
        MessageModel *message = (MessageModel *)obj;
        if (message.isSender) {
            messageCell = [tableView dequeueReusableCellWithIdentifier:rightChatCellIdentifier ];
            
            
        }else{
            messageCell = [tableView dequeueReusableCellWithIdentifier:leftChatCellIdentifier ];
        }
        messageCell.message = message;
        
        messageCell.backgroundColor = [[UIColor lightGrayColor]colorWithAlphaComponent:0.45];
        
        return messageCell;
        
    }
    
    else
    {
        ChatTimeCell *timeCell = (ChatTimeCell *)cell;
        timeCell = [tableView dequeueReusableCellWithIdentifier:chatTimeCellIdentifier ];
        NSString *time = (NSString *)obj;
        timeCell.time = time;
        
        timeCell.backgroundColor = [[UIColor lightGrayColor]colorWithAlphaComponent:0.45];
        
        return timeCell;
    }

}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id obj = self.chatFakeMessages[indexPath.row];
    
    if ( [obj isKindOfClass:[MessageModel class]]) {
         return [ChatCell CellHeight:obj];
    }
    
    return 30;

}










#pragma mark -- customKeyBoard


- (KeyBoardView *)keyBoardView
{
    
    
    if (_keyBoardView == nil) {
        _keyBoardView = [[KeyBoardView alloc]init];
        _keyBoardView.voiceRecoderDelegate = self;
        _keyBoardView.textInputDelegate = self;
        _keyBoardView.moreViewDelegate = self;
        _keyBoardView.emoijViewDelegate = self;
        [_keyBoardView addObserver:self forKeyPath:@"keyBoardDetalChange" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
        
    }
    
    return _keyBoardView;
}



#pragma mark - Voice Recording delegate
- (void)prepareRecordingVoiceAction
{
    NSLog(@"prepareRecordingWithCompletion");
    [self prepareRecordWithCompletion:^BOOL{
        
        return YES;
    }];
}

- (void)didStartRecordingVoiceAction {
    NSLog(@"didStartRecordingVoice");
    [self startRecord];
}

- (void)didCancelRecordingVoiceAction {
    NSLog(@"didCancelRecordingVoice");
    [self cancelRecord];
}

- (void)didFinishRecoingVoiceAction {
    NSLog(@"didFinishRecoingVoice");
    [self finishRecorded];

}

- (void)didDragOutsideAction {
    NSLog(@"didDragOutsideAction");
    [self resumeRecord];
}

- (void)didDragInsideAction {
    NSLog(@"didDragInsideAction");
    [self pauseRecord];
}



#pragma mark ---textSendDelegate
//发送纯文本消息
- (void)sendTextMessage:(NSString *)text
{
    
    TextMessageModel *message =  [TextMessageModel text:text username:@"" timeStamp:[NSDate date:[NSDate date] WithFormate:KDateFormate] isSender:YES];
    message.avatarUrl = @"http://d.hiphotos.baidu.com/zhidao/wh%3D450%2C600/sign=603e37439313b07ebde8580c39e7bd15/a8014c086e061d9591b7875a7bf40ad163d9cadb.jpg";
    
 
    [self sendMessage:message];
  
}


#pragma mark ---emoijMessageSendDelegate
//发送emoi表情
- (void)sendEmoijMessage:(NSString *)text
{
    TextMessageModel *message =  [TextMessageModel text:text username:@"" timeStamp:[NSDate date:[NSDate date] WithFormate:KDateFormate] isSender:YES];
    message.avatarUrl = @"http://d.hiphotos.baidu.com/zhidao/wh%3D450%2C600/sign=603e37439313b07ebde8580c39e7bd15/a8014c086e061d9591b7875a7bf40ad163d9cadb.jpg";
    
    [self sendMessage:message];
    
   
}


//发送非emoij图片
- (void)sendEmotionImage:(NSString *)localPath emotionType:(EmotionType)emotionType
{
   
    PhotoMessageModel *message =  [PhotoMessageModel Photo:localPath thumbnailUrl:nil originPhotoUrl:nil username:nil timeStamp:[NSDate date:[NSDate date] WithFormate:KDateFormate] isSender:YES];
    if (emotionType == EmotionTypeGif)
    {
        message.isGif = YES;
    }
    else
    {
        message.isGif = NO;
    }

    message.avatarUrl = @"http://d.hiphotos.baidu.com/zhidao/wh%3D450%2C600/sign=603e37439313b07ebde8580c39e7bd15/a8014c086e061d9591b7875a7bf40ad163d9cadb.jpg";
    
    [self sendMessage:message];
 
}


#pragma mark ---MoreViewClickDelegate
- (void)moreViewClick:(MoreViewType)type
{
    switch (type) {
        case MoreViewTypePhotoAblums:
            NSLog(@"拍照");
            break;
        case MoreViewTypePhotoLocation:
            NSLog(@"位置");
            
            break;
        case MoreViewTypeTakePicture:
            NSLog(@"拍照");
            
            break;
        case MoreViewTypePhoneCall:
            NSLog(@"语音电话");
            
            break;
        case MoreViewTypeVideoCall:
            NSLog(@"视频通话");
            
            break;
            
        default:
            break;
    }
    
    
}





#pragma mark ---voiceRecoder

- (NSString *)getRecorderPath
{
    
    NSDate *now = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyyMMddHHmmss"];
    NSString *fileName = [dateFormatter stringFromDate:now];
    
    NSString *recordPath = NSHomeDirectory();
    recordPath = [NSString stringWithFormat:@"%@/Library/chatbuffer/%@.m4a",recordPath,fileName];
    NSFileManager *fm = [NSFileManager defaultManager];
    if(![fm fileExistsAtPath:[recordPath stringByDeletingLastPathComponent]]){
        [fm createDirectoryAtPath:[recordPath stringByDeletingLastPathComponent]
      withIntermediateDirectories:YES
                       attributes:nil
                            error:nil];
    }
    
    
    return recordPath;
}



- (void)prepareRecordWithCompletion:(PrepareRecorderCompletion)completion
{
    [self.voiceRecordHelper prepareRecordingWithPath:[self getRecorderPath] prepareRecorderCompletion:completion];
}


- (void)startRecord
{
    
    [self.voiceRecordHelper startRecordingWithStartRecorderCompletion:^{
        
        
    }];
}


- (void)finishRecorded
{
    [self.voiceRecordHelper stopRecordingWithStopRecorderCompletion:^(NSString *path){
    
        [self sendVoiceRecoder:path voiceDuration:self.voiceRecordHelper.recordDuration];
        
    }];
}


//发送语音消息
- (void)sendVoiceRecoder:(NSString *)voiceRecoderPath voiceDuration:(NSString *)voiceDuration
{
    VoiceMessageModel *message =  [VoiceMessageModel VoicePath:voiceRecoderPath voiceUrl:nil voiceDuration:voiceDuration username:nil timeStamp:[NSDate date:[NSDate date] WithFormate:KDateFormate] isRead:YES isSender:YES];
    message.avatarUrl = @"http://d.hiphotos.baidu.com/zhidao/wh%3D450%2C600/sign=603e37439313b07ebde8580c39e7bd15/a8014c086e061d9591b7875a7bf40ad163d9cadb.jpg";
    
    [self.chatFakeMessages addObject:message];
    [self.chatTable reloadData];
    
    
    NSLog(@"messageSend:voiceRecoder:%@",voiceRecoderPath);
}


- (void)pauseRecord
{
    
    [self.voiceRecordHelper pauseRecordingWithPauseRecorderCompletion:^{
        
    }];
}


- (void)resumeRecord
{
    [self.voiceRecordHelper resumeRecordingWithResumeRecorderCompletion:^{
        
    }];
    
}

- (void)cancelRecord
{
    [self.voiceRecordHelper cancelledDeleteWithCompletion:^{
        
    }];
}





- (VoiceRecordHelper *)voiceRecordHelper
{
    
    __weak typeof(self) weakSelf = self;
    if (!_voiceRecordHelper) {
        //   _isMaxTimeStop = NO;
        
        _voiceRecordHelper = [[VoiceRecordHelper alloc] init];
        _voiceRecordHelper.maxTimeStopRecorderCompletion = ^(NSString *path){
            NSLog(@"到最大限制时间了！！");

            
            [weakSelf finishRecorded];
        };
        _voiceRecordHelper.peakPowerForChannel = ^(float peakPowerForChannel) {

            
            weakSelf.keyBoardView.peakPower = peakPowerForChannel;
            
            
            
        };
        _voiceRecordHelper.maxRecordTime = kVoiceRecorderTotalTime;
    }
    return _voiceRecordHelper;
}




#pragma mark --- sendMessage
- (void)sendMessage:(MessageModel *)message
{
    
    switch (message.bubbleMessageBodyType) {
        case MessageBodyTypeText: {
    
            NSLog(@"messageSend  <Text>:%@",message.text);
            break;
        }
        case MessageBodyTypePhoto: {
            NSLog(@"messageSend <Photo>:%@",message.localPhotoPath);
            break;
        }
        case MessageBodyTypeVideo: {
            NSLog(@"messageSend <Video>:%@",message.videoThumbPhoto);
            break;
        }
        case MessageBodyTypeVoice: {
            NSLog(@"messageSend <Voice>:%@",message.voiceDuration);
            break;
        }
        case MessageBodyTypeLocation: {
            NSLog(@"messageSend <Location>:%@",message.location);
            break;
        }
    }
    
    
    [self.chatFakeMessages addObject:message];
    [self.chatTable reloadData];
    
}




#pragma mark -- kvo  键盘事件调整table的offset
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    //监测键盘变化：改变chatTable的offset
     if ([keyPath isEqualToString:@"keyBoardDetalChange"]){
        
        [self.chatTable setContentOffset:CGPointMake(0, self.chatTable.contentSize.height+self.keyBoardView.keyBoardDetalChange-SCREEN_HEIGHT) animated:YES];
     
    }
    
    //监测聊天消息接收和发送，系统table的contentSize变化，改变offset
    else if ([keyPath isEqualToString:@"contentSize"]){
        
         [self.chatTable setContentOffset:CGPointMake(0, self.chatTable.contentSize.height+self.keyBoardView.keyBoardDetalChange-SCREEN_HEIGHT) animated:YES];
    }

}



- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    self.keyBoardView.hideKeyBoard = YES;
}



- (UITableView *)chatTable
{
    if (!_chatTable) {
    
        _chatTable = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        [_chatTable registerClass:[ChatCell class] forCellReuseIdentifier:leftChatCellIdentifier];
        [_chatTable registerClass:[ChatCell class] forCellReuseIdentifier:rightChatCellIdentifier];
        [_chatTable registerClass:[ChatTimeCell class] forCellReuseIdentifier:chatTimeCellIdentifier];
        _chatTable.delegate = self;
        _chatTable.dataSource = self;
        _chatTable.contentInset = UIEdgeInsetsMake(0, 0, 44, 0);
        _chatTable.separatorStyle = UITableViewCellSelectionStyleNone;
    }
    return _chatTable;
}



- (NSMutableArray *)chatFakeMessages
{
    if (_chatFakeMessages == nil) {
        _chatFakeMessages = [[NSMutableArray alloc]init];
        [_chatFakeMessages addObjectsFromArray:[ChatDemoDataSourceHelper getFakeMessages]];
    }
    return _chatFakeMessages;
}



- (void)dealloc
{
    
    [[NSNotificationCenter defaultCenter]removeObserver:self forKeyPath:@"contentSize"];
    [[NSNotificationCenter defaultCenter]removeObserver:self forKeyPath:@"keyBoardDetalChange"];
}




@end
