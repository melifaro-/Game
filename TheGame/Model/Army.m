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
        for (int i = 0; i < ARMY_QTY; i++)
        {
            Solder* s = [[Solder alloc] initWithColor:color atX:2 * i atY:y];
            [sa addObject:s];
            
            [[Field sharedInstance] addUnit:s];
        }
        _solders = sa;
    }
    return self;
}

- (void)doManuever
{
    for (Solder* s in _solders)
    {
        [s doManuever];
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
