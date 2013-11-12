//
//  Mind.h
//  TheGame
//
//  Created by Igor Botov on 9/29/13.
//  Copyright (c) 2013 inMixed LLC. All rights reserved.
//

@class Solder;

typedef enum _decisionVariantsType
{
    LeftDirectionDecision = 0,
    UpDirectionDecison,
    RightDirectionDecision,
    DownDirectionDecision,
    StayOnPlaceDecision,
    DecisionsCount
} DesicionsType;

@interface Mind : NSObject

- (DesicionsType)makeDecisionForSolder:(Solder*)s withOtherUnitsInfo:(NSArray*)units;

@end
