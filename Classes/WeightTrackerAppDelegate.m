//
//  WeightTrackerAppDelegate.m
//  WeightTracker
//
//  Created by Mariano Heredia on 6/28/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "WeightTrackerAppDelegate.h"
#import "WeightTrackerSettingsFactory.h"
#import "WeightTrackerSettingsController.h"

@implementation WeightTrackerAppDelegate

@synthesize window, navController, navSettings, weightTrackerSettings;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    

    // Override point for customization after application launch
	self.weightTrackerSettings = [WeightTrackerSettingsFactory createWeightTrackerSettings];
	
	[window addSubview: navController.view];
	if(![self.weightTrackerSettings isAppAlreadySetup]){
		//if the must not be an animated transition,
		//the showAppSettings must be parametrized with de animation boolean flag
		[self showAppSettings];
	}
	
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [window release];
	[navController release];
	[weightTrackerSettings release];
    [super dealloc];
}


- (IBAction) showAppSettings{
	[navController presentModalViewController:navSettings animated:YES];
}

- (IBAction) hideAppSettings{
	WeightTrackerSettingsController *settingsController =(WeightTrackerSettingsController *) [navSettings topViewController];
	[settingsController save];
	
	[navController dismissModalViewControllerAnimated:YES];	
}


@end
