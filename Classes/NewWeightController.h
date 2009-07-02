//
//  NewWeightController.h
//  WeightTracker
//
//  Created by Mariano Heredia on 7/2/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeightLogSupport.h"
#import "WeightLogDatePickerController.h"


@interface NewWeightController : UITableViewController<UITableViewDelegate, UITableViewDataSource,WeightLogSupport> {
	
	@private
		NSObject<WeightLogSupport> *weightLog;
		UITableViewCell *weightCell;
		UITableViewCell *dateCell;
		WeightLogDatePickerController *datePickerController;
}

@property(nonatomic, retain) UITableViewCell *weightCell;
@property(nonatomic, retain) UITableViewCell *dateCell;
@property(nonatomic, retain) WeightLogDatePickerController *datePickerController;


@end
