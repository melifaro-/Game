//
//  RawDrawingViewController.m
//  TheGame
//
//  Created by Igor Botov on 09/11/13.
//  Copyright (c) 2013 inMixed LLC. All rights reserved.
//

#import "RawDrawingViewController.h"

#import "FieldVisualizer.h"
#import "RawDrawVisualizerImpl.h"

@interface RawDrawingViewController ()

@end

@implementation RawDrawingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    Field* bf = [Field sharedInstance];
    
    FieldVisualizer* fv = [[FieldVisualizer alloc] init];
    
    RawDrawVisualizerImpl* rawDrawingVisualizer = [[RawDrawVisualizerImpl alloc] init];
    [rawDrawingVisualizer assignUI:_imageView];
    
    [bf setFieldVisualizer:fv];
    
    [fv setVisualizerImpl:rawDrawingVisualizer];
    
    _game = [[GameController alloc] initWithBattleField:bf];
    
    [_game startGame];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
