//
//  DefaultRecipientMailOptionsController.m
//  WeightTracker
//
//  Created by Mariano Heredia on 6/27/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "DefaultRecipientMailOptionsController.h"


@implementation DefaultRecipientMailOptionsController

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
	[self presentModalViewController:newPerson animated:YES];
	[newPerson release];
}

- (void)newPersonViewController:(ABNewPersonViewController *)newPersonViewController didCompleteWithNewPerson:(ABRecordRef)person{	
	[self dismissModalViewControllerAnimated:YES];
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


@end
