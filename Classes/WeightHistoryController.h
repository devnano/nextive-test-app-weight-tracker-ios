//
//  WeightHistoryController.h
//  WeightTracker
//
//  Created by Mariano Heredia on 7/7/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeightHistory.h"
#import "WeightTrackerViewController.h"

@interface WeightHistoryController : UITableViewController<UITableViewDelegate, UITableViewDataSource> {
	WeightHistory *weightHistory;

}
@property (nonatomic, retain) WeightHistory *weightHistory;
-(id) init;
@end
