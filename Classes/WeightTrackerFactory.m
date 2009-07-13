#import "WeightTrackerFactory.h"
#import "WeightTrackerSettingsSPO.h"
#import "WeightLogSPO.h"


@implementation WeightTrackerFactory

/**
WeightTrackerSettingsSPO shared instance.
 */
static WeightTrackerSettingsSPO *settings;


+ ( NSObject<WeightTrackerSettingsSupport> *) getWeightTrackerSettings
{
	//WeightTrackerSettings * settings = [WeightTrackerSettings alloc];
	//[settings init];
	
	//refreshing the settings every time that the method gets called	
	settings = (WeightTrackerSettingsSPO *) [WeightTrackerSettingsSPO findByPK:1];
	
	if(settings == nil){
		settings = [[WeightTrackerSettingsSPO alloc] init];
	}
	//}
	
	return settings;
}

+ (NSObject<WeightLogSupport> *) createWeightLog{
	return [[WeightLogSPO alloc] initDefaultValues];
}
+ (Class<WeightLogSupport>) weightLogClass{
	return [WeightLogSPO class];
}

@end
