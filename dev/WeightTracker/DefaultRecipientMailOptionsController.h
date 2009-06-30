//
//  DefaultRecipientMailOptionsController.h
//  WeightTracker
//
//  Created by Mariano Heredia on 6/27/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AddressBook/AddressBook.h> 
#import <AddressBookUI/AddressBookUI.h> 


@interface DefaultRecipientMailOptionsController : UIViewController <ABPeoplePickerNavigationControllerDelegate, ABNewPersonViewControllerDelegate>{

}

- (IBAction)showPicker:(id)sender;
- (IBAction)showCreateNewContact:(id)sender;

@end
