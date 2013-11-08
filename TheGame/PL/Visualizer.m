//
//  Visualizer.m
//  TheGame
//
//  Created by Igor Botov on 08/11/13.
//  Copyright (c) 2013 inMixed LLC. All rights reserved.
//

#import "Visualizer.h"

@implementation Visualizer

- (void)drawText:(NSString*)text onColor:(ColorType)color atPosition:(Position)p
{
    assert(self.visualizerImpl);
    [self.visualizerImpl drawText:text onColor:color atPositionImpl:p];
}

@end
