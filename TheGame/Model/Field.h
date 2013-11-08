//
//  Field.h
//  TheGame
//
//  Created by Igor Botov on 9/29/13.
//  Copyright (c) 2013 inMixed LLC. All rights reserved.
//

#import "Solder.h"
#import "FieldVisualizerProtocol.h"

@interface Field : NSObject
{
    NSMutableArray*     _solders;
}

@property (nonatomic, retain) id<FieldVisualizerProtocol> fieldVisualizer;

+ (id)sharedInstance;

- (void)placeSolder:(Solder*)u;
- (void)killSolder:(Solder*)u;


- (BOOL)movingLeft:(Solder*)s;
- (BOOL)movingUp:(Solder*)s;
- (BOOL)movingRight:(Solder*)s;
- (BOOL)movingDown:(Solder*)s;

- (BOOL)checkPosition:(Position)p;
- (NSArray*)lookAround:(Unit*)u;

@end
