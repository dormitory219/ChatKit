//
//  SpringCollectionFlowLayout.m
//  KeyBoardView
//
//  Created by joy_yu on 16/3/25.

//

#import "SpringCollectionFlowLayout.h"

@interface SpringCollectionFlowLayout()
@property (nonatomic, strong) UIDynamicAnimator *animator;
@end

@implementation SpringCollectionFlowLayout

-(id)init {
    if ([super init]) {
        _springDamping = 0.5;
        _springFrequency = 0.8;
        _resistanceFactor = 1000;
    }
    return self;
}

-(void)setSpringDamping:(CGFloat)springDamping {
    if (springDamping >= 0 && _springDamping != springDamping) {
        _springDamping = springDamping;
        for (UIAttachmentBehavior *spring in _animator.behaviors) {
            spring.damping = _springDamping;
        }
    }
}

-(void)setSpringFrequency:(CGFloat)springFrequency {
    if (springFrequency >= 0 && _springFrequency != springFrequency) {
        _springFrequency = springFrequency;
        for (UIAttachmentBehavior *spring in _animator.behaviors) {
            spring.frequency = _springFrequency;
        }
    }
}


/*
-(void)prepareLayout {
    [super prepareLayout];
    if (!_animator)
    {
        
        _animator = [[UIDynamicAnimator alloc] initWithCollectionViewLayout:self];
        CGSize contentSize = [self collectionViewContentSize];
        NSArray *items = [super layoutAttributesForElementsInRect:CGRectMake(0, 0, contentSize.width, contentSize.height)];
        
        for (UICollectionViewLayoutAttributes *item in items) {
            UIAttachmentBehavior *spring = [[UIAttachmentBehavior alloc] initWithItem:item attachedToAnchor:item.center];
            
            spring.length = 0;
            spring.damping = self.springDamping;
            spring.frequency = self.springFrequency;
            
            [_animator addBehavior:spring];
        }
    }
}

-(NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    
        NSArray *attributesInRect = [super layoutAttributesForElementsInRect:rect];
    
    if (1) {
        NSMutableArray *attributesInRectCopy = [attributesInRect mutableCopy];
        NSArray *dynamicAttributes = [_animator itemsInRect:rect];
        
        //  avoid duplicate attributes
        //  use dynamic animator attribute item instead of regular item, if it exists
        for (UICollectionViewLayoutAttributes *eachItem in attributesInRect) {
            
            for (UICollectionViewLayoutAttributes *eachDynamicItem in dynamicAttributes) {
                if ([eachItem.indexPath isEqual:eachDynamicItem.indexPath]
                    && eachItem.representedElementCategory == eachDynamicItem.representedElementCategory) {
                    
                    [attributesInRectCopy removeObject:eachItem];
                    [attributesInRectCopy addObject:eachDynamicItem];
                    continue;
                }
            }
        }
        
        attributesInRect = attributesInRectCopy;
    }
    
    return attributesInRect;

    
}



- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    [super layoutAttributesForItemAtIndexPath:indexPath];
    return [_animator layoutAttributesForCellAtIndexPath:indexPath];
}

-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    UIScrollView *scrollView = self.collectionView;
    CGFloat scrollDelta = newBounds.origin.y - scrollView.bounds.origin.y;
    CGPoint touchLocation = [scrollView.panGestureRecognizer locationInView:scrollView];
    
    for (UIAttachmentBehavior *spring in _animator.behaviors) {
        CGPoint anchorPoint = spring.anchorPoint;
        CGFloat distanceFromTouch = fabsf(touchLocation.y - anchorPoint.y);
        CGFloat scrollResistance = distanceFromTouch / self.resistanceFactor;
        
        UICollectionViewLayoutAttributes *item = [spring.items firstObject];
        CGPoint center = item.center;
        center.y += (scrollDelta > 0) ? MIN(scrollDelta, scrollDelta * scrollResistance)
        : MAX(scrollDelta, scrollDelta * scrollResistance);
        item.center = center;
        
        [_animator updateItemUsingCurrentState:item];
    }
    return NO;
}

*/

@end
