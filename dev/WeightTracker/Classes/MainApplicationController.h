//
//  MainApplicationController.h
//  WeightTracker
//
//  Created by Mariano Heredia on 6/13/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeightTrackerSettings.h"


@interface MainApplicationController : UIViewController {
	UILabel *username;
	WeightTrackerSettings *weightTrackerSettings;
}


@property(retain, nonatomic) IBOutlet UILabel *username;
@property (retain, nonatomic) WeightTrackerSettings *weightTrackerSettings;
- (IBAction) sendInfoButtonPressed:(id)sender;

@end
