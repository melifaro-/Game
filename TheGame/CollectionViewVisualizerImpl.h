//
//  CollectionViewVisualizerImpl.h
//  TheGame
//
//  Created by Igor Botov on 08/11/13.
//  Copyright (c) 2013 inMixed LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VisualizerImpl.h"

@interface CollectionViewVisualizerImpl : VisualizerImpl <UICollectionViewDataSource, UICollectionViewDelegate>
{
    UICollectionView*   _view;
    NSMutableArray*     _items;
}

- (void)assignUI:(UICollectionView*)view;

@end
