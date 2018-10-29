


//
//  LSCollectionViewLayout.m
//  fsdjlkfjlfjdslk
//
//  Created by liusong on 2018/10/22.
//  Copyright © 2018年 liusong. All rights reserved.
//

#import "LSCollectionViewLayout.h"
#import "LSCollectionDecorationView.h"
@implementation LSCollectionViewLayout
- (void)prepareLayout {
    [super prepareLayout];
    [self registerClass:[LSCollectionDecorationView class] forDecorationViewOfKind:@"decorationView"];
}
- (UICollectionViewLayoutAttributes *)layoutAttributesForDecorationViewOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath top:(CGFloat)top {
    UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForDecorationViewOfKind:elementKind withIndexPath:indexPath];
    
    NSUInteger numberOfItems = [self.collectionView numberOfItemsInSection:indexPath.section];
    int itemsPerRow = 3;
    NSUInteger rows = (numberOfItems + itemsPerRow - 1) / itemsPerRow;
    CGFloat cellHeight = 80;
    CGFloat cellSpace = 20;
    CGFloat headerHeigh = 90;
    CGFloat footerHeight = 70;
    CGFloat height = headerHeigh + cellHeight * rows + cellSpace * (rows - 1) + footerHeight;
    
    attrs.frame = CGRectMake(0, top, [UIScreen mainScreen].bounds.size.width, height);
    attrs.zIndex = -111;
    //    NSLog(@"%s", __func__);
    
    return attrs;
}


-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSArray *superArray=[super layoutAttributesForElementsInRect: rect];
    NSMutableArray *array=[NSMutableArray arrayWithArray:superArray];
    for (UICollectionViewLayoutAttributes *attr in superArray) {
        if ([attr.representedElementKind isEqualToString:UICollectionElementKindSectionHeader]) {
            [array addObject:[self layoutAttributesForDecorationViewOfKind:@"decorationView" atIndexPath:attr.indexPath top:attr.frame.origin.y]];

        }
    }
    return array;
}






@end
