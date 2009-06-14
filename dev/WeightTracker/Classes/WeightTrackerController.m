//
//  WeightTrackerController.m
//  WeightTracker
//
//  Created by Mariano Heredia on 6/13/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "WeightTrackerController.h"
#import "UserInfoController.h"
#import "MainApplicationController.h"
#import "WeightTrackerSettings.h"


@implementation WeightTrackerController
@synthesize userInfoController;
@synthesize mainApplicationController;
@synthesize weightTrackerSettings;

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	//TODO: see memory managemnt	
	self.weightTrackerSettings = [WeightTrackerSettings alloc];
	[self.weightTrackerSettings init];
	UIViewController *tmpController;
	if(![self.weightTrackerSettings isAppAlreadySetup]){
		//the user info view must by set
		tmpController = [[UserInfoController alloc] initWithNibName:@"UserInfo" bundle: nil];
		self.userInfoController = (UserInfoController *) tmpController;	
		self.userInfoController.weightTrackerSettings = self.weightTrackerSettings;
	} else {
		//the main app view must by set
		tmpController = [[MainApplicationController alloc] initWithNibName:@"MainApplication" bundle:nil];
		self.mainApplicationController = (MainApplicationController *) tmpController;
	}

	[self.view insertSubview:tmpController.view atIndex:0];
	
	[tmpController release];
}

- (IBAction) switchViews:(id)sender
{
	UIViewController *tmpController = nil;
	if(self.mainApplicationController == nil){				
		tmpController = [[MainApplicationController alloc] initWithNibName:@"MainApplication" bundle:nil];
		self.mainApplicationController = (MainApplicationController *) tmpController;		
	} else if(self.userInfoController == nil) {
		tmpController = [[UserInfoController alloc] initWithNibName:@"UserInfo" bundle: nil];
		self.userInfoController = (UserInfoController *) tmpController;
	}
	if(tmpController != nil){
		[tmpController release];
	}
	
	UIViewController *toShow;
	UIViewController *toHide;
	UIViewAnimationTransition transitionType;
	
	if(self.userInfoController.view.superview == nil){
		toShow = userInfoController;
		toHide = mainApplicationController;
		transitionType = UIViewAnimationTransitionFlipFromRight;
	} else {
		toShow = mainApplicationController;
		toHide = userInfoController;
		transitionType = UIViewAnimationTransitionFlipFromLeft;
	}
	
	
	[UIView beginAnimations:@"View Flip" context:nil];
	[UIView setAnimationDuration:1];
	[UIView setAnimationCurve : UIViewAnimationCurveEaseInOut];
	
	[UIView setAnimationTransition : transitionType  forView: self.view cache:YES];
	[toShow viewWillAppear:YES];
	[toHide viewWillDisappear:YES];
	[toHide.view removeFromSuperview];
	[self.view insertSubview:toShow.view atIndex:0];
	[toHide viewDidDisappear:YES];
	[toShow viewDidAppear:YES];
	
	[UIView commitAnimations];
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
	[mainApplicationController release];
	[userInfoController release];
    [super dealloc];
}


@end
