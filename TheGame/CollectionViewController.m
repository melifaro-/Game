//
//  ViewController.m
//  TheGame
//
//  Created by Igor Botov on 9/15/13.
//  Copyright (c) 2013 inMixed LLC. All rights reserved.
//

#import "CollectionViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "FieldVisualizer.h"
#import "CollectionViewVisualizerImpl.h"

@interface CollectionViewController ()

@end

@implementation CollectionViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    Field* bf = [Field sharedInstance];
    
    FieldVisualizer* fv = [[FieldVisualizer alloc] init];
    
    CollectionViewVisualizerImpl* collectionViewVisualizer = [[CollectionViewVisualizerImpl alloc] init];
    [collectionViewVisualizer assignUI:_scenaCollectionView];
    
    [bf setFieldVisualizer:fv];
    
    [fv setVisualizerImpl:collectionViewVisualizer];
    
    _game = [[GameController alloc] initWithBattleField:bf];
    
    [_game startGame];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}


@end
