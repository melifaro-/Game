//
//  Field.h
//  TheGame
//
//  Created by Igor Botov on 9/29/13.
//  Copyright (c) 2013 inMixed LLC. All rights reserved.
//

#import "Unit.h"

@interface Field : NSObject <UICollectionViewDataSource, UICollectionViewDelegate>
{
    NSMutableArray*     _units;
    UICollectionView*   _view;
}

+ (id)sharedInstance;

- (void)addUnit:(Unit*)u;
- (void)removeUnit:(Unit*)u;
- (void)updateUnit:(Unit*)u;
- (void)updateAround:(Unit*)u;

- (BOOL)moveUnitLeft:(Unit*)u;
- (BOOL)moveUnitUp:(Unit*)u;
- (BOOL)moveUnitRight:(Unit*)u;
- (BOOL)moveUnitDown:(Unit*)u;

- (BOOL)checkDestenationX:(int)x Y:(int)y;

- (NSArray*)lookAround:(Unit*)u;

- (void)assignUI:(UICollectionView*)view;

@end
