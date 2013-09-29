//
//  Scena.h
//  TheGame
//
//  Created by Igor Botov on 9/15/13.
//  Copyright (c) 2013 inMixed LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ScenaPresenterProtocol.h"

@class Army;
@class Solder;

@interface Scena : NSObject
{
    NSInteger   _step;
}

@property Army *redArmy;
@property Army *whiteArmy;

@property __weak id <ScenaPresenterProtocol> presenter;

@property NSMutableArray *objects;

- (void)startGame;
- (void)pauseGame;
- (void)endGame;
- (void)nextStep;

@end