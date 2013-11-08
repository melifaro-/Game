//
//  CollectionViewVisualizerImpl.m
//  TheGame
//
//  Created by Igor Botov on 08/11/13.
//  Copyright (c) 2013 inMixed LLC. All rights reserved.
//

#import "CollectionViewVisualizerImpl.h"
#import "CollectionViewCell.h"

@implementation CollectionViewVisualizerImpl

- (id)init
{
    if (self = [super init])
    {
        _items = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)drawColor:(ColorType)color atPositionImpl:(Position)p
{
    switch (color)
    {
        case RedColor:
        case WhiteColor:
        {

            break;
        }
        default:
        {

        }
    }
}


- (void)assignUI:(UICollectionView*)view
{
    _view = view;
    _view.delegate = self;
    _view.dataSource = self;
}


#pragma mark -
#pragma mark UICollectionView DataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return FIELD_HEIGHT * FIELD_WIDTH;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    if(cell)
    {
        cell.backgroundColor = [UIColor blackColor];
        cell.layer.borderWidth = 1;
        cell.layer.borderColor = [[UIColor darkGrayColor] CGColor];
    }
    
    Unit* currentUnit = nil;
    
    for (Unit* u in _items)
    {
        if (indexPath.row == [u indexPath].row)
        {
            currentUnit = u;
            break;
        }
    }
    
    if (currentUnit)
    {
        switch (currentUnit.color)
        {
            case RedColor:
                cell.backgroundColor = [UIColor redColor];
                break;
            case WhiteColor:
                cell.backgroundColor = [UIColor whiteColor];
                break;
                
            default:
                break;
        }
        
        [cell.statusLabel setText:[NSString stringWithFormat:@"%@", currentUnit]];
    }
    
    return cell;
}


@end
