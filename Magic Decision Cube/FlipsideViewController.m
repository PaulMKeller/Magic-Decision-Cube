//
//  FlipsideViewController.m
//  SettingsViewBase
//
//  Created by Paul Keller on 21/05/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FlipsideViewController.h"

@implementation FlipsideViewController

@synthesize delegate = _delegate;
@synthesize toggleSwitchVibrate = _toggleSwitchVibrate;
@synthesize toggleSwitchSfx = _toggleSwitchSfx;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    NSUserDefaults* defaults  = [NSUserDefaults standardUserDefaults];
    
    _toggleSwitchVibrate.on = [defaults boolForKey: K_SWITCH_KEY_VIB];;
    _toggleSwitchSfx.on = [defaults boolForKey: K_SWITCH_KEY_SFX];

    
}

- (void)viewDidUnload
{
    [self setToggleSwitchVibrate:nil];
    [self setToggleSwitchSfx:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    //return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    // Return YES for supported orientations
    //    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    if (interfaceOrientation == UIInterfaceOrientationPortrait) {
        return YES;
    } else {
        return NO;
    }
}

#pragma mark - Actions

- (IBAction)navigateDone:(id)sender {
    [self.delegate flipsideViewControllerDidFinish:self];
}

- (IBAction)switchThrownVibrate:(id)sender {
    NSUserDefaults * defaults  = [NSUserDefaults standardUserDefaults];
    
    [defaults setBool: _toggleSwitchVibrate.on forKey: K_SWITCH_KEY_VIB];
    [defaults synchronize];
}

- (IBAction)switchThrownSfx:(id)sender {
    NSUserDefaults * defaults  = [NSUserDefaults standardUserDefaults];
    
    [defaults setBool: _toggleSwitchSfx.on forKey: K_SWITCH_KEY_SFX];
    [defaults synchronize];
}




@end
