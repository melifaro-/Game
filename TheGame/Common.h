//
//  Common.h
//  TheGame
//
//  Created by Igor Botov on 9/16/13.
//  Copyright (c) 2013 inMixed LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NSInteger TGInteger;

#define FIELD_HEIGHT    10
#define FIELD_WIDTH     10

#define ATTACK_R        2
#define LOOK_AROUND_R   5

typedef enum _color {
    EmptyColor = 0,
    RedColor,
    WhiteColor,
    CountOfColors
} ColorType;