//
//  ChooseViewController.m
//  TheGame
//
//  Created by Igor Botov on 09/11/13.
//  Copyright (c) 2013 inMixed LLC. All rights reserved.
//

#import "ChooseViewController.h"

@interface ChooseViewController ()

@end

@implementation ChooseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)collectionVisualizerTouched:(id)sender
{
    [self performSegueWithIdentifier:@"CollectionViewSegue" sender:self];
}

- (IBAction)rawDrawingVisualizerTouched:(id)sender
{
    [self performSegueWithIdentifier:@"RawDrawingSegue" sender:self];
}
@end
