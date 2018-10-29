


//
//  LSCollectionViewCell.m
//  fsdjlkfjlfjdslk
//
//  Created by liusong on 2018/10/22.
//  Copyright © 2018年 liusong. All rights reserved.
//

#import "LSCollectionViewCell.h"

@implementation LSCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        UILabel *label=[[UILabel alloc]init];
        [self addSubview:label];
        self.label=label;
    }
    return self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    self.label.frame=self.bounds;
}
@end
