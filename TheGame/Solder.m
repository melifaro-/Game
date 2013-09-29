//
//  Solder.m
//  TheGame
//
//  Created by Igor Botov on 9/15/13.
//  Copyright (c) 2013 inMixed LLC. All rights reserved.
//

#import "Solder.h"

@implementation Solder

- (TGInteger)moveLeft
{
    if (self.x - 1 >= 0)
    {
        self.x -= 1;
    }
    return self.x;
}

- (TGInteger)moveUp
{
    if (self.y - 1 >= 0)
    {
        self.y -= 1;
    }
    return self.y;
}

- (TGInteger)moveDown
{
    if (self.y + 1 < SCENA_HEIGHT)
    {
        self.y += 1;
    }
    return self.y;
}

- (TGInteger)moveRight
{
    if (self.x + 1 < SCENA_WIDTH)
    {
        self.x += 1;
    }
    return self.x;
}

@end

@implementation Solder (IPresentable)

- (NSIndexPath*)indexPath
{
    NSIndexPath* indexPath = [NSIndexPath indexPathForRow:self.x + self.y * SCENA_WIDTH inSection:0];
    return indexPath;
}

@end


@implementation Army

- (id)initWithType:(ArmyType)type
{
    if (self = [super init])
    {
        self.type = type;
        
        TGInteger y = self.type * SCENA_HEIGHT - 1;
        y = y > 0 ? y : 0;
        
        Solder* s1 = [[Solder alloc] init];
        s1.army = self;
        s1.x = 0;
        s1.y =  y;
        
        Solder* s2 = [[Solder alloc] init];
        s2.army = self;
        s2.x = 1;
        s2.y = y;
        
        Solder* s3 = [[Solder alloc] init];
        s3.army = self;
        s3.x = 2;
        s3.y = y;
        
        Solder* s4 = [[Solder alloc] init];
        s4.army = self;
        s4.x = 3;
        s4.y = y;
        
        self.solders = [NSArray arrayWithObjects:s1, s2, s3, s4, nil];
        
        self.comander = [[Commander alloc] init];
        self.comander.army = self;
    }
    return self;
}

@end

@implementation Commander

- (void)makeDecisionWithCompletionHandler:(void(^)(void))completionHandler
{
    
}

@end