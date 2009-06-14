//
//  WeightTrackerAppDelegate.m
//  WeightTracker
//
//  Created by Mariano Heredia on 6/13/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "WeightTrackerAppDelegate.h"
#import "WeightTrackerController.h"

@implementation WeightTrackerAppDelegate

@synthesize window;
@synthesize weightTrackerController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    

    // Override point for customization after application launch
	[window addSubview:weightTrackerController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [window release];
	[weightTrackerController release];
    [super dealloc];
}


@end
