//
//  Army.h
//  TheGame
//
//  Created by Igor Botov on 9/29/13.
//  Copyright (c) 2013 inMixed LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Army : NSObject
{
    NSArray*    _solders;
    ColorType   _color;
}

@property (nonatomic, readonly) NSArray* solders;
@property (nonatomic, readonly) ColorType color;

- (id)initWithColor:(ColorType)color;

- (void)doManuever;
- (BOOL)isAlive;


@end
