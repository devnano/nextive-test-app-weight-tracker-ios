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
#import "WeightTrackerSettingsFactory.h"
#import "UIUtils.h"

@implementation WeightTrackerSettingsController
@dynamic weightTrackerSettings, username, userMailAddress, recipientMailAddress;
@synthesize usernameCell, userMailAddressCell, userMailPickerController,
			recipientMailAddressCell, defaultRecipientMailOptionsController;

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

- (WeightTrackerAppDelegate *) weightTrackerAppDelegate{
	return (WeightTrackerAppDelegate *) [[UIApplication sharedApplication] delegate];
}

- (id<WeightTrackerSettingsSupport>) weightTrackerSettings{	
	//accessing shared instance of the app settings
	return [WeightTrackerSettingsFactory getWeightTrackerSettings];
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	[super viewDidLoad];
	//initialize ui with current data
	if([self.weightTrackerSettings isAppAlreadySetup]){
		[self.weightTrackerSettings loadAppUserInfo:self];
	} else {
		loadSystemSettingsDefaults(self);
	}
		
	//title for this controller, useful when the navigation bar title
	self.title = @"Settings";
    
}

- (void) viewWillAppear :(BOOL) animated{
	[super viewWillAppear:animated];
	
	
//	[self.weightTrackerSettings loadAppUserInfo:self];	
}
- (void) viewWillDisappear :(BOOL) animated{
	[super viewWillDisappear:animated];
	[self.usernameCell.value resignFirstResponder];
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
	[userMailAddressCell dealloc];
	[userMailPickerController dealloc];
	[recipientMailAddressCell dealloc];
	[defaultRecipientMailOptionsController dealloc];
	[usernameCell release];
    [super dealloc];
}

/*-(void) setUserMailPickerController:(UserMailPickerContoller *) controller{
	//fulfilling the contract (nonatomic, retain)
	if(self->userMailPickerContoller !=nil){
		//release the old reference
		[self->userMailPickerContoller release];
	}
	self->userMailPickerContoller = controller;
	[controller retain];
}


-(UserMailPickerContoller *)userMailPickerContoller{
	//accessing instance variable to check if has been
	//already intialized
	if(self->userMailPickerContoller == nil){		
		//calling the setter to handle the new controller allocated
		self->userMailPickerContoller = [[UserMailPickerContoller alloc] initWithNibName:@"UserMailPickerView" bundle:nil];
		[self->userMailPickerContoller retain];		
		//[controller retain];
		//[self setUserMailPickerContoller : controller];
		//[controller release];
		self->userMailPickerContoller.caller = self;		
	}
	return self->userMailPickerContoller;
}*/

//***********username field

- (void) initUsernameCell{
	EditableCell *cell = (EditableCell *) [UIUtils loadUIViewFromNib:@"EditableCell" withOwner:self];
	cell.label.text = @"Username";
	//cell.value.text = self.username;;
	self.usernameCell = cell;	
	//[cell release];
}

- (NSString *) username{
//	return [self.usernameTextField text];
	return self.usernameCell.value.text;
}


//this setter method must be called before any call to the getter
-(void) setUsername:(NSString *) username{
//	self.usernameTextField.text = username;
	if(self.usernameCell == nil){
		[self initUsernameCell];
	}
	self.usernameCell.value.text = username;
}

//************** user mail address

- (void) initUserMailAddressCell{
	SingleValueWithSubviewCell *cell = (SingleValueWithSubviewCell *) [UIUtils loadUIViewFromNib:@"SingleValueWithSubview" withOwner:self];
	cell.label.text = @"User mail";
	//cell.value.text = self.username;;
	self.userMailAddressCell = cell;	
	//[cell release];
}
- (NSString *) userMailAddress{
//	return [self.userMailLabel text];
	return self.userMailAddressCell.value.text;
}


//this setter method must be called before any call to the getter
- (void) setUserMailAddress:(NSString *) mailAddress{
//	self.userMailLabel.text = mailAddress;
	if(self.userMailAddressCell == nil){
		[self initUserMailAddressCell];
	}
	self.userMailAddressCell.value.text = mailAddress;
}

- (void) initMailPickerView{
	self.userMailPickerController = [[UserMailPickerContoller alloc] initWithNibName:@"UserMailPickerView" bundle:nil];
	self.userMailPickerController.caller = self;
}

- (void) showMailPickerView{
	//lazy loading userMailPickerController child controller...
	if (self.userMailPickerController == nil){
		[self initMailPickerView];
	}
	//[self.weightTrackerController presentModalViewController:userMailPickerController animated:YES]; 
	//[weightTrackerController genericSwitchViews:self otherView:self.userMailPickerController];
	[[self weightTrackerAppDelegate].navSettings pushViewController:self.userMailPickerController animated:YES];	
}

//***************** recipient mail address

- (void) initRecipientMailAddressCell{
	SingleValueWithSubviewCell *cell = (SingleValueWithSubviewCell *) [UIUtils loadUIViewFromNib:@"SingleValueWithSubview" withOwner:self];
	cell.label.text = @"Recipient mail";
	//cell.value.text = self.username;;
	self.recipientMailAddressCell = cell;	
	//[cell release];
}

- (NSString *) recipientMailAddress{
	return self.recipientMailAddressCell.value.text;
}
//this setter method must be called before any call to the getter
- (void) setRecipientMailAddress:(NSString *) mailAddress{
	if(self.recipientMailAddressCell == nil){
		[self initRecipientMailAddressCell];
	}
	self.recipientMailAddressCell.value.text = mailAddress;
}


- (void) initRecipientMailOptionsView{
	self.defaultRecipientMailOptionsController = [[DefaultRecipientMailOptionsController alloc] initWithNibName:@"DefaultRecipientMailOptions" bundle:nil];
	self.defaultRecipientMailOptionsController.caller = self;
}

- (void) showRecipientMailOptionsView{
	//lazy loading userMailPickerController child controller...
	if (self.defaultRecipientMailOptionsController == nil){
		[self initRecipientMailOptionsView];
	}
	//[self.weightTrackerController presentModalViewController:userMailPickerController animated:YES]; 
	//[weightTrackerController genericSwitchViews:self otherView:self.userMailPickerController];
	[[self weightTrackerAppDelegate].navSettings pushViewController:self.defaultRecipientMailOptionsController animated:YES];	
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

#pragma mark -
#pragma mark UITableViewDataSource methods



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
		case 1:
			cell = self.userMailAddressCell;
			//cell = self.
			break;
		case 2:
			cell = self.recipientMailAddressCell;
			break;
		default:
			break;
	}
	return cell;
	
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	return 3;	
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{	
	return @"Settings";
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
	return @"Footer";
}


#pragma mark -
#pragma mark UITableViewDelegate methods




- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
	switch ([indexPath row]){
		case 1:
			[self showMailPickerView];
			break;
		case 2:
			[self showRecipientMailOptionsView];
			break;
	}
	
}




@end
