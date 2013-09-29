//
//  ViewController.h
//  TheGame
//
//  Created by Igor Botov on 9/15/13.
//  Copyright (c) 2013 inMixed LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ScenaPresenterProtocol.h"
#import "Scena.h"

@interface ViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate, ScenaPresenterProtocol, CommanderProtocol>
{
    __weak IBOutlet UICollectionView    *_scenaCollectionView;
    __weak IBOutlet UIView              *_solderControlsView;
    NSMutableArray                      *_solders;
    
    Scena                               *_scena;
}

//- (IBAction)leftTouched:(id)sender;
//- (IBAction)upTouched:(id)sender;
//- (IBAction)downTouched:(id)sender;
//- (IBAction)rightTouched:(id)sender;

@end
