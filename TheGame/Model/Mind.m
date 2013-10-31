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
    
    while (!decisionMade)
    {
        decisionMade = YES;
        d = random() % DecisionsCount;
        
        int fx = s.x;
        int fy = s.y;
        
        switch (d) {
            case LeftDirectionDecision:
            {
                fx -= s.speed;
                break;
            }
            case UpDirectionDecison:
            {
                fy -= s.speed;
                break;
            }
            case RightDirectionDecision:
            {
                fx += s.speed;
                break;
            }
            case DownDirectionDecision:
            {
                fy += s.speed;
                break;
            }
            default:
                break;
        }
        
        for (Unit* u in units)
        {
            if (u.x == fx && u.y == fy)
            {
                decisionMade = NO;
                break;
            }
        }
    }
    
    return d;
//    if (s.color == WhiteColor)
//        return DownDirectionDecision;
//    else
//        return UpDirectionDecison;
}

@end
