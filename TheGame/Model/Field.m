//
//  Field.m
//  TheGame
//
//  Created by Igor Botov on 9/29/13.
//  Copyright (c) 2013 inMixed LLC. All rights reserved.
//

#import "Field.h"
#import "CollectionViewCell.h"
#import "Solder.h"

static Field* __sharedInstance = nil;

@implementation Field

+ (void)initialize
{
    __sharedInstance = [[Field alloc] init];
}

+ (id)sharedInstance
{
    return __sharedInstance;
}

- (id)init
{
    if (self = [super init])
    {
        _units = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)dealloc
{
    _units = nil;
    _view = nil;
}

- (void)addUnit:(Unit*)u
{
    [_units addObject:u];
    [self updateUnit:u];    
}

- (void)removeUnit:(Unit*)u
{
    [_units removeObject:u];
    [self updateUnit:u];
}

- (void)updateUnit:(Unit*)u
{
    [_view reloadItemsAtIndexPaths:[NSArray arrayWithObject:[u indexPath]]];
}

- (void)updateAround:(Unit*)u
{
//    Unit* tmp1 = [[Unit alloc] initWithColor:u.color atX:u.x atY:u.y];
//    [tmp1 moveDown];
//    
//    Unit* tmp2 = [[Unit alloc] initWithColor:u.color atX:u.x atY:u.y];
//    [tmp2 moveUp];
//    
//    Unit* tmp3 = [[Unit alloc] initWithColor:u.color atX:u.x atY:u.y];
//    [tmp3 moveLeft];
//    
//    Unit* tmp4 = [[Unit alloc] initWithColor:u.color atX:u.x atY:u.y];
//    [tmp4 moveRight];
//    
//    [_view reloadItemsAtIndexPaths:[NSArray arrayWithObjects:[u indexPath], [tmp1 indexPath], [tmp2 indexPath], [tmp3 indexPath], [tmp4 indexPath], nil]];
    [_view reloadData];
}

- (NSArray*)lookAround:(Unit*)u
{
    NSMutableArray* lookAroundInfo = [[NSMutableArray alloc] init];
    
    for (Unit* u in _units)
    {
        if (true)
        {
            [lookAroundInfo addObject:u];
        }
    }
    return lookAroundInfo;
}

- (BOOL)moveUnitLeft:(Unit*)u
{
    if ([self checkDestenationX:u.x - u.speed Y:u.y])
    {
        [u moveLeft];
        [self attack:(Solder *)u];
        return YES;
    }
    else
        return NO;
}

- (BOOL)moveUnitUp:(Unit*)u
{
    if ([self checkDestenationX:u.x Y:u.y - u.speed])
    {
        [u moveUp];
        [self attack:(Solder *)u];
        return YES;
    }
    else
        return NO;
}

- (BOOL)moveUnitRight:(Unit*)u
{
    if ([self checkDestenationX:u.x + u.speed Y:u.y])
    {
        [u moveRight];
        [self attack:(Solder *)u];
        return YES;
    }
    else
        return NO;
}

- (BOOL)moveUnitDown:(Unit*)u
{
    if ([self checkDestenationX:u.x Y:u.y + u.speed])
    {
        [u moveDown];
        [self attack:(Solder *)u];
        return YES;
    }
    else
        return NO;
}

- (BOOL)checkDestenationX:(int)x Y:(int)y
{
    if (x >= 0 && x < FIELD_WIDTH && y >= 0 && y < FIELD_HEIGHT)
    {
        return YES;
    }
    return NO;
}

- (void)attack:(Solder*)u
{
//    for (Solder* s in _units)
//    {
//        if (ABS(s.x - u.x) + ABS(s.y - u.y) < 2 && s.color != u.color && s != u)
//        {
//            [s attackedBySolder:u];
//        }
//    }
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
    
    for (Unit* u in _units)
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
