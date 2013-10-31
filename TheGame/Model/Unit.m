//
//  Unit.m
//  TheGame
//
//  Created by Igor Botov on 9/29/13.
//  Copyright (c) 2013 inMixed LLC. All rights reserved.
//

#import "Unit.h"
#import "Field.h"

@implementation Unit

@synthesize x = _x,
            y = _y,
            color = _color,
            speed = _speed;

- (id)initWithColor:(ColorType)color atX:(int)x atY:(int)y
{
    if (self = [super init])
    {
        _x = x;
        _y = y;
        _color = color;
        _speed = 1;
    }
    return self;
}

- (NSIndexPath*)indexPath
{
    return [NSIndexPath indexPathForItem:_y * FIELD_WIDTH + _x inSection:0];
}

- (BOOL)moveLeft
{
    if (_x - _speed >= 0)
    {
        _x -= _speed;
        return YES;
    }
    else
        return NO;
}

- (BOOL)moveUp
{
    if (_y - _speed >= 0)
    {
        _y -= _speed;
        return YES;
    }
    else
        return NO;
}

- (BOOL)moveRight
{
    if (_x + _speed < FIELD_WIDTH)
    {
        _x += _speed;
        return YES;
    }
    else
        return NO;
}

- (BOOL)moveDown
{
    if (_y + _speed < FIELD_HEIGHT)
    {
        _y += _speed;
        return YES;
    }
    else
        return NO;
}

@end
