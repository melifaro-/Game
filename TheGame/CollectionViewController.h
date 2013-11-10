//
//  ViewController.h
//  TheGame
//
//  Created by Igor Botov on 9/15/13.
//  Copyright (c) 2013 inMixed LLC. All rights reserved.
//

#import "GameController.h"

@interface CollectionViewController : UIViewController
{
    __weak IBOutlet UICollectionView    *_scenaCollectionView;
    __weak IBOutlet UIView              *_solderControlsView;
    
    GameController*                     _game;
}

//- (IBAction)leftTouched:(id)sender;
//- (IBAction)upTouched:(id)sender;
//- (IBAction)downTouched:(id)sender;
//- (IBAction)rightTouched:(id)sender;

@end
