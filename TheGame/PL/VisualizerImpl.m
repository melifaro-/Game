//
//  VisualizerImpl.m
//  TheGame
//
//  Created by Igor Botov on 08/11/13.
//  Copyright (c) 2013 inMixed LLC. All rights reserved.
//

#import "VisualizerImpl.h"

@implementation VisualizerImpl

- (void)drawColor:(ColorType)color atPositionImpl:(Position)p
{
    //NOTE: abstract function, should be overriden
    assert(false);
}

@end
