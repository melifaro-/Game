//
//  Solder.m
//  TheGame
//
//  Created by Igor Botov on 9/15/13.
//  Copyright (c) 2013 inMixed LLC. All rights reserved.
//

#import "Solder.h"
#import "Field.h"

#define LIVES 5

@implementation Solder

- (id)init
{
    if (self = [super init])
    {
        _health = LIVES;
        _mind = [[Mind alloc] init];
    }
    return self;
}

- (id)initWithColor:(ColorType)color atX:(int)x atY:(int)y
{
    if (self = [super initWithColor:color atX:x atY:y])
    {
        _health = LIVES;
        if (color != RedColor)
            _mind = [[PassiveCollectivismMind alloc] init];
        else
            _mind = [[Mind alloc] init];
    }
    return self;
}

- (void)doManuever
{
    NSArray* lookAroundInfo = [[Field sharedInstance] lookAround:self];
    
    BOOL moved = NO;
//    while (!moved)
    {
        DesicionsType d = [_mind makeDecisionForSolder:self withOtherUnitsInfo:lookAroundInfo];
        moved = [[Field sharedInstance] move:self inDirection:d];
    }
}

- (BOOL)isAlive
{
    return _health > 0;
}

- (void)attackedBySolder:(Solder*)s
{
    //todo: check destantion
    _health--;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%d", _health];
}

- (void)step:(DesicionsType)decision
{
    switch (decision) {
        case LeftDirectionDecision:
        {
            _position.x -= SPEED;
            break;
        }
        case UpDirectionDecison:
        {
            _position.y -= SPEED;
            break;
        }
        case RightDirectionDecision:
        {
            _position.x += SPEED;
            break;
        }
        case DownDirectionDecision:
        {
            _position.y += SPEED;
            break;
        }
        default:
            break;
    }
}

@end
