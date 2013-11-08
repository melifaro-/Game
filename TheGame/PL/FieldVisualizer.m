//
//  FieldVisualizer.m
//  TheGame
//
//  Created by Igor Botov on 08/11/13.
//  Copyright (c) 2013 inMixed LLC. All rights reserved.
//

#import "FieldVisualizer.h"

@implementation FieldVisualizer

- (void)placeObject:(Unit*)obj
{
    [self drawColor:obj.color atPosition:obj.position];
}

- (void)removeObject:(Unit*)obj
{
    [self drawColor:EmptyColor atPosition:obj.position];
}

- (void)moveObject:(Unit*)obj toPosition:(Position)p
{
    [self drawColor:EmptyColor atPosition:obj.position];
    [self drawColor:obj.color atPosition:p];
}

@end
