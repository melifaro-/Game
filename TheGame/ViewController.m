//
//  ViewController.m
//  TheGame
//
//  Created by Igor Botov on 9/15/13.
//  Copyright (c) 2013 inMixed LLC. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    Field* bf = [Field sharedInstance];
    [bf assignUI:_scenaCollectionView];
    _game = [[GameController alloc] initWithBattleField:bf];
    
    [_game startGame];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}
//
//#pragma mark -
//#pragma mark UICollectionView DataSource
//
//- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
//{
//    return SCENA_WIDTH * SCENA_HEIGHT;
//}
//
//// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
//- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    UICollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
//    
//    if(cell)
//    {
//        cell.backgroundColor = [UIColor blackColor];
//        cell.layer.borderWidth = 1;
//        cell.layer.borderColor = [[UIColor darkGrayColor] CGColor];
//    }
//    
//    for (Solder* solder in _solders)
//    {
//        if (indexPath.row == [solder indexPath].row)
//        {
//            switch (solder.army.type)
//            {
//                case RedArmy:
//                     cell.backgroundColor = [UIColor redColor];
//                    break;
//                case WhiteArmy:
//                    cell.backgroundColor = [UIColor whiteColor];
//                    break;
//                    
//                default:
//                    break;
//            }
//        }   
//    }
//    
//    return cell;
//}

#pragma mark -
#pragma mark UICollectionView Delegate



#pragma mark -
#pragma mark Soder Control

//- (IBAction)leftTouched:(id)sender
//{
//    NSIndexPath* prevPosition = [NSIndexPath indexPathForRow:_solder.x + _solder.y * SCENA_WIDTH inSection:0];
//    [_solder moveLeft];
//    NSIndexPath* currentPosition = [NSIndexPath indexPathForRow:_solder.x + _solder.y * SCENA_WIDTH inSection:0];
//    [self updateScena:prevPosition withCurrentPosition:currentPosition];
//}
//
//- (IBAction)upTouched:(id)sender
//{
//    NSIndexPath* prevPosition = [NSIndexPath indexPathForRow:_solder.x + _solder.y * SCENA_WIDTH inSection:0];
//    [_solder moveUp];
//    NSIndexPath* currentPosition = [NSIndexPath indexPathForRow:_solder.x + _solder.y * SCENA_WIDTH inSection:0];
//    [self updateScena:prevPosition withCurrentPosition:currentPosition];
//}
//
//- (IBAction)downTouched:(id)sender
//{
//    NSIndexPath* prevPosition = [NSIndexPath indexPathForRow:_solder.x + _solder.y * SCENA_WIDTH inSection:0];
//    [_solder moveDown];
//    NSIndexPath* currentPosition = [NSIndexPath indexPathForRow:_solder.x + _solder.y * SCENA_WIDTH inSection:0];
//    [self updateScena:prevPosition withCurrentPosition:currentPosition];
//}
//
//- (IBAction)rightTouched:(id)sender
//{
//    NSIndexPath* prevPosition = [NSIndexPath indexPathForRow:_solder.x + _solder.y * SCENA_WIDTH inSection:0];
//    [_solder moveRight];
//    NSIndexPath* currentPosition = [NSIndexPath indexPathForRow:_solder.x + _solder.y * SCENA_WIDTH inSection:0];
//    [self updateScena:prevPosition withCurrentPosition:currentPosition];
//}

//#pragma mark -
//#pragma mark Helper Methods
//
//- (void)updateScena:(NSIndexPath*)prevPosition withCurrentPosition:(NSIndexPath*)currentPosition
//{
//    NSArray* indexPathsOnUpdate = nil;
//    if (currentPosition.row == prevPosition.row)
//    {
//        indexPathsOnUpdate = [NSArray arrayWithObjects:prevPosition, nil];
//    }
//    else
//    {
//        indexPathsOnUpdate = [NSArray arrayWithObjects:prevPosition, currentPosition, nil];
//    }
//    
//    [_scenaCollectionView reloadItemsAtIndexPaths:indexPathsOnUpdate];
//}
//
//#pragma mark -
//#pragma mark Scena Presenter Protocol
//- (void)placeSolder:(Solder*)solder
//{
//    [_solders addObject:solder];
//    
//    [_scenaCollectionView reloadItemsAtIndexPaths:[NSArray arrayWithObject:[solder indexPath]]];
//}
//
//- (void)renewSolder:(Solder *)solder
//{
//    [_scenaCollectionView reloadItemsAtIndexPaths:[NSArray arrayWithObject:[solder indexPath]]];
//}

@end
