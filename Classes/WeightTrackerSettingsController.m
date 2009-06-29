//
//  WeightTrackerSettings.m
//  WeightTracker
//
//  Created by Mariano Heredia on 6/28/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "WeightTrackerSettingsController.h"
#import "EditableCell.h"
#import "WeightTrackerAppDelegate.h"

@implementation WeightTrackerSettingsController
@dynamic weightTrackerSettings, username, userMailAddress;
@synthesize usernameCell;

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

- (id<WeightTrackerSettingsSupport>) weightTrackerSettings{
	WeightTrackerAppDelegate *delegate = (WeightTrackerAppDelegate *) [[UIApplication sharedApplication] delegate];
	return delegate.weightTrackerSettings;
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	//initialize ui with current data
	if([self.weightTrackerSettings isAppAlreadySetup]){
		[self.weightTrackerSettings loadAppUserInfo:self];
	} else {
		loadSystemSettingsDefaults(self);
	}
	//title for this controller, useful when the navigation bar title
	self.title = @"Settings";
    [super viewDidLoad];
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
	//[weightTrackerSettings release];
	[usernameCell release];
    [super dealloc];
}


- (NSString *) username{
//	return [self.usernameTextField text];
	return self.usernameCell.value.text;
}

- (void) initUsernameCell{
	EditableCell *cell;
	NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"EditableCell" 
												 owner:self options:nil];
	
#ifdef __IPHONE_2_1
	cell = (EditableCell *)[nib objectAtIndex:0];
#else
	cell = (EditableCell *)[nib objectAtIndex:1];
#endif
	cell.label.text = @"Username";
	//cell.value.text = self.username;;
	self.usernameCell = cell;	
	//[cell release];
}

-(void) setUsername:(NSString *) username{
//	self.usernameTextField.text = username;
	if(self.usernameCell == nil){
		[self initUsernameCell];
	}
	self.usernameCell.value.text = username;
}
- (NSString *) userMailAddress{
//	return [self.userMailLabel text];
	return @"mail";
}

- (void) setUserMailAddress:(NSString *) mailAddress{
//	self.userMailLabel.text = mailAddress;
}



- (void) save
{
	//	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"save" message:@"saving" delegate:nil cancelButtonTitle:@"save" otherButtonTitles:nil];
	//	[alert show];
	//	[alert release];
	[self.weightTrackerSettings setupAppWithUserInfo:self];
//	[self.usernameTextField resignFirstResponder];
	//[self.weightTrackerController switchViews:self];	
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	UITableViewCell *cell;
	switch ([indexPath row]) {
		case 0:
		//	cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero] autorelease];
			//if(self.usernameCell == nil){
			//	[self initUsernameCell];				
			//}
			cell = self.usernameCell; 
			//cell.value.text = @"Value";
			break;
		default:
			break;
	}
	return cell;
	
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	return 1;	
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
	return @"Settings";
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
	return @"Footer";
}




@end
