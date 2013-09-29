//
//  Solder.h
//  TheGame
//
//  Created by Igor Botov on 9/15/13.
//  Copyright (c) 2013 inMixed LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Common.h"


typedef enum _armyType {
    RedArmy = 0,
    WhiteArmy,
    CountArmy
} ArmyType;


@class Army;
@class Commander;
@protocol CommanderProtocol;


@interface Solder : NSObject //<MovingProtocol>

@property TGInteger x;
@property TGInteger y;
@property __weak Army* army;

@end

@interface Solder (IPresentable)

- (NSIndexPath*)indexPath;

@end


@interface Army : NSObject

@property NSArray* solders;
@property Commander* comander;
@property ArmyType  type;

- (id)initWithType:(ArmyType)type;

@end


@interface Commander : NSObject

@property __weak Army* army;
@property __weak id <CommanderProtocol> commanderDelegate;

- (void)makeDecisionWithCompletionHandler:(void(^)(void))completionHandler;

@end

@protocol CommanderProtocol <NSObject>

- (void)makeDecisionForArmy:(Army*)army withCompletionHandler:(void(^)(void))completionHandler;

@end
