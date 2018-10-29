



//
//  LSCollectionFooterView.m
//  fsdjlkfjlfjdslk
//
//  Created by liusong on 2018/10/22.
//  Copyright © 2018年 liusong. All rights reserved.
//

#import "LSCollectionFooterView.h"

@implementation LSCollectionFooterView
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        UILabel *label=[[UILabel alloc]init];
        [self addSubview:label];
        self.label=label;
        self.backgroundColor=[[UIColor whiteColor]colorWithAlphaComponent:0.7];
    }
    return self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    self.label.frame=self.bounds;
}
@end
