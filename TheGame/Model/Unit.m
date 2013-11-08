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

@synthesize position = _position,
            color = _color;

- (id)initWithColor:(ColorType)color atX:(int)x atY:(int)y
{
    if (self = [super init])
    {
        _position.x = x;
        _position.y = y;
        _color = color;
    }
    return self;
}

- (NSIndexPath*)indexPath
{
    return [NSIndexPath indexPathForItem:_position.y * FIELD_WIDTH + _position.x inSection:0];
}

@end
