//
//  Unit.h
//  TheGame
//
//  Created by Igor Botov on 9/29/13.
//  Copyright (c) 2013 inMixed LLC. All rights reserved.
//

@class Field;

@interface Unit : NSObject
{
    __weak Field*   _field;
    int             _x;
    int             _y;
    ColorType       _color;
    int             _speed;
}

@property (nonatomic, assign, readonly) int x;
@property (nonatomic, assign, readonly) int y;
@property (nonatomic, assign, readonly) ColorType color;
@property (nonatomic, assign, readonly) int speed;

- (id)initWithColor:(ColorType)color atX:(int)x atY:(int)y;

- (NSIndexPath*)indexPath;

- (BOOL)moveLeft;
- (BOOL)moveUp;
- (BOOL)moveRight;
- (BOOL)moveDown;

@end
