//
//  EditableCell.h
//  WeightTracker
//
//  Created by Mariano Heredia on 6/28/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface EditableCell : UITableViewCell {
	UITextField *value;
	UILabel *label;

}

@property (nonatomic, retain) IBOutlet UITextField *value;
@property (nonatomic, retain) IBOutlet UILabel *label;

@end
