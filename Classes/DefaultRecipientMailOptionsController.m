//
//  DefaultRecipientMailOptionsController.m
//  WeightTracker
//
//  Created by Mariano Heredia on 6/27/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "DefaultRecipientMailOptionsController.h"
#import "WeightTrackerAppDelegate.h"
#import "SystemSettingsAccess.h"
#import "WeightTrackerViewController.h"

@interface DefaultRecipientMailOptionsController ()
	- (void) mailChosen:(NSString *) mailAddress withFinalAction:(SEL) action;
	- (void) mailSelectedFromPerson:(ABRecordRef) person withFinalAction:(SEL) action;
	- (void) hideModalViewController;
	- (void) popNavigationViewController;
	- (void) popNavigationToCallerViewController;
	- (void) userMailPicked;
	-(UITableViewCell *) initButtonCell:(NSString *) caption;
	-(void) initMyMailCell;
	-(void) initChooseFromContactCell;
	-(void) initNewContactCell;
@end


@implementation DefaultRecipientMailOptionsController
@synthesize myMailCell, chooseFromContactCell, newContactCell, caller;


#pragma mark -
#pragma mark Overriden parent callbacks
- (BOOL)shouldAutorotateToInterfaceOrientation: 
(UIInterfaceOrientation)interfaceOrientation { 
    // Return YES for supported orientations 
    return (interfaceOrientation == UIInterfaceOrientationPortrait); 
} 


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
	[caller release];
	[myMailCell release];
	[chooseFromContactCell release];
	[newContactCell release];
    [super dealloc];
}

#pragma mark -
#pragma mark DefaultRecipientMailOptionsController methods


- (IBAction)showCreateNewContact:(id)sender{
	ABNewPersonViewController *newPerson = [[ABNewPersonViewController alloc] init];
	newPerson.newPersonViewDelegate = self;	
	[self.navSettings pushViewController:newPerson animated:YES];
	[newPerson release];
}

- (IBAction)showPicker:(id)sender { 
    ABPeoplePickerNavigationController *picker = 
	[[ABPeoplePickerNavigationController alloc] init]; 
    picker.peoplePickerDelegate = self; 
    [self presentModalViewController:picker animated:YES]; 
    [picker release]; 
} 

- (void) mailChosen:(NSString *) mailAddress withFinalAction:(SEL) action{	
	self.caller.recipientMailAddress = mailAddress;	
	//passing the message to finally hide the helper view
	[self performSelector:action];	
}

- (void) mailSelectedFromPerson:(ABRecordRef) person withFinalAction:(SEL) action{
	CFTypeRef multi = ABRecordCopyValue(person, kABPersonEmailProperty);
	
	NSString *mail=@""; 
	if(ABMultiValueGetCount(multi) > 0){
		//	NSString is “toll-free bridged” with its Core Foundation counterpart, CFString (see CFStringRef)
		mail = (NSString *) ABMultiValueCopyValueAtIndex(multi, 0);
	}
	
	[self mailChosen:mail withFinalAction:action];
	
}

- (void) hideModalViewController{	
	[self dismissModalViewControllerAnimated:NO]; 	
	
	[self.navSettings popViewControllerAnimated:YES];
}
- (void) popNavigationViewController{	
	[self.navSettings popViewControllerAnimated:YES];	
}

- (void) popNavigationToCallerViewController{
	[self.navSettings popToViewController:self.caller animated:YES];	
}

- (void) userMailPicked{	
	[self mailChosen: [SystemSettingsAccess defaultMailAddress] withFinalAction:@selector(popNavigationViewController)];
}

-(UITableViewCell *) initButtonCell:(NSString *) caption{
	UITableViewCell *cell= [[[UITableViewCell alloc] initWithFrame:CGRectZero] autorelease];
	
	//recommended way for 3.0
	cell.textLabel.text = caption;
	[cell setSelectionStyle:UITableViewCellSelectionStyleNone];
	return cell;
}

-(void) initMyMailCell{
	self.myMailCell = [self initButtonCell:@"Use my mail"];
}

-(void) initChooseFromContactCell{
	self.chooseFromContactCell = [self initButtonCell:@"Choose from contacts"];
}
-(void) initNewContactCell{
	self.newContactCell = [self initButtonCell:@"Create new contact"];
}


#pragma mark -
#pragma mark ABPeoplePickerNavigationControllerDelegate methods
- (void)peoplePickerNavigationControllerDidCancel: 
(ABPeoplePickerNavigationController *)peoplePicker { 
    [self dismissModalViewControllerAnimated:YES]; 
} 
- (BOOL)peoplePickerNavigationController: 
(ABPeoplePickerNavigationController *)peoplePicker 
      shouldContinueAfterSelectingPerson:(ABRecordRef)person { 
	[self mailSelectedFromPerson:person withFinalAction: @selector(hideModalViewController)];
    return NO; 
}

- (BOOL)peoplePickerNavigationController: 
(ABPeoplePickerNavigationController *)peoplePicker 
      shouldContinueAfterSelectingPerson:(ABRecordRef)person 
                                property:(ABPropertyID)property 
                              identifier:(ABMultiValueIdentifier)identifier{ 
    return NO; 
}



#pragma mark -
#pragma mark ABNewPersonViewControllerDelegate methods

- (void)newPersonViewController:(ABNewPersonViewController *)newPersonViewController didCompleteWithNewPerson:(ABRecordRef)person{	
	if(person == NULL){
		//returning to the caller
		[self popNavigationViewController];	
		return;
	}
	[self mailSelectedFromPerson:person withFinalAction:@selector(popNavigationToCallerViewController)];	
}


#pragma mark -
#pragma mark UITableViewDataSource methods


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	return 3;	
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{	
	return @"Recipient email Addres";
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
	return @"The selected mail will be used as the recipient when you want to share your weight history.";
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	UITableViewCell *cell;
	switch ([indexPath row]) {
		case 0:
			//cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero] autorelease];
			if(self.myMailCell == nil){
				[self initMyMailCell];				
			}
			cell = self.myMailCell; 
			//cell.value.text = @"Value";
			break;
		case 1:
			if(self.chooseFromContactCell == nil){
				[self initChooseFromContactCell];				
			}
			cell = self.chooseFromContactCell;
			//cell = self.
			break;
		case 2:
			if(self.newContactCell == nil){
				[self initNewContactCell];				
			}
			cell = self.newContactCell;
			break;
		default:
			break;
	}
	return cell;
	
}


#pragma mark -
#pragma mark UITableViewDelegate methods
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
	switch ([indexPath row]){
		case 0:
			[self userMailPicked];
			break;
		case 1:
			//[self showMailPickerView];
			[self showPicker:self];
			break;
		case 2:
			[self showCreateNewContact:self];
			break;
	}
	
}




@end
