//
//  FieldVisualizerProtocol.h
//  TheGame
//
//  Created by Igor Botov on 08/11/13.
//  Copyright (c) 2013 inMixed LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Unit.h"

@protocol FieldVisualizerProtocol <NSObject>

- (void)placeObject:(Unit*)obj;
- (void)removeObject:(Unit*)obj;
- (void)moveObject:(Unit*)obj toPosition:(Position)p;

@end
