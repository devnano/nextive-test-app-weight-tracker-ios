//
//  WeightTrackerAppDelegate.h
//  WeightTracker
//
//  Created by Mariano Heredia on 6/28/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeightTrackerSettings.h"

@interface WeightTrackerAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	UINavigationController *navController;
	UINavigationController *navSettings;
	NSObject<WeightTrackerSettingsSupport> *weightTrackerSettings;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navController;
@property (nonatomic, retain) IBOutlet UINavigationController *navSettings;
@property (retain, nonatomic) NSObject<WeightTrackerSettingsSupport> *weightTrackerSettings;
- (IBAction) showAppSettings;
- (IBAction) hideAppSettings;

@end

