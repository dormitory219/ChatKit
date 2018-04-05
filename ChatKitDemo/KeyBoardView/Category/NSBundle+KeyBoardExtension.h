//
//  NSBundle+KeyBoardExtension.h
//  KeyBoardView
//
//  Created by joy_yu on 16/3/20.

//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSBundle (KeyBoardExtension)

+ (UIImage *)imageWithBundle:(NSString *)bundleName imageName:(NSString *)imageName;


+ (NSBundle *)bundle:(NSString *)bundleName;

@end
