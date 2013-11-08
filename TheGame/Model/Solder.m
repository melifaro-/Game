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
        _mind = [[Mind alloc] init];
    }
    return self;
}

- (void)doManuever
{
    NSArray* lookAroundInfo = [[Field sharedInstance] lookAround:self];
    
    BOOL moved = NO;
    while (!moved)
    {
        DesicionsType d = [_mind makeDecisionForSolder:self withOtherUnitsInfo:lookAroundInfo];
        
        switch (d) {
            case LeftDirectionDecision:
            {
                moved = [[Field sharedInstance] movingLeft:self];
                break;
            }
            case UpDirectionDecison:
            {
                moved = [[Field sharedInstance] movingUp:self];
                break;
            }
            case RightDirectionDecision:
            {
                moved = [[Field sharedInstance] movingRight:self];
                break;
            }
            case DownDirectionDecision:
            {
                moved = [[Field sharedInstance] movingDown:self];
                break;
            }
            default:
                break;
        }
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

- (void)stepLeft
{
    _position.x -= SPEED;
}

- (void)stepUp
{
    _position.y -= SPEED;
}

- (void)stepRight
{
    _position.x += SPEED;
}

- (void)stepDown
{
    _position.y += SPEED;
}

@end
