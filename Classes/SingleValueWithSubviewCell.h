//
//  SingleValueWithSubview.h
//  WeightTracker
//
//  Created by Mariano Heredia on 6/29/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SingleValueWithSubviewCell : UITableViewCell {
	UILabel *value;
	UILabel *label;	
}

@property (nonatomic, retain) IBOutlet UILabel *value;
@property (nonatomic, retain) IBOutlet UILabel *label;



@end
