

#import "WeightTrackerSettingsFactory.h"
#import "WeightTrackerSettingsSPO.h"


@implementation WeightTrackerSettingsFactory
//shared instance
static WeightTrackerSettingsSPO * settings;

+ ( id<WeightTrackerSettingsSupport>) getWeightTrackerSettings
{
	//WeightTrackerSettings * settings = [WeightTrackerSettings alloc];
	//[settings init];
	if(settings == nil){
		settings = (WeightTrackerSettingsSPO *) [WeightTrackerSettingsSPO findByPK:1];
	
		if(settings == nil){
			//settings are not created yet...
			settings = [[[WeightTrackerSettingsSPO alloc] init] autorelease];
		}
	}
	
	return settings;
}

@end
