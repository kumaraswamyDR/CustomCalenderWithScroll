//
//  CalenderCollectionViewLayout.m
//  SarvintApp
//
//  Created by Kumaraswamy D R on 31/08/16.
//  Copyright © 2016 Sarvint. All rights reserved.
//

#import "CalenderCollectionViewLayout.h"

@implementation CalenderCollectionViewLayout

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        //overriding default values
        self.scrollDirection = NO;
        self.minimumInteritemSpacing = 15;
       
        self.minimumLineSpacing = 15;
    }
    return self;
}

//- (NSArray *) layoutAttributesForElementsInRect:(CGRect)rect {
//    //Returns an array of UICollectionViewLayoutAttributes objects representing the layout information for the cells and views.
//    NSArray *attribArray = [super layoutAttributesForElementsInRect:rect];
//    
//    for(int i = 1; i < [attribArray count]; ++i) {
//        UICollectionViewLayoutAttributes *currentLayoutAttributes = attribArray[i];
//        UICollectionViewLayoutAttributes *prevLayoutAttributes = attribArray[i - 1];
//        //No separation between the cells
//        NSInteger maximumSpacing = 20;
//        NSInteger origin = CGRectGetMaxX(prevLayoutAttributes.frame);
//        
//        if((origin + maximumSpacing + currentLayoutAttributes.frame.size.width) < self.collectionViewContentSize.width) {
//            CGRect frame = currentLayoutAttributes.frame;
//            frame.origin.x = origin + maximumSpacing;
//            currentLayoutAttributes.frame = frame;
//        }
//    }
//    return attribArray;
//}


//If collection view bound changes, it will recompute all of its layout attributes
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}

@end
