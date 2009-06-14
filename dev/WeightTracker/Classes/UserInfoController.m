//
//  UserInfoController.m
//  WeightTracker
//
//  Created by Mariano Heredia on 6/13/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "UserInfoController.h"


@implementation UserInfoController
@synthesize usernameTextField;
@synthesize weightTrackerSettings;
@dynamic username;

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
- (IBAction) textFieldDoneEditing:(id)sender
{
	[sender resignFirstResponder];
}
- (IBAction) saveButtonPressed:(id)sender
{
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"save" message:@"saving" delegate:nil cancelButtonTitle:@"save" otherButtonTitles:nil];
	[alert show];
	[alert release];
	[self.weightTrackerSettings setupAppWithUserInfo:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
    [super dealloc];
}

- (NSString *) username{
	return [self.usernameTextField text];
}


@end
