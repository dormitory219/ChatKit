//
//  ChatCollectionViewController+Helper.h
//  KeyBoardView
//
//  Created by 余强 on 16/3/27.
//  Copyright © 2016年 你好，我是余强，一位来自上海的ios开发者，现就职于bdcluster(上海大数聚科技有限公司)。这个工程致力于完成一个优雅的IM实现方案，如果您有兴趣，请来到项目交流群：533793277. All rights reserved.
//

#import "ChatCollectionViewController.h"
#import "CameraHelper.h"
#import "LocationHelper.h"




@interface ChatCollectionViewController (Helper)



/**
*  @brief 相簿选择
*
*  @param takePhotoOrVideoComplection <#takePhotoOrVideoComplection description#>
*  @param completion                  <#completion description#>
*/
- (void)pickerPhotoComplection:(DidFinishTakeMediaCompletionBlock)completion;


/**
 *  @brief 拍照/拍视频
 *
 *  @param completion <#completion description#>
 */
- (void)takePhotoOrVideoComplection:(DidFinishTakeMediaCompletionBlock)completion;



- (void)locationMapComplection:(void(^)(NSString *address,CLLocation *location,UIImage *, NSError *error))completion;




@end
