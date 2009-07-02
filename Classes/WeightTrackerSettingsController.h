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
#import "SegmentedFieldCell.h"


@interface WeightTrackerSettingsController : UITableViewController<UITableViewDelegate, UITableViewDataSource,
														           WeightTrackerSettingsSupport, UITextFieldDelegate> {
	@private
	//id<WeightTrackerSettingsSupport> weightTrackerSettings;
	UITableViewCell *usernameCell;
	UITableViewCell *userMailAddressCell;
	UITableViewCell *recipientMailAddressCell;
	SegmentedFieldCell *weightUnitOfMeasureCell;
	UserMailPickerContoller *userMailPickerController;
	DefaultRecipientMailOptionsController *defaultRecipientMailOptionsController;
}


@property(readonly, nonatomic) id<WeightTrackerSettingsSupport> weightTrackerSettings;
@property(nonatomic, retain) UITableViewCell *usernameCell;
@property(nonatomic, retain) UITableViewCell *userMailAddressCell;
@property(nonatomic, retain) UITableViewCell *recipientMailAddressCell;
@property(nonatomic, retain) SegmentedFieldCell *weightUnitOfMeasureCell;
@property(nonatomic, retain) UserMailPickerContoller *userMailPickerController;
@property(nonatomic, retain) DefaultRecipientMailOptionsController *defaultRecipientMailOptionsController;

-(void) save;

@end
