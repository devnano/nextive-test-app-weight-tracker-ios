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


@implementation DefaultRecipientMailOptionsController
@synthesize myMailCell, chooseFromContactCell, newContactCell, caller;

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
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

- (void) mailChosen:(NSString *) mailAddress withFinalAction:(SEL) action{	
	self.caller.recipientMailAddress = mailAddress;	
	//passing the message to finally hide the helper view
	[self performSelector:action];	
}

- (void) hideModalViewController{	
	[self dismissModalViewControllerAnimated:NO]; 	
	WeightTrackerAppDelegate *delegate =(WeightTrackerAppDelegate *) [[UIApplication sharedApplication] delegate];
	
	//[delegate.navSettings popViewControllerAnimated:YES];
	[delegate.navSettings popViewControllerAnimated:YES];
}
- (void) popNavigationViewController{
	WeightTrackerAppDelegate *delegate =(WeightTrackerAppDelegate *) [[UIApplication sharedApplication] delegate];
	
	[delegate.navSettings popViewControllerAnimated:YES];
	
}

- (void) popNavigationToCallerViewController{
	WeightTrackerAppDelegate *delegate =(WeightTrackerAppDelegate *) [[UIApplication sharedApplication] delegate];
	[delegate.navSettings popToViewController:self.caller animated:YES];
	//[delegate.navSettings popViewControllerAnimated:YES];
	
}


- (void) userMailPicked{	
	[self mailChosen: [SystemSettingsAccess defaultMailAddress] withFinalAction:@selector(popNavigationViewController)];
}

- (IBAction)showCreateNewContact:(id)sender{
	ABNewPersonViewController *newPerson = [[ABNewPersonViewController alloc] init];
	newPerson.newPersonViewDelegate = self;
	WeightTrackerAppDelegate *delegate =(WeightTrackerAppDelegate *) [[UIApplication sharedApplication] delegate];
	
	[delegate.navSettings pushViewController:newPerson animated:YES];
	[newPerson release];
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

#pragma mark -
#pragma mark ABNewPersonViewControllerDelegate method



- (void)newPersonViewController:(ABNewPersonViewController *)newPersonViewController didCompleteWithNewPerson:(ABRecordRef)person{	
	if(person == NULL){
		//returning to the caller
		[self popNavigationViewController];	
		return;
	}
	[self mailSelectedFromPerson:person withFinalAction:@selector(popNavigationToCallerViewController)];	
}


- (IBAction)showPicker:(id)sender { 
    ABPeoplePickerNavigationController *picker = 
	[[ABPeoplePickerNavigationController alloc] init]; 
    picker.peoplePickerDelegate = self; 
    [self presentModalViewController:picker animated:YES]; 
    [picker release]; 
} 

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



-(UITableViewCell *) initButtonCell:(NSString *) caption{
	UITableViewCell *cell= [[[UITableViewCell alloc] initWithFrame:CGRectZero] autorelease];
	//note that this is deprecated for 3.0
	cell.text =caption;
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

- (void)dealloc {
	[caller release];
	[myMailCell release];
	[chooseFromContactCell release];
	[newContactCell release];
    [super dealloc];
}



#pragma mark -
#pragma mark UITableViewDataSource methods



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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	return 3;	
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{	
	return @"Recipient email Addres";
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
	return @"Footer";
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
