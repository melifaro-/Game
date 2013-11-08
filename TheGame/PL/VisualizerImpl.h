//
//  VisualizerImpl.h
//  TheGame
//
//  Created by Igor Botov on 08/11/13.
//  Copyright (c) 2013 inMixed LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Unit.h"

@interface VisualizerImpl : NSObject

- (void)drawColor:(ColorType)color atPositionImpl:(Position)p;

@end
