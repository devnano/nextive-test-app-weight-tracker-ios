//
//  RootViewController.h
//  WeightTracker
//
//  Created by Mariano Heredia on 6/28/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface WeightTrackerController : UITableViewController<UITableViewDelegate, UITableViewDataSource> {
@private
	//id<WeightTrackerSettingsSupport> weightTrackerSettings;
	UITableViewCell *newWeightCell;
	UITableViewCell *weightHistoryCell;
	UITableViewCell *shareWeightInfoCell;

}

@property(nonatomic, retain) UITableViewCell *newWeightCell;
@property(nonatomic, retain) UITableViewCell *weightHistoryCell;
@property(nonatomic, retain) UITableViewCell *shareWeightInfoCell;

@end
