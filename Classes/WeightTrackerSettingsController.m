//
//  WeightTrackerSettings.m
//  WeightTracker
//
//  Created by Mariano Heredia on 6/28/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "WeightTrackerSettingsController.h"
#import "WeightTrackerAppDelegate.h"
#import "WeightTrackerSettingsFactory.h"
#import "UIUtils.h"

@implementation WeightTrackerSettingsController
@dynamic weightTrackerSettings, username, userMailAddress, recipientMailAddress,weightUnitOfMeasure;
@synthesize usernameCell, userMailAddressCell, userMailPickerController,
			recipientMailAddressCell, defaultRecipientMailOptionsController, weightUnitOfMeasureCell;


//usefull method to access the appdelegate 
- (WeightTrackerAppDelegate *) weightTrackerAppDelegate{
	return (WeightTrackerAppDelegate *) [[UIApplication sharedApplication] delegate];
}

- (id<WeightTrackerSettingsSupport>) weightTrackerSettings{	
	//accessing shared instance of the app settings
	return [WeightTrackerSettingsFactory getWeightTrackerSettings];
}

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
	
	[self.usernameCell.accessoryView resignFirstResponder];
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
	[weightUnitOfMeasureCell dealloc];
	[defaultRecipientMailOptionsController dealloc];
	[usernameCell release];
    [super dealloc];
}


//***********username field
-(void) hideUsernameKeyboard{
	[self.usernameCell.accessoryView resignFirstResponder];
}

- (void) initUsernameCell{
	UITableViewCell *cell= [[[UITableViewCell alloc] initWithFrame:CGRectZero] autorelease];
	cell.selectionStyle = UITableViewCellSelectionStyleNone;
	self.usernameCell = cell;
	
	
	// Main text label
	self.usernameCell.textLabel.text = @"Username";
	// Initializing accessoryView for username (A Text Field)	
	CGRect textRect = CGRectMake(0, 0, 180, 20);
	UITextField *text = [[UITextField alloc] initWithFrame:textRect];
	// Text that will appear as a hint when empty
	text.placeholder = @"Enter your Name";
	text.textAlignment = UITextAlignmentRight;
	//this will suggest the user clearly that the field is editable
	text.clearButtonMode = UITextFieldViewModeAlways;
	//when no text is given, disable done button
	text.enablesReturnKeyAutomatically = YES;
	//the text will give a done button in the keyboard
	text.returnKeyType = UIReturnKeyDone;
	//this methods is the better for names
	text.autocapitalizationType = UITextAutocapitalizationTypeWords;
	//registering the notification for the resign first responder to the text field
	[text addTarget:self action:@selector(hideUsernameKeyboard) forControlEvents:UIControlEventEditingDidEndOnExit];
	
	//setting the text fiedl as de the accessory view for this cell
	usernameCell.accessoryView=text;
	[text release];
}

- (NSString *) username{	
	//note: taking advantage of dynamic binding, and sending
	//a message to the well known textfield view
	return [self.usernameCell.accessoryView text];
}


//this setter method must be called before any call to the getter
-(void) setUsername:(NSString *) username{
//	self.usernameTextField.text = username;
	if(self.usernameCell == nil){
		[self initUsernameCell];
	}
	//note: taking advantage of dynamic binding, and sending
	//a message to the well known textfield view
	[self.usernameCell.accessoryView setText :  username];
}

//************** user mail address

- (void) initUserMailAddressCell{
	self.userMailAddressCell = [UIUtils createCellStyleValue1:@"User mail"];
}
- (NSString *) userMailAddress{
//	return [self.userMailLabel text];
	return self.userMailAddressCell.detailTextLabel.text;
}


//this setter method must be called before any call to the getter
- (void) setUserMailAddress:(NSString *) mailAddress{
//	self.userMailLabel.text = mailAddress;
	if(self.userMailAddressCell == nil){
		[self initUserMailAddressCell];
	}
	self.userMailAddressCell.detailTextLabel.text = mailAddress;
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
	self.recipientMailAddressCell = [UIUtils createCellStyleValue1:@"Recipient mail"];		
}

- (NSString *) recipientMailAddress{
	return self.recipientMailAddressCell.detailTextLabel.text;
}
//this setter method must be called before any call to the getter
- (void) setRecipientMailAddress:(NSString *) mailAddress{
	if(self.recipientMailAddressCell == nil){
		[self initRecipientMailAddressCell];
	}
	self.recipientMailAddressCell.detailTextLabel.text = mailAddress;
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

//****************unit of measure

- (void) initWeightUnitOfMeasureCell{
	SegmentedFieldCell *cell = (SegmentedFieldCell *) [UIUtils loadUIViewFromNib:@"SegmentedFieldCell" withOwner:self];
	cell.label.text = @"Units";
	[cell.segmentedControl setTitle:@"Pounds" forSegmentAtIndex:0];
	[cell.segmentedControl setTitle:@"Kilograms" forSegmentAtIndex:1];
	self.weightUnitOfMeasureCell = cell; 
	
}

- (void) setWeightUnitOfMeasure:(WeightUnitsOfMeasure) units{
	if(self.weightUnitOfMeasureCell == nil){
		[self initWeightUnitOfMeasureCell];
	}
	self.weightUnitOfMeasureCell.segmentedControl.selectedSegmentIndex = units;
}

- (WeightUnitsOfMeasure) weightUnitOfMeasure{
	return self.weightUnitOfMeasureCell.segmentedControl.selectedSegmentIndex;
}



- (void) save
{	
	[self.weightTrackerSettings setupAppWithUserInfo:self];
}

#pragma mark -
#pragma mark UITableViewDataSource methods



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	UITableViewCell *cell;
	switch ([indexPath row]) {
		case 0:	
			cell = self.usernameCell; 			
			break;
		case 1:
			cell = self.userMailAddressCell;			
			break;
		case 2:
			cell = self.recipientMailAddressCell;
			break;
		case 3:
			cell = self.weightUnitOfMeasureCell;
			break;
		default:
			break;
	}
	return cell;
	
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	return 4;	
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{	
	return @"Settings";
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
	return @"Settings can be changed at anytime.";
}


#pragma mark -
#pragma mark UITableViewDelegate methods




- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
	switch ([indexPath row]){
		//case 0:
			//self.usernameCell.editing=YES;
		//	break;
		case 1:
			//the picker view will appear to select one of the available mail addresses
			[self showMailPickerView];
			break;
		case 2:
			//the multiple alternatives to select de recipient mail addres will be shown
			//in the correspondent view
			[self showRecipientMailOptionsView];
			break;		
	}
	
}

@end
