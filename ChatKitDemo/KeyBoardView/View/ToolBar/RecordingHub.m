//
//  RecordingShowView.m
//  KeyBoardView
//
//  Created by joy_yu on 16/3/20.

//

#import "RecordingHub.h"
#import "VoiceRecordHelper.h"
#import "NSBundle+KeyBoardExtension.h"
#import "KeyBoardHelpDefine.h"

@interface RecordingHub ()

@property(nonatomic,strong) UIView *bgView;

@property(nonatomic,strong)NSTimer *timer;
@property(nonatomic,strong)UIImageView *recordVoiceView;

@property(nonatomic,strong)UILabel *textLabel;

@end

@implementation RecordingHub

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setUpUi];
    }
    return self;
}

- (void)setUpUi
{
    self.bgView = [[UIView alloc] initWithFrame:self.bounds];
    self.bgView.backgroundColor = [UIColor grayColor];
    self.bgView.layer.cornerRadius = 5;
    self.bgView.layer.masksToBounds = YES;
    self.bgView.alpha = 0.6;
    [self addSubview:self.bgView];

    self.recordVoiceView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 0, self.bounds.size.width - 20, self.bounds.size.height - 10)];
    self.recordVoiceView.image = [UIImage imageNamed:@"VoiceSearchFeedback001"];
    [self addSubview:self.recordVoiceView];
    
    self.textLabel = [[UILabel alloc] initWithFrame:CGRectMake(5,self.bounds.size.height - 30,self.bounds.size.width - 10,25)];
    self.textLabel.textAlignment = NSTextAlignmentCenter;
    self.textLabel.backgroundColor = [UIColor clearColor];
    self.textLabel.text = NSLocalizedString(@"message.toolBar.record.upCancel", @"Fingers up slide, cancel sending");
    self.textLabel.font = [UIFont systemFontOfSize:12];
    self.textLabel.textColor = [UIColor whiteColor];
    self.textLabel.layer.cornerRadius = 5;
    self.textLabel.layer.borderColor = [[UIColor redColor] colorWithAlphaComponent:0.5].CGColor;
    self.textLabel.layer.masksToBounds = YES;
    [self addSubview:self.textLabel];
}

// 录音按钮按下
-(void)recordButtonTouchDown
{
    // 需要根据声音大小切换recordView动画
    self.textLabel.text = @"手指上滑，取消发送";
    //NSLocalizedString(@"message.toolBar.record.upCancel", @"Fingers up slide, cancel sending");
    self.textLabel.backgroundColor = [UIColor clearColor];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(updateVoiceImage)
     userInfo:nil repeats:YES];
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    
//    [[VoiceRecordHelper sharedInstance]asyncStartRecordingWithPath:fileName completion:^(NSError *error) {
//        if (error) {
//            NSLog(NSLocalizedString(@"message.startRecordFail", @"failure to start recording"));
//        }
//    }];
 
}

// 手指在录音按钮内部时离开
-(void)recordButtonTouchUpInside
{
    [_timer invalidate];
}

// 手指在录音按钮外部时离开
-(void)recordButtonTouchUpOutside
{
    [self.timer invalidate];
    
    [self removeFromSuperview];
}

// 手指移动到录音按钮内部
-(void)recordButtonDragInside
{
    self.textLabel.text = @"松开手指，取消发送";
    //NSLocalizedString(@"message.toolBar.record.upCancel", @"Fingers up slide, cancel sending");
    self.textLabel.backgroundColor = [UIColor clearColor];
}

// 手指移动到录音按钮外部
-(void)recordButtonDragOutside
{
    self.textLabel.text = self.textLabel.text = @"松开手指，取消发送";
    //NSLocalizedString(@"message.toolBar.record.loosenCancel", @"loosen the fingers, to cancel sending");
    self.textLabel.backgroundColor = [UIColor redColor];
}

- (void)setPeakPower:(float)peakPower
{
    _peakPower = peakPower;
    [self updateVoiceImage];
}

-(void)updateVoiceImage
{
    self.recordVoiceView.image = [UIImage imageNamed:@"VoiceSearchFeedback001@2x"];
    if (0 < _peakPower <= 0.05) {
        [self.recordVoiceView setImage:[NSBundle imageWithBundle:BundleName imageName:@"VoiceSearchFeedback001@2x"]];
    }else if (0.05<_peakPower<=0.10) {
        [self.recordVoiceView setImage:[NSBundle imageWithBundle:BundleName imageName:@"VoiceSearchFeedback002@2x"]];
    }else if (0.10<_peakPower<=0.15) {
         [self.recordVoiceView setImage:[NSBundle imageWithBundle:BundleName imageName:@"VoiceSearchFeedback003@2x"]];
    }else if (0.15<_peakPower<=0.20) {
         [self.recordVoiceView setImage:[NSBundle imageWithBundle:BundleName imageName:@"VoiceSearchFeedback004@2x"]];
    }else if (0.20<_peakPower<=0.25) {
        [self.recordVoiceView setImage:[NSBundle imageWithBundle:BundleName imageName:@"VoiceSearchFeedback005@2x"]];
    }else if (0.25<_peakPower<=0.30) {
      [self.recordVoiceView setImage:[NSBundle imageWithBundle:BundleName imageName:@"VoiceSearchFeedback006@2x"]];
    }else if (0.30<_peakPower<=0.35) {
         [self.recordVoiceView setImage:[NSBundle imageWithBundle:BundleName imageName:@"VoiceSearchFeedback007@2x"]];
    }else if (0.35<_peakPower<=0.40) {
         [self.recordVoiceView setImage:[NSBundle imageWithBundle:BundleName imageName:@"VoiceSearchFeedback008@2x"]];
    }else if (0.40<_peakPower<=0.45) {
       [self.recordVoiceView setImage:[NSBundle imageWithBundle:BundleName imageName:@"VoiceSearchFeedback009@2x"]];
    }else if (0.45<_peakPower<=0.50) {
       [self.recordVoiceView setImage:[NSBundle imageWithBundle:BundleName imageName:@"VoiceSearchFeedback010@2x"]];
    }else if (0.50<_peakPower<=0.55) {
        [self.recordVoiceView setImage:[NSBundle imageWithBundle:BundleName imageName:@"VoiceSearchFeedback011@2x"]];
    }else if (0.55<_peakPower<=0.60) {
        [self.recordVoiceView setImage:[NSBundle imageWithBundle:BundleName imageName:@"VoiceSearchFeedback012@2x"]];
    }else if (0.60<_peakPower<=0.65) {
         [self.recordVoiceView setImage:[NSBundle imageWithBundle:BundleName imageName:@"VoiceSearchFeedback013@2x"]];
    }else if (0.65<_peakPower<=0.70) {
      [self.recordVoiceView setImage:[NSBundle imageWithBundle:BundleName imageName:@"VoiceSearchFeedback014@2x"]];
    }else if (0.70<_peakPower<=0.75) {
         [self.recordVoiceView setImage:[NSBundle imageWithBundle:BundleName imageName:@"VoiceSearchFeedback015@2x"]];
    }else if (0.75<_peakPower<=0.80) {
          [self.recordVoiceView setImage:[NSBundle imageWithBundle:BundleName imageName:@"VoiceSearchFeedback016@2x"]];
    }else if (0.80<_peakPower<=0.85) {
           [self.recordVoiceView setImage:[NSBundle imageWithBundle:BundleName imageName:@"VoiceSearchFeedback017@2x"]];
    }else if (0.85<_peakPower<=0.90) {
           [self.recordVoiceView setImage:[NSBundle imageWithBundle:BundleName imageName:@"VoiceSearchFeedback018@2x"]];
    }else if (0.90<_peakPower<=0.95) {
           [self.recordVoiceView setImage:[NSBundle imageWithBundle:BundleName imageName:@"VoiceSearchFeedback019@2x"]];
    }else {
           [self.recordVoiceView setImage:[NSBundle imageWithBundle:BundleName imageName:@"VoiceSearchFeedback020@2x"]];
    }
}

@end
