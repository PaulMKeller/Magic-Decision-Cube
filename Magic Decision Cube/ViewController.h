//
//  ViewController.h
//  Magic Decision Cube
//
//  Created by Paul Keller on 15/05/2012.
//  Copyright (c) 2012 Nutty Cake. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>
#import <AudioToolbox/AudioToolbox.h>
#import "FlipsideViewController.h"
#import "AppDelegate.h"

@interface ViewController : UIViewController <ADBannerViewDelegate, FlipsideViewControllerDelegate>

@property (strong, nonatomic) IBOutlet UILabel *decisionLabel;
@property (strong, nonatomic) IBOutlet ADBannerView *banner;
@property (nonatomic, assign) BOOL bannerIsVisible;
@property (nonatomic, strong) NSArray * decisions;
- (IBAction)foundTap:(id)sender;


- (BOOL)canBecomeFirstResponder;

- (void)createNewDecision;

- (void)resetSpeechBubble:(NSNotification *)notification;

@end
