#import "WeightTrackerFactory.h"
#import "WeightTrackerSettingsSPO.h"
#import "WeightTrackerSettings.h"
#import "WeightLogSPO.h"


@implementation WeightTrackerFactory

/**
WeightTrackerSettingsSPO shared instance.
 */
static NSObject<WeightTrackerSettingsSupport> *settings;


+ ( NSObject<WeightTrackerSettingsSupport> *) getWeightTrackerSettingsSPO{
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

+ ( NSObject<WeightTrackerSettingsSupport> *) getWeightTrackerSettingsSqlite{
	//refreshing the settings every time that the method gets called	
	settings = (WeightTrackerSettings *) [[WeightTrackerSettings alloc]init];	
	
	return settings;
}


+ ( NSObject<WeightTrackerSettingsSupport> *) getWeightTrackerSettings
{
	return [WeightTrackerFactory getWeightTrackerSettingsSqlite];
	//return [WeightTrackerFactory getWeightTrackerSettingsSPO];
}



+ (NSObject<WeightLogSupport> *) createWeightLog{
	return [[WeightLogSPO alloc] initDefaultValues];
}
+ (Class<WeightLogSupport>) weightLogClass{
	return [WeightLogSPO class];
}

@end
