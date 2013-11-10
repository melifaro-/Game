//
//  RawDrawingViewController.h
//  TheGame
//
//  Created by Igor Botov on 09/11/13.
//  Copyright (c) 2013 inMixed LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameController.h"

@interface RawDrawingViewController : UIViewController
{
    __weak IBOutlet UIImageView*    _imageView;
    GameController*                 _game;
}

@end
