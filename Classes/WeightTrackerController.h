//
//  RootViewController.h
//  WeightTracker
//
//  Created by Mariano Heredia on 6/28/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewWeightController.h"
#import "WeightHistoryController.h"


@interface WeightTrackerController : UITableViewController<UITableViewDelegate, UITableViewDataSource> {
@private
	//id<WeightTrackerSettingsSupport> weightTrackerSettings;
	UITableViewCell *newWeightCell;
	UITableViewCell *weightHistoryCell;
	UITableViewCell *shareWeightInfoCell;
	NewWeightController *newWeightController;
	WeightHistoryController *weightHistoryController;

}

@property(nonatomic, retain) UITableViewCell *newWeightCell;
@property(nonatomic, retain) UITableViewCell *weightHistoryCell;
@property(nonatomic, retain) UITableViewCell *shareWeightInfoCell;
@property(nonatomic, retain) NewWeightController *newWeightController;
@property(nonatomic, retain) WeightHistoryController *weightHistoryController;

@end
