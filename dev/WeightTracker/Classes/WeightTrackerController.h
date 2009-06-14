//
//  WeightTrackerController.h
//  WeightTracker
//
//  Created by Mariano Heredia on 6/13/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeightTrackerSettings.h"


@class UserInfoController;
@class MainApplicationController;
@class WeightTrackerSettings;


@interface WeightTrackerController : UIViewController {
	UserInfoController *userInfoController;
	MainApplicationController *mainApplicationController;
	WeightTrackerSettings *weightTrackerSettings;
}

@property (retain, nonatomic) UserInfoController *userInfoController;
@property (retain, nonatomic) MainApplicationController *mainApplicationController;
@property (retain, nonatomic) WeightTrackerSettings *weightTrackerSettings;
-(IBAction) switchViews:(id)sender;
@end
