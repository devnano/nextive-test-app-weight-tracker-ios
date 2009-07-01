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
#import "WeightTrackerSettingsSupport.h"


@interface DefaultRecipientMailOptionsController : UIViewController <ABPeoplePickerNavigationControllerDelegate, ABNewPersonViewControllerDelegate,
																	 UITableViewDelegate, UITableViewDataSource>{
	UITableViewCell *myMailCell;
	UITableViewCell *chooseFromContactCell;
	UITableViewCell *newContactCell;	
	UIViewController<WeightTrackerSettingsSupport> *caller;

}

@property (nonatomic, retain) UITableViewCell *myMailCell;
@property (nonatomic, retain) UITableViewCell *chooseFromContactCell;
@property (nonatomic, retain) UITableViewCell *newContactCell;
@property (nonatomic, retain) UIViewController<WeightTrackerSettingsSupport> *caller;


- (IBAction)showPicker:(id)sender;
- (IBAction)showCreateNewContact:(id)sender;
//- (void) mailChosen:(NSString *) mailAddress;
@end