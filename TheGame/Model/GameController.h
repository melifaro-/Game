//
//  GameController.h
//  TheGame
//
//  Created by Igor Botov on 9/29/13.
//  Copyright (c) 2013 inMixed LLC. All rights reserved.
//

#import "Army.h"
#import "Field.h"

@interface GameController : NSObject
{
    NSInteger   _round;
    Army*       _a1;
    Army*       _a2;
    Field*      _bf;    //battle field
}

- (id)initWithBattleField:(Field*)bf;

- (void)startGame;
- (void)nextRound;
- (void)endGame;

@end
