//
//  WeightTrackerViewController.m
//  WeightTracker
//
//  Created by Mariano Heredia on 7/10/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "WeightTrackerViewController.h"


@implementation UIViewController (WeightTrackerViewController) 
@dynamic navSettings, navMainApp;




- (WeightTrackerAppDelegate *) weightTrackerAppDelegate{
	return (WeightTrackerAppDelegate *) [[UIApplication sharedApplication] delegate];
}
-(NSObject<WeightTrackerSettingsSupport> *) settings{
	return [[self weightTrackerAppDelegate] weightTrackerSettings];
}

-(UINavigationController *) navSettings{
	return [self weightTrackerAppDelegate].navSettings;	
}

-(UINavigationController *) navMainApp{
	return [self weightTrackerAppDelegate].navController;	
}



@end
