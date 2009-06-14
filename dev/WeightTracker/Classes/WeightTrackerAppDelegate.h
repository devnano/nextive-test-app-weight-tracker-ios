//
//  WeightTrackerAppDelegate.h
//  WeightTracker
//
//  Created by Mariano Heredia on 6/13/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WeightTrackerController;

@interface WeightTrackerAppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow *window;
	WeightTrackerController *weightTrackerController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet WeightTrackerController *weightTrackerController;

@end
