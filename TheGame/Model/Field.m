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
    
    for (Unit* s in _solders)
    {
        if ([self distanceBetweenPoint:u.position andPoint:s.position] <= LOOK_AROUND_R)
        {
            [lookAroundInfo addObject:s];
        }
    }
    
    NSLog(@"lookAroundInfo %@", lookAroundInfo);
    
    return lookAroundInfo;
}


- (BOOL)move:(Solder*)s inDirection:(DesicionsType)desicion
{
    Position nextP = s.position;
    switch (desicion) {
        case LeftDirectionDecision:
        {
            nextP.x -= SPEED;
            break;
        }
        case DownDirectionDecision:
        {
            nextP.y += SPEED;
            break;
        }
        case RightDirectionDecision:
        {
            nextP.x += SPEED;
            break;
        }
        case UpDirectionDecison:
        {
            nextP.y -= SPEED;
            break;
        }
        default:
            break;
    }

    BOOL rval;
    if ([self checkPosition:nextP])
    {
        [self.fieldVisualizer moveObject:s toPosition:nextP];
        [s step:desicion];
        rval = YES;
    }
    else
        rval = NO;
    
    [self attack:s];
    
    return rval;
}

- (BOOL)checkPosition:(Position)p
{
    if (p.x >= 0 && p.x < FIELD_WIDTH && p.y >= 0 && p.y < FIELD_HEIGHT)
    {
        for (Unit* u in _solders)
        {
            if (u.position.x == p.x && u.position.y == p.y)
            {
                return NO;
            }
        }
        return YES;
    }
    return NO;
}

- (void)attack:(Solder*)u
{
    for (Solder* s in _solders)
    {
        if ([self distanceBetweenPoint:s.position andPoint:u.position] < ATTACK_R  && s.color != u.color && s != u)
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

- (double)distanceBetweenPoint:(Position)a andPoint:(Position)b
{
    return sqrt(pow(a.x - b.x, 2) + pow(a.y - b.y, 2));
}

@end
