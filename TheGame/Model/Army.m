//
//  Army.m
//  TheGame
//
//  Created by Igor Botov on 9/29/13.
//  Copyright (c) 2013 inMixed LLC. All rights reserved.
//

#import "Army.h"
#import "Solder.h"
#import "Field.h"

#define ARMY_QTY 5

@implementation Army

@synthesize solders = _solders,
            color = _color;

- (id)initWithColor:(ColorType)color
{
    if (self = [super init])
    {
        _color = color;
        
        int y = 0;
        if (_color == RedColor)
        {
            y = FIELD_HEIGHT - 1;
        }
        
        NSMutableArray* sa = [[NSMutableArray alloc] init];
        
        int armyQty = color == RedColor ? ARMY_QTY : ARMY_QTY;
        
        for (int i = 0; i < armyQty; i++)
        {
            Solder* s = [[Solder alloc] initWithColor:color atX:i atY:y];
            [sa addObject:s];
            
            [[Field sharedInstance] placeSolder:s];
        }
        _solders = sa;
    }
    return self;
}

- (void)doManuever
{
    for (Solder* s in _solders)
    {
        if ([s isAlive])
        {
            [s doManuever];
        }
    }
}

- (BOOL)isAlive
{
    for (Solder* s in _solders)
    {
        if ([s isAlive])
        {
            return YES;
        }
    }
    return NO;
}

@end
