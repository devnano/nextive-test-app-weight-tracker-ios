//
//  SegementedFieldCell.h
//  WeightTracker
//
//  Created by Mariano Heredia on 7/1/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SegmentedFieldCell : UITableViewCell {
	UILabel *label;	
	UISegmentedControl *segmentedControl;
	NSInteger selectedSegmentIndex;

}
@property(nonatomic, retain) IBOutlet UILabel *label;	
@property(nonatomic, retain) IBOutlet UISegmentedControl *segmentedControl;
@property(nonatomic, assign) NSInteger selectedSegmentIndex;

@end
