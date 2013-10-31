//
//  ScenaPresenterProtocol.h
//  TheGame
//
//  Created by Igor Botov on 9/16/13.
//  Copyright (c) 2013 inMixed LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Solder.h"
#import "Common.h"

@protocol ScenaPresenterProtocol <NSObject>

- (void)placeSolder:(Solder*)solder;
- (void)renewSolder:(Solder*)solder;
//- (void)moveSolder:(Solder*)solder withCompletionHandler:(void(^)(Solder* solder))completionHandler;

@end

//@protocol MovingProtocol <NSObject>
//
//- (TGInteger)moveLeft;
//- (TGInteger)moveUp;
//- (TGInteger)moveDown;
//- (TGInteger)moveRight;
//
//@end
