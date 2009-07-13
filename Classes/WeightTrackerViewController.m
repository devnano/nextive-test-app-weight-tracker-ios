#import "WeightTrackerViewController.h"


@implementation UIViewController (WeightTrackerViewController) 
@dynamic navSettings, navMainApp, settings, weighningUnitsStr;


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
-(NSString *) weighningUnitsStr{
	return stringForDecimalPlaceAndUnits([self settings].weightUnitOfMeasure, NoDecimalPlaces);
}



@end
