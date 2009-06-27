

#import "WeightTrackerSettingsFactory.h"
#import "WeightTrackerSettingsSPO.h"


@implementation WeightTrackerSettingsFactory
+ ( id<WeightTrackerSettingsSupport>) createWeightTrackerSettings
{
	//WeightTrackerSettings * settings = [WeightTrackerSettings alloc];
	//[settings init];
	WeightTrackerSettingsSPO * settings = nil;
	settings = (WeightTrackerSettingsSPO *) [WeightTrackerSettingsSPO findByPK:1];
	
	if(settings == nil){
		//settings are not created yet...
		settings = [[[WeightTrackerSettingsSPO alloc] init] autorelease];
	}
	
	return settings;
}

@end
