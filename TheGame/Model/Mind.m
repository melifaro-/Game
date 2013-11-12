//
//  Mind.m
//  TheGame
//
//  Created by Igor Botov on 9/29/13.
//  Copyright (c) 2013 inMixed LLC. All rights reserved.
//

#import "Mind.h"
#import "Solder.h"

@implementation Mind

- (DesicionsType)makeDecisionForSolder:(Solder*)s withOtherUnitsInfo:(NSArray*)units
{
    BOOL decisionMade = NO;
    DesicionsType d;
    
//    while (!decisionMade)
    {
        decisionMade = YES;
        d = random() % DecisionsCount;
        
        int fx = s.position.x;
        int fy = s.position.y;
        
        switch (d) {
            case LeftDirectionDecision:
            {
                fx -= SPEED;
                break;
            }
            case UpDirectionDecison:
            {
                fy -= SPEED;
                break;
            }
            case RightDirectionDecision:
            {
                fx += SPEED;
                break;
            }
            case DownDirectionDecision:
            {
                fy += SPEED;
                break;
            }
            default:
                break;
        }
        
        for (Unit* u in units)
        {
            if (u.position.x == fx && u.position.y == fy)
            {
                decisionMade = NO;
                break;
            }
        }
    }
    
    return d;
}

@end
