//
//  Unit.h
//  TheGame
//
//  Created by Igor Botov on 9/29/13.
//  Copyright (c) 2013 inMixed LLC. All rights reserved.
//

@class Field;

#define SPEED 1

typedef struct Position
{
    int x;
    int y;
} Position;

@interface Unit : NSObject
{
    Position        _position;
    ColorType       _color;
}

@property (nonatomic, assign, readonly) Position position;
@property (nonatomic, assign, readonly) ColorType color;

- (id)initWithColor:(ColorType)color atX:(int)x atY:(int)y;

//TODO: move to category
- (NSIndexPath*)indexPath;

@end
