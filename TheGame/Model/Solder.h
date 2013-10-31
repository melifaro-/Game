//
//  Solder.h
//  TheGame
//
//  Created by Igor Botov on 9/15/13.
//  Copyright (c) 2013 inMixed LLC. All rights reserved.
//

#import "Unit.h"
#import "Mind.h"

@interface Solder : Unit
{
    Mind*       _mind;
    NSInteger   _health;
}

- (void)doManuever;
- (BOOL)isAlive;
- (void)attackedBySolder:(Solder*)s;

@end

