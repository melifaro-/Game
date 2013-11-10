//
//  CollectionViewVisualizerImpl.m
//  TheGame
//
//  Created by Igor Botov on 08/11/13.
//  Copyright (c) 2013 inMixed LLC. All rights reserved.
//

#import "CollectionViewVisualizerImpl.h"
#import "CollectionViewCell.h"

typedef struct _Item
{
    Position    position;
    ColorType   color;
    char       text[10];
}Item;

@implementation CollectionViewVisualizerImpl

- (id)init
{
    if (self = [super init])
    {
        _items = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)drawText:(NSString*)text onColor:(ColorType)color atPositionImpl:(Position)p
{
    switch (color)
    {
        case RedColor:
        case WhiteColor:
        {
            Item i;
            i.position = p;
            i.color = color;
            NSRange range;
            range.location = 0;
            range.length = 10;

            [text getCString:i.text maxLength:10 encoding:NSUTF8StringEncoding];

            NSValue* val = [NSValue valueWithBytes:&i objCType:@encode(Item)];
            [_items addObject:val];
            break;
        }
        default:
        {
            for (NSValue* value in _items)
            {
                Item i;
                [value getValue:&i];
                if (p.x == i.position.x && p.y == i.position.y)
                {
                    [_items removeObject:value];
                    break;
                }
            }
        }
    }
//    assert(_items.count != 11);
    [_view reloadData];
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
    
    Item currentItem;
    
    for (NSValue* value in _items)
    {
        Item i;
        [value getValue:&i];
        if (indexPath.row == [self indexPathForItem:i].row)
        {
            currentItem = i;
            break;
        }
    }
    
    switch (currentItem.color)
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
    
    [cell.statusLabel setText:[NSString stringWithFormat:@"%@", [NSString stringWithUTF8String:currentItem.text]]];
    
    return cell;
}

- (NSIndexPath*)indexPathForItem:(Item)item
{
    return [NSIndexPath indexPathForItem:item.position.y * FIELD_WIDTH + item.position.x  inSection:0];
}


@end
