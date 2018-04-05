//
//  ChatCollectionViewController+Helper.h
//  KeyBoardView
//
//  Created by joy_yu on 16/3/27.

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
