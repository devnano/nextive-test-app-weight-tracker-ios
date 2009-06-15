//
//  MainApplicationController.h
//  WeightTracker
//
//  Created by Mariano Heredia on 6/13/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeightTrackerController.h"


@interface MainApplicationController : UIViewController {
	UILabel *username;
	WeightTrackerController *weightTrackerController;
}


@property(retain, nonatomic) IBOutlet UILabel *username;
@property (retain, nonatomic) WeightTrackerController *weightTrackerController;
- (IBAction) sendInfoButtonPressed:(id)sender;

@end
