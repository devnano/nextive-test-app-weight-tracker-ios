//
//  WeightTrackerSettings.h
//  WeightTracker
//
//  Created by Mariano Heredia on 6/28/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeightTrackerSettings.h"
#import "UserMailPickerContoller.h"
#import "DefaultRecipientMailOptionsController.h"
#import "WeightTrackerViewController.h"

@interface WeightTrackerSettingsController : UITableViewController<UITableViewDelegate, UITableViewDataSource,
														           WeightTrackerSettingsSupport, UITextFieldDelegate> {
	@private
	UITableViewCell *usernameCell;
	UITableViewCell *userMailAddressCell;
	UITableViewCell *recipientMailAddressCell;
	UITableViewCell *weightUnitOfMeasureCell;
	UserMailPickerContoller *userMailPickerController;
	DefaultRecipientMailOptionsController *defaultRecipientMailOptionsController;
}


@property(nonatomic, retain) UITableViewCell *usernameCell;
@property(nonatomic, retain) UITableViewCell *userMailAddressCell;
@property(nonatomic, retain) UITableViewCell *recipientMailAddressCell;
@property(nonatomic, retain) UITableViewCell *weightUnitOfMeasureCell;
@property(nonatomic, retain) UserMailPickerContoller *userMailPickerController;
@property(nonatomic, retain) DefaultRecipientMailOptionsController *defaultRecipientMailOptionsController;

-(void) save;

@end
