//
//  SpringCollectionFlowLayout.h
//  KeyBoardView
//
//  Created by 余强 on 16/3/25.

//

#import <UIKit/UIKit.h>

@interface SpringCollectionFlowLayout : UICollectionViewFlowLayout
@property (nonatomic, assign) CGFloat springDamping;
@property (nonatomic, assign) CGFloat springFrequency;
@property (nonatomic, assign) CGFloat resistanceFactor;

@end
