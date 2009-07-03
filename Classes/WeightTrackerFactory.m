

#import "WeightTrackerFactory.h"
#import "WeightTrackerSettingsSPO.h"
#import "WeightLogSPO.h"


@implementation WeightTrackerFactory
//shared instance
static WeightTrackerSettingsSPO * settings;

+ ( NSObject<WeightTrackerSettingsSupport> *) getWeightTrackerSettings
{
	//WeightTrackerSettings * settings = [WeightTrackerSettings alloc];
	//[settings init];
	if(settings == nil){
		settings = (WeightTrackerSettingsSPO *) [WeightTrackerSettingsSPO findByPK:1];
	
		if(settings == nil){
			//settings are not created yet...
			//settings = [[[WeightTrackerSettingsSPO alloc] init] autorelease];
			settings = [[WeightTrackerSettingsSPO alloc] init];
		}
	}
	
	return settings;
}

+ (NSObject<WeightLogSupport> *) createWeightLog{
	return [[WeightLogSPO alloc] initDefaultValues];
}

@end
