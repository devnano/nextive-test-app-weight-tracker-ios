//
//  MainApplicationController.m
//  WeightTracker
//
//  Created by Mariano Heredia on 6/13/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "MainApplicationController.h"
#import "Utils.h"

//@class Utils;


@implementation MainApplicationController
@synthesize username;
@synthesize weightTrackerController;

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

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

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
    [super dealloc];
}	

- (IBAction) sendInfoButtonPressed:(id)sender
{
	//UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"sed" message:@"sending" delegate:nil cancelButtonTitle:@"send" otherButtonTitles:nil];
	//[alert show];
	//[alert release];
	//TODO make the parameters flexible enough to take them from the datasource
	[Utils sendMailTo:@"albolocura@gmail.com" withSubject:@"My Weight History" withBody:[NSString stringWithFormat:@"%@ Weight History...", self.username.text]];
}

- (void) viewDidAppear:(BOOL) animated
{
	[super viewDidAppear:animated];
	self.username.text = self.weightTrackerController.weightTrackerSettings.username;
	
}


@end
