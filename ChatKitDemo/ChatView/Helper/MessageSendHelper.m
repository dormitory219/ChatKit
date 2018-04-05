//
//  ChatSendHelper.m
//  KeyBoardView
//
//  Created by joy_yu on 16/3/22.


#import "MessageSendHelper.h"
#import "UpLoadFileHelper.h"

@implementation MessageSendHelper

//消息发送网络业务操作
+ (void)sendMessage:(MessageModel *)message
         completion:(void (^)(MessageServiceModel *))completionBlock
{
    
    //模拟消息发送:
    //照片，视频，音频消息发送：先将文件上传到对应的图片，视频或音频服务器，获取远程地址url，在进行消息体包装后进行发送
    switch (message.bubbleMessageBodyType)
    {
        case MessageBodyTypeText:
            break;
        case MessageBodyTypePhoto:
        {
            FileConfig *fileConfig =[FileConfig fileConfigWithUrl:@"" fileData:nil serveName:nil fileName:nil mimeType:nil];
            [[UpLoadFileHelper helper]uploadFiles:fileConfig progress:^(NSProgress *progress) {
                
            } completion:^(id responseObject) {
                //getMessageUrl:
                NSString *remoteFileUrl = responseObject[@"url"];
                message.imMessage.messageType = MessageBodyTypePhoto;
                message.imMessage.messageBody = remoteFileUrl;
            } failure:^(NSError *error) {
                 NSLog(@"图片上传失败:%@",error.localizedDescription);
            }];
            break;
        }
        case MessageBodyTypeVideo:
        {
            FileConfig *fileConfig =[FileConfig fileConfigWithUrl:@"" fileData:nil serveName:nil fileName:nil mimeType:nil];
            [[UpLoadFileHelper helper]uploadFiles:fileConfig progress:^(NSProgress *progress) {
                
            } completion:^(id responseObject) {
                
                //getMessageUrl:
                NSString *remoteFileUrl = responseObject[@"url"];
                message.imMessage.messageType = MessageBodyTypeVideo;
                message.imMessage.messageBody = remoteFileUrl;
            } failure:^(NSError *error) {
                 NSLog(@"视频上传失败:%@",error.localizedDescription);
            }];
            break;
        }
        case MessageBodyTypeVoice:
        {
            FileConfig *fileConfig =[FileConfig fileConfigWithUrl:@"" fileData:nil serveName:nil fileName:nil mimeType:nil];
            [[UpLoadFileHelper helper]uploadFiles:fileConfig progress:^(NSProgress *progress) {
                
            } completion:^(id responseObject) {
                //getMessageUrl:
                NSString *remoteFileUrl = responseObject[@"url"];
                message.imMessage.messageType = MessageBodyTypeVoice;
                message.imMessage.messageBody = remoteFileUrl;
            } failure:^(NSError *error) {
                 NSLog(@"音频上传失败:%@",error.localizedDescription);
            }];
            break;
        }
        case MessageBodyTypeLocation:
        {
            FileConfig *fileConfig =[FileConfig fileConfigWithUrl:@"" fileData:nil serveName:nil fileName:nil mimeType:nil];
            [[UpLoadFileHelper helper]uploadFiles:fileConfig progress:^(NSProgress *progress) {
                
            } completion:^(id responseObject) {
                //getMessageUrl:
                NSString *remoteFileUrl = responseObject[@"url"];
                message.imMessage.messageType = MessageBodyTypePhoto;
                message.imMessage.messageBody = remoteFileUrl;
                
            } failure:^(NSError *error) {
                NSLog(@"位置截图上传失败:%@",error.localizedDescription);
            }];
            break;
        }
    }
    //demo故意延迟，制作消息发送的网络的传送效果
    MessageServiceModel *messageService = [[MessageServiceModel alloc]init];
    messageService.messageId = message.messageId;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
         message.deliveryState = arc4random_uniform(3);
        completionBlock ? completionBlock(messageService): nil;
    });
    
}

@end
