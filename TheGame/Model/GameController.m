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
    
    _gameTimer = [NSTimer scheduledTimerWithTimeInterval:ROUND_PERIOD target:self selector:@selector(nextRound) userInfo:nil repeats:YES];
}

- (void)nextRound
{
    _round++;
    if (_round % 2 == 0)
    {
        if ([_a1 isAlive])
             [_a1 doManuever];
        else
            [self endGame];
    }
    else
    {
        if ([_a2 isAlive])
            [_a2 doManuever];
        else
            [self endGame];
    }
}

- (void)endGame
{
    [_gameTimer invalidate];
    _gameTimer = nil;
    
    ColorType wonArmyColor = [_a1 isAlive] ? _a1.color : ([_a2 isAlive] ? _a2.color : EmptyColor);
    
    NSString* wonArmyName = nil;
    
    switch (wonArmyColor) {
        case EmptyColor:
            wonArmyName = @"Dead heat";
            break;
        case RedColor:
            wonArmyName = @"Red won";
            break;
        case WhiteColor:
            wonArmyName = @"White won";
            break;
        default:
            break;
    }
    
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"The End" message:wonArmyName delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    [alert show];
}

@end
