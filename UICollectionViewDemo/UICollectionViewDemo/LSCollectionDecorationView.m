


//
//  LSCollectionDecorationView.m
//  fsdjlkfjlfjdslk
//
//  Created by liusong on 2018/10/22.
//  Copyright © 2018年 liusong. All rights reserved.
//

#import "LSCollectionDecorationView.h"

@implementation LSCollectionDecorationView



-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        self.backgroundColor=[UIColor yellowColor];
        UILabel *label=[[UILabel alloc]init];
        label.textAlignment=NSTextAlignmentCenter;
        label.font=[UIFont systemFontOfSize:30];
        [self addSubview:label];
        self.label=label;
    }
    return self;
}
//-(void)layoutSubviews
//{
//    [super layoutSubviews];
//    self.label.frame=self.bounds;
//}
- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes {
    [super applyLayoutAttributes:layoutAttributes];
    self.label.text=[NSString stringWithFormat:@"%ld",layoutAttributes.indexPath.section];
    self.label.frame = CGRectMake(10, 10, layoutAttributes.frame.size.width - 20, layoutAttributes.frame.size.height);
}

@end
