//
//  Scena.m
//  TheGame
//
//  Created by Igor Botov on 9/15/13.
//  Copyright (c) 2013 inMixed LLC. All rights reserved.
//

#import "Scena.h"
#import "Solder.h"

@implementation Scena

- (id)init
{
    if (self = [super init])
    {
        self.redArmy = [[Army alloc] initWithType:RedArmy];
        self.whiteArmy = [[Army alloc] initWithType:WhiteArmy];
    }
    
    return self;
}

- (void)startGame
{
    for (Solder* solder in self.redArmy.solders)
    {
        [self.presenter placeSolder:solder];
    }
    
    for (Solder* solder in self.whiteArmy.solders)
    {
        [self.presenter placeSolder:solder];
    }
    
    [self nextStep];
}

- (void)pauseGame
{

}

- (void)endGame
{
    
}

- (void)nextStep
{
    if (_step % CountArmy == RedArmy)
    {
        __block NSArray* soldersInitialy = [self.redArmy.solders copy];
        [self.redArmy.comander makeDecisionWithCompletionHandler:^{
            NSArray* affectedSolders = [soldersInitialy arrayByAddingObjectsFromArray:self.redArmy.solders];
            
            for (Solder* solder in affectedSolders)
            {
                [self.presenter renewSolder:solder];
            }
            
            [self nextStep];
        }];
    }
    else if (_step % CountArmy == WhiteArmy)
    {
        [self.whiteArmy.comander makeDecisionWithCompletionHandler:^{
            [self nextStep];
        }];
    }
    _step++;
}

@end
