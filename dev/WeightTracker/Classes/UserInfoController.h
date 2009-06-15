//
//  UserInfoController.h
//  WeightTracker
//
//  Created by Mariano Heredia on 6/13/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeightTrackerSettings.h"
#import "WeightTrackerController.h"

@class WeightTrackerController;


@interface UserInfoController : UIViewController {
	UITextField *usernameTextField;	
	WeightTrackerController *weightTrackerController;
}

@property(nonatomic,retain) IBOutlet UITextField * usernameTextField;
@property(readonly) NSString * username;
- (IBAction) saveButtonPressed:(id)sender;
- (IBAction) textFieldDoneEditing:(id)sender;


@property(retain, nonatomic) WeightTrackerController *weightTrackerController;



@end
