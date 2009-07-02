//
//  NewWeightController.h
//  WeightTracker
//
//  Created by Mariano Heredia on 7/2/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeightLogSupport.h"


@interface NewWeightController : UITableViewController<UITableViewDelegate, UITableViewDataSource,WeightLogSupport> {
	UITableViewCell *weightCell;
	UITableViewCell *dateCell;
	@private
		NSObject<WeightLogSupport> *weightLog;
}

@property(nonatomic, retain) UITableViewCell *weightCell;
@property(nonatomic, retain) UITableViewCell *dateCell;


@end
