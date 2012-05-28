//
//  ViewController.m
//  Magic Decision Cube
//
//  Created by Paul Keller on 15/05/2012.
//  Copyright (c) 2012 Nutty Cake. All rights reserved.
//

#import "ViewController.h"
#import "DecisionOM.h"

@implementation ViewController
@synthesize decisionLabel;
@synthesize banner;
@synthesize bannerIsVisible;
@synthesize decisions;


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
    
    decisionLabel.text = @"Ask your question, shake me or tap me, and I'll decide...";
    
    
    
//    decisions = [[NSArray alloc] initWithObjects:@"NO!", @"YES!", @"Ask again later...", @"Outlook looks good!", @"Not this time :0(", @"Are you kidding me?", @"You betcha!", @"Duff man says, whoa yeah!", @"You can't be serious?", @"Not while you've got breath in your lungs...", @"Get outta town!", @"No way dude!", @"YEAH BABY!", @"You are onto a winner!", nil];
    
    DecisionOM * decision1 = [[DecisionOM alloc] init];
    decision1.decisionText = @"NO!";
    decision1.isPositive = NO;
    
    DecisionOM * decision2 = [[DecisionOM alloc] init];
    decision2.decisionText = @"Not this time :0(";
    decision2.isPositive = NO;
    
    DecisionOM * decision3 = [[DecisionOM alloc] init];
    decision3.decisionText = @"Are you kidding me?";
    decision3.isPositive = NO;
    
    DecisionOM * decision4 = [[DecisionOM alloc] init];
    decision4.decisionText = @"You can't be serious?";
    decision4.isPositive = NO;
    
    DecisionOM * decision5 = [[DecisionOM alloc] init];
    decision5.decisionText = @"Not while you have breath in your lungs...";
    decision5.isPositive = NO;
    
    DecisionOM * decision6 = [[DecisionOM alloc] init];
    decision6.decisionText = @"Get outta town!";
    decision6.isPositive = NO;
    
    DecisionOM * decision7 = [[DecisionOM alloc] init];
    decision7.decisionText = @"No way dude!";
    decision7.isPositive = NO;
    
    DecisionOM * decision8 = [[DecisionOM alloc] init];
    decision8.decisionText = @"YES!";
    decision8.isPositive = YES;
    
    DecisionOM * decision9 = [[DecisionOM alloc] init];
    decision9.decisionText = @"Outlook looks good!";
    decision9.isPositive = YES;
    
    DecisionOM * decision10 = [[DecisionOM alloc] init];
    decision10.decisionText = @"You betcha!";
    decision10.isPositive = YES;
    
    DecisionOM * decision11 = [[DecisionOM alloc] init];
    decision11.decisionText = @"Duff man says, whoa yeah!";
    decision11.isPositive = YES;
    
    DecisionOM * decision12 = [[DecisionOM alloc] init];
    decision12.decisionText = @"YEAH BABY!";
    decision12.isPositive = YES;
    
    DecisionOM * decision13 = [[DecisionOM alloc] init];
    decision13.decisionText = @"You are onto a winner!";
    decision13.isPositive = YES;
    
    DecisionOM * decision14 = [[DecisionOM alloc] init];
    decision14.decisionText = @"GO FOR IT!";
    decision14.isPositive = YES;
    
    DecisionOM * decision15 = [[DecisionOM alloc] init];
    decision15.decisionText = @"Ask again later...";
    decision15.isPositive = NO;
    
    decisions = [[NSArray alloc] initWithObjects:decision1, decision2, decision3, decision4, decision5, decision6, decision7, decision8, decision9, decision10, decision11, decision12, decision13, decision14, decision15, nil];
    
    banner.delegate = self;
    banner.frame = CGRectOffset(banner.frame, 0.0, banner.frame.size.height);
    self.bannerIsVisible = NO;
    
    NSUserDefaults * defaults  = [NSUserDefaults standardUserDefaults];
    
    if ([defaults objectForKey: K_SWITCH_KEY_VIB] == nil) {
        [defaults setBool: YES forKey: K_SWITCH_KEY_VIB];
        [defaults synchronize];
    }

    if ([defaults objectForKey: K_SWITCH_KEY_SFX] == nil) {
        [defaults setBool: YES forKey: K_SWITCH_KEY_SFX];
        [defaults synchronize];
    }
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(resetSpeechBubble:) name:UIApplicationDidBecomeActiveNotification object:nil];
}

- (void)viewDidUnload
{
    [self setDecisionLabel:nil];
    [self setBanner:nil];
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
    [self becomeFirstResponder];
    [super viewDidAppear:animated];
    
    decisionLabel.text = @"Ask your question, shake me or tap me, and I'll decide...";
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
//    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    if (interfaceOrientation == UIInterfaceOrientationPortrait) {
        return YES;
//    } else if (interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown) {
//        return YES;
    } else {
        return NO;
    }
}

- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller
{
    [self dismissModalViewControllerAnimated:YES];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showAlternate"]) {
        [[segue destinationViewController] setDelegate:self];
    }
}

#pragma Banner View Methods
- (void)bannerViewDidLoadAd:(ADBannerView *)aBanner {
    if (!self.bannerIsVisible) {
        [UIView beginAnimations:@"animatedAdBannerOn" context:NULL];
        banner.frame = CGRectOffset(banner.frame, 0.0, -banner.frame.size.height);
        [UIView commitAnimations];
        self.bannerIsVisible = YES;
        NSLog(@"Has Ads, showing");
    }
}

- (void)bannerView:(ADBannerView *)aBanner didFailToReceiveAdWithError:(NSError *)error {
    if (self.bannerIsVisible) {
        [UIView beginAnimations:@"animatedAdBannerOff" context:NULL];
        banner.frame = CGRectOffset(banner.frame, 0.0, banner.frame.size.height);
        [UIView commitAnimations];
        self.bannerIsVisible = NO;
        NSLog(@"Has No Ads, Hiding");
    }
}

#pragma ResetSpeech
- (void)resetSpeechBubble:(NSNotification *)notification
{
    decisionLabel.text = @"Ask your question, shake me or tap me, and I'll decide...";
}

#pragma Tap Methods
- (IBAction)foundTap:(id)sender {
    [self createNewDecision];
}

#pragma Shake Methods
 
- (BOOL)canBecomeFirstResponder
{
    return YES;
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if (motion == UIEventSubtypeMotionShake) {
        [self createNewDecision];
    }
}

- (void)createNewDecision
{
    NSInteger decisionNumber;
    decisionNumber = random()%[self.decisions count];
    //NSString *randomDecision = [self.decisions objectAtIndex:decisionNumber];
    
    DecisionOM *randomDecision = [self.decisions objectAtIndex:decisionNumber];
    
    decisionLabel.text = randomDecision.decisionText;
    
    NSUserDefaults* defaults  = [NSUserDefaults standardUserDefaults];
    
    if ([defaults boolForKey: K_SWITCH_KEY_VIB]) {
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
    }
    
    if ([defaults boolForKey: K_SWITCH_KEY_SFX]) {
        
        NSString * decisionSFX;
        if (randomDecision.isPositive) {
            decisionSFX = @"Cheer";
        } else {
            decisionSFX = @"UhOh";
        }
        
        CFBundleRef mainBundle = CFBundleGetMainBundle();
        CFURLRef soundFileURLRef;
        soundFileURLRef = CFBundleCopyResourceURL(mainBundle, (__bridge CFStringRef) decisionSFX, CFSTR("m4a"), NULL);
        
        UInt32 soundID;
        AudioServicesCreateSystemSoundID(soundFileURLRef, &soundID);
        AudioServicesPlaySystemSound(soundID);
    }    
}


@end
