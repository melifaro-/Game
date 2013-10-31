//
//  GameController.m
//  TheGame
//
//  Created by Igor Botov on 9/29/13.
//  Copyright (c) 2013 inMixed LLC. All rights reserved.
//

#import "GameController.h"

#define ROUND_PERIOD 0.25

@implementation GameController

- (id)initWithBattleField:(Field*)bf
{
    if (self = [super init])
    {
        _bf = bf;
    }
    
    return self;
}

- (void)startGame
{
    _a1 = [[Army alloc] initWithColor:RedColor];
    _a2 = [[Army alloc] initWithColor:WhiteColor];
    
    [NSTimer scheduledTimerWithTimeInterval:ROUND_PERIOD target:self selector:@selector(nextRound) userInfo:nil repeats:YES];
}

- (void)nextRound
{
//    if (_round < 20)
    {
        _round++;
        if (_round % 2 == 0)
        {
            [_a1 doManuever];
        }
        else
        {
            [_a2 doManuever];
        }
    }
}

- (void)endGame
{

}

@end
