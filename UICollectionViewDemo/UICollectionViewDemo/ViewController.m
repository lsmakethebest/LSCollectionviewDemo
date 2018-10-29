//
//  ViewController.m
//
//  Created by liusong on 2018/10/18.
//  Copyright © 2018年 liusong. All rights reserved.
//

#import "ViewController.h"
#import "LSCollectionViewCell.h"
#import "LSCollectionViewLayout.h"
#import "LSCollectionHeaderView.h"
#import "LSCollectionFooterView.h"


@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UICollectionViewFlowLayout *layout=[[LSCollectionViewLayout alloc]init];
    layout.itemSize = CGSizeMake(80, 80);
    layout.headerReferenceSize = CGSizeMake(self.view.bounds.size.width, 90);
    layout.footerReferenceSize = CGSizeMake(self.view.bounds.size.width, 70);
    layout.sectionInset = UIEdgeInsetsMake(0, 30, 0, 30);
    layout.minimumLineSpacing = 20;
    layout.minimumInteritemSpacing = ([UIScreen mainScreen].bounds.size.width - 80 * 3 - 60) / 2;
    
    
    
    UICollectionView *collectionView=[[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
    collectionView.backgroundColor=[[UIColor blackColor] colorWithAlphaComponent:0.7];
    [collectionView registerClass:[LSCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    collectionView.frame=CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    collectionView.delegate=self;
    collectionView.dataSource=self;
    
    [collectionView registerClass:[LSCollectionHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    [collectionView registerClass:[LSCollectionFooterView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footer"];
    [self.view addSubview:collectionView];
    
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 11;
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 10;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LSCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor=[UIColor orangeColor];
    cell.label.text=[NSString stringWithFormat:@"%ld",indexPath.item];
    return cell;
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        LSCollectionHeaderView *header=[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
        header.label.text=[NSString stringWithFormat:@"header %ld",indexPath.item];
        return header;
    }else{
        LSCollectionFooterView *footer=[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footer" forIndexPath:indexPath];
        footer.label.text=[NSString stringWithFormat:@"footer %ld",indexPath.item];
        return footer;
    }
    
}


@end
