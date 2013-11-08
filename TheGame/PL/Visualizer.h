//
//  Visualizer.h
//  TheGame
//
//  Created by Igor Botov on 08/11/13.
//  Copyright (c) 2013 inMixed LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Unit.h"
#import "VisualizerImpl.h"

@interface Visualizer : NSObject

@property (nonatomic, retain) VisualizerImpl* visualizerImpl;

- (void)drawColor:(ColorType)color atPosition:(Position)p;

@end
