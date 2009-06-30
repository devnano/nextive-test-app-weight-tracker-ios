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


@interface WeightTrackerSettingsController : UITableViewController<UITableViewDelegate, UITableViewDataSource> {
	@private
	//id<WeightTrackerSettingsSupport> weightTrackerSettings;
	EditableCell *usernameCell;
	SingleValueWithSubviewCell *userMailAddressCell;
	UserMailPickerContoller *userMailPickerController;

}


@property(readonly, nonatomic) id<WeightTrackerSettingsSupport> weightTrackerSettings;
@property(nonatomic, retain) EditableCell *usernameCell;
@property(nonatomic, retain) SingleValueWithSubviewCell *userMailAddressCell;
@property(nonatomic, retain) UserMailPickerContoller *userMailPickerController;
@property(nonatomic, copy) NSString * username;
@property(nonatomic, copy) NSString *userMailAddress;

-(void) save;

@end
