//
//  UserInfoController.h
//  WeightTracker
//
//  Created by Mariano Heredia on 6/13/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeightTrackerSettings.h"


@interface UserInfoController : UIViewController {
	UITextField *usernameTextField;
	WeightTrackerSettings *weightTrackerSettings;

}

@property(nonatomic,retain) IBOutlet UITextField * usernameTextField;
@property(readonly) NSString * username;
- (IBAction) saveButtonPressed:(id)sender;
@property (retain, nonatomic) WeightTrackerSettings *weightTrackerSettings;



@end
