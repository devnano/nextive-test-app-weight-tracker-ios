#import "WeightTrackerAppDelegate.h"
#import "WeightTrackerFactory.h"
#import "WeightTrackerSettingsController.h"

@interface WeightTrackerAppDelegate ()

-(void) showAppSettings:(BOOL) animated;

@end


@implementation WeightTrackerAppDelegate

@synthesize window, navController, navSettings, weightTrackerSettings;

#pragma mark -
#pragma mark Overriden parent callbacks


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    // Override point for customization after application launch
	self.weightTrackerSettings = [WeightTrackerFactory getWeightTrackerSettings];
	
	[window addSubview: navController.view];
	if(![self.weightTrackerSettings isAppAlreadySetup]){
		//No need to do an animated transition, the settings view should
		//be the first one to be shown
		[self showAppSettings : NO];
	}
	
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [window release];
	[navController release];
	[weightTrackerSettings release];
    [super dealloc];
}

#pragma mark -
#pragma mark WeightTrackerAppDelegate methods

- (IBAction) showAppSettings{
	[self showAppSettings : YES];
}

- (IBAction) hideAppSettings{
	WeightTrackerSettingsController *settingsController =(WeightTrackerSettingsController *) [navSettings topViewController];
	//saving the state of the settings view
	
	[settingsController save];
	//NOTE no need the line below (refreshing saved settings)
	//self.weightTrackerSettings = [WeightTrackerFactory getWeightTrackerSettings];
	//hiding modal shown settings controller
	[navController dismissModalViewControllerAnimated:YES];	
}


-(void) showAppSettings:(BOOL) animated{
	//initialize ui with current data (if already setup)
	//or system data otherwise	
	WeightTrackerSettingsController *settingsController = (WeightTrackerSettingsController *) [navSettings topViewController];
	if([self.weightTrackerSettings isAppAlreadySetup]){
		[self.weightTrackerSettings loadAppUserInfo:settingsController];
	} else {
		loadSystemSettingsDefaults(settingsController);
	}
	//present in modal way the navSettigns controller.
	[navController presentModalViewController:navSettings animated:animated];
}


@end
