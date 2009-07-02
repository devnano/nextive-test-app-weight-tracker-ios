//
//  NewWeightController.h
//  WeightTracker
//
//  Created by Mariano Heredia on 7/2/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface NewWeightController : UITableViewController<UITableViewDelegate, UITableViewDataSource> {
	UITableViewCell *weightCell;
	UITableViewCell *dateCell;

}

@property(nonatomic, retain) UITableViewCell *weightCell;
@property(nonatomic, retain) UITableViewCell *dateCell;

@end
