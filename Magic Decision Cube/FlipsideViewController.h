//
//  FlipsideViewController.h
//  SettingsViewBase
//
//  Created by Paul Keller on 21/05/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MDCConfig.h"
#import "AppDelegate.h"

@class FlipsideViewController;

@protocol FlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller;
@end

@interface FlipsideViewController : UIViewController

@property (weak, nonatomic) IBOutlet id <FlipsideViewControllerDelegate> delegate;
@property (strong, nonatomic) IBOutlet UISwitch *toggleSwitchVibrate;
@property (strong, nonatomic) IBOutlet UISwitch *toggleSwitchSfx;


- (IBAction)navigateDone:(id)sender;
- (IBAction)switchThrownVibrate:(id)sender;
- (IBAction)switchThrownSfx:(id)sender;


@end
