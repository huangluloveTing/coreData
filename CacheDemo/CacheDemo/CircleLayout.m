//
//  CircleLayout.m
//  CacheDemo
//
//  Created by 黄露 on 2017/1/22.
//  Copyright © 2017年 黄露. All rights reserved.
//

#import "CircleLayout.h"

#define ITEM_SIZE ()

@interface CircleLayout ()

@property (nonatomic ,assign ,readwrite) CGFloat radius;

@property (nonatomic ,assign) CGPoint collectionView_center;

@end
@implementation CircleLayout

- (void)prepareLayout {
    [super prepareLayout];
    
    CGSize collectionSize = self.collectionView.frame.size;
    
    _radius = MIN(collectionSize.height, collectionSize.width) / 2.5;
    
    _collectionView_center = CGPointMake(self.collectionView.frame.size.width / 2, self.collectionView.frame.size.height / 2);
}

- (CGSize) collectionViewContentSize {
    
    return self.collectionView.frame.size;
}

- (nullable UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewLayoutAttributes *att = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    NSInteger cell_count = [self.collectionView numberOfItemsInSection:0];
    
    CGPoint center = CGPointMake(_radius * cosf(M_PI * 2 * indexPath.item / cell_count) + _collectionView_center.x, _radius * sinf(M_PI * 2 * indexPath.item / cell_count) + _collectionView_center.y);
    
    att.center = center;
    
    att.size = CGSizeMake(40, 40);
    
    return att;
}

- (nullable NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSMutableArray *attributes = [NSMutableArray array];
    NSInteger cell_count = [self.collectionView numberOfItemsInSection:0];
    for (int i = 0; i < cell_count; i ++) {
        UICollectionViewLayoutAttributes *att = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
        [attributes addObject:att];
    }
    
    return attributes;
}




@end
