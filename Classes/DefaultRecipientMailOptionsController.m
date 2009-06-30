//
//  DefaultRecipientMailOptionsController.m
//  WeightTracker
//
//  Created by Mariano Heredia on 6/27/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "DefaultRecipientMailOptionsController.h"
#import "WeightTrackerAppDelegate.h"


@implementation DefaultRecipientMailOptionsController
@synthesize myMailCell, chooseFromContactCell, newContactCell;

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

- (IBAction)showCreateNewContact:(id)sender{
	ABNewPersonViewController *newPerson = [[ABNewPersonViewController alloc] init];
	newPerson.newPersonViewDelegate = self;
	WeightTrackerAppDelegate *delegate =(WeightTrackerAppDelegate *) [[UIApplication sharedApplication] delegate];
	
	[delegate.navSettings pushViewController:newPerson animated:YES];
	[newPerson release];
}

- (void)newPersonViewController:(ABNewPersonViewController *)newPersonViewController didCompleteWithNewPerson:(ABRecordRef)person{
	WeightTrackerAppDelegate *delegate =(WeightTrackerAppDelegate *) [[UIApplication sharedApplication] delegate];
	[delegate.navSettings popViewControllerAnimated:YES];
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
    NSString* name = (NSString *)ABRecordCopyValue(person, 
												   kABPersonFirstNameProperty); 
//    self.firstName.text = name; 
    [name release]; 
	name = (NSString *)ABRecordCopyValue(person, kABPersonLastNameProperty); 
  //  self.lastName.text = name; 
    [name release]; 
    [self dismissModalViewControllerAnimated:YES]; 
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


- (void)dealloc {
    [super dealloc];
}

-(void) initMyMailCell{
	self.myMailCell = [[[UITableViewCell alloc] initWithFrame:CGRectZero] autorelease];
	self.myMailCell.text = @"Use My Mail";
}

-(void) initChooseFromContactCell{
	self.chooseFromContactCell = [[[UITableViewCell alloc] initWithFrame:CGRectZero] autorelease];
	self.chooseFromContactCell.text = @"Choose from contacts";
}
-(void) initNewContactCell{
	self.newContactCell = [[[UITableViewCell alloc] initWithFrame:CGRectZero] autorelease];
	self.newContactCell.text = @"Create new contact";
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
