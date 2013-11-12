//
//  PassiveCollectivismMind.m
//  TheGame
//
//  Created by Igor Botov on 11/11/13.
//  Copyright (c) 2013 inMixed LLC. All rights reserved.
//

#import "PassiveCollectivismMind.h"
#import "Solder.h"
#import "Field.h"

@implementation PassiveCollectivismMind

- (DesicionsType)makeDecisionForSolder:(Solder*)s withOtherUnitsInfo:(NSArray*)units
{
    BOOL decisionMade = NO;
    DesicionsType d;
    
    while (!decisionMade)
    {
        int horizontalDecision = 0;
        int verticalDecision = 0;

        Position center;
        center.x = 0;
        center.y = 0;
        int armyQty = 0;
        for (Unit* u in units)
        {
            if (u.color == s.color)
            {
                center.x += u.position.x;
                center.y += u.position.y;
                armyQty++;
            }
        }
        center.x /= armyQty;
        center.y /= armyQty;
        
//        for (Unit* u in units)
//        {
//            if (u.color == s.color)
//            {
                if (center.x > s.position.x)
                {
                    horizontalDecision++;
                }
                else if (center.x < s.position.x)
                {
                    horizontalDecision--;
                }
                
                if (center.y > s.position.y)
                {
                    verticalDecision++;
                }
                else if (center.y < s.position.y)
                {
                    verticalDecision--;
                }
//            }
//        }
        
        if (verticalDecision == 0 && horizontalDecision == 0)
        {
            d = random() % DecisionsCount;
        }
        else
        {
            if (ABS(verticalDecision) > ABS(horizontalDecision))
            {
                if (verticalDecision > 0)
                {
                    d = UpDirectionDecison;
                }
                else
                {
                    d = DownDirectionDecision;
                }
            }
            else
            {
                if (horizontalDecision > 0)
                {
                    d = RightDirectionDecision;
                }
                else
                {
                    d = LeftDirectionDecision;
                }
            }
        }
        
        for (int i = 0; i < 3; i++)
        {
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
            
            Position p;
            p.x = fx;
            p.y = fy;
            
            if ([[Field sharedInstance] checkPosition:p])
            {
                decisionMade = YES;
                break;
            }
            else
            {
                d = random() % DecisionsCount;
            }
        }
        decisionMade = YES;
        
//  unnecessary
//        for (Unit* u in units)
//        {
//            if (u.position.x == fx && u.position.y == fy)
//            {
//                decisionMade = NO;
//                break;
//            }
//        }
    }
    
    return d;
}

@end
