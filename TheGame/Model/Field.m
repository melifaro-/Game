//
//  Field.m
//  TheGame
//
//  Created by Igor Botov on 9/29/13.
//  Copyright (c) 2013 inMixed LLC. All rights reserved.
//

#import "Field.h"
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
        _solders = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)dealloc
{
    _solders = nil;
    self.fieldVisualizer = nil;
}

- (void)placeSolder:(Solder*)s
{
    [_solders addObject:s];
    [self.fieldVisualizer placeObject:s];
}

- (void)killSolder:(Solder*)s
{
    [_solders removeObject:s];
    [self.fieldVisualizer removeObject:s];
}

- (NSArray*)lookAround:(Unit*)u
{
    NSMutableArray* lookAroundInfo = [[NSMutableArray alloc] init];
    
    for (Unit* u in _solders)
    {
        if (true)
        {
            [lookAroundInfo addObject:u];
        }
    }
    return lookAroundInfo;
}

- (BOOL)movingLeft:(Solder*)s
{
    Position nextP = s.position;
    nextP.x -= SPEED;
    BOOL rval = [self moveSolderWithCheck:s toPosition:nextP];
    if (rval)
    {
        [s stepLeft];
        [self attack:s];
    }
    return rval;
}

- (BOOL)movingUp:(Solder*)s
{
    Position nextP = s.position;
    nextP.y -= SPEED;
    BOOL rval = [self moveSolderWithCheck:s toPosition:nextP];
    if (rval)
    {
        [s stepUp];
        [self attack:s];
    }

    return rval;
}

- (BOOL)movingRight:(Solder*)s
{
    Position nextP = s.position;
    nextP.x += SPEED;
    BOOL rval = [self moveSolderWithCheck:s toPosition:nextP];
    if (rval)
    {
        [s stepRight];
        [self attack:s];
    }
    return rval;
}

- (BOOL)movingDown:(Solder*)s
{
    Position nextP = s.position;
    nextP.y += SPEED;
    BOOL rval = [self moveSolderWithCheck:s toPosition:nextP];
    if (rval)
    {
        [s stepDown];
        [self attack:s];
    }
    return rval;
}

- (BOOL)moveSolderWithCheck:(Solder*)s toPosition:(Position)p
{
    if ([self checkPosition:p])
    {
        [self.fieldVisualizer moveObject:s toPosition:p];
        return YES;
    }
    else
        return NO;
}

- (BOOL)checkPosition:(Position)p
{
    if (p.x >= 0 && p.x < FIELD_WIDTH && p.y >= 0 && p.y < FIELD_HEIGHT)
    {
        return YES;
    }
    return NO;
}

- (void)attack:(Solder*)u
{
    for (Solder* s in _solders)
    {
        if (ABS(s.position.x - u.position.x) + ABS(s.position.y - u.position.y) < 3 && s.color != u.color && s != u)
        {
            [s attackedBySolder:u];
            if (![s isAlive])
            {
                [self killSolder:s];
            }
            break;
        }
    }
}

@end
