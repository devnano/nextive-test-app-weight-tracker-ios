//
//  WeightTrackerSettings.h
//  WeightTracker
//
//  Created by Mariano Heredia on 6/28/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeightTrackerSettings.h"
#import "EditableCell.h"
#import "SingleValueWithSubviewCell.h"
#import "UserMailPickerContoller.h"
#import "DefaultRecipientMailOptionsController.h"
#import "SegmentedFieldCell.h"


@interface WeightTrackerSettingsController : UITableViewController<UITableViewDelegate, UITableViewDataSource,
														           WeightTrackerSettingsSupport> {
	@private
	//id<WeightTrackerSettingsSupport> weightTrackerSettings;
	EditableCell *usernameCell;
	SingleValueWithSubviewCell *userMailAddressCell;
	SingleValueWithSubviewCell *recipientMailAddressCell;
	SegmentedFieldCell *weightUnitOfMeasureCell;
	UserMailPickerContoller *userMailPickerController;
	DefaultRecipientMailOptionsController *defaultRecipientMailOptionsController;
	

}


@property(readonly, nonatomic) id<WeightTrackerSettingsSupport> weightTrackerSettings;
@property(nonatomic, retain) EditableCell *usernameCell;
@property(nonatomic, retain) SingleValueWithSubviewCell *userMailAddressCell;
@property(nonatomic, retain) SingleValueWithSubviewCell *recipientMailAddressCell;
@property(nonatomic, retain) SegmentedFieldCell *weightUnitOfMeasureCell;
@property(nonatomic, retain) UserMailPickerContoller *userMailPickerController;
@property(nonatomic, retain) DefaultRecipientMailOptionsController *defaultRecipientMailOptionsController;

-(void) save;

@end
