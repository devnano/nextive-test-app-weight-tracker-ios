#import "WeightTrackerFactory.h"
#import "WeightTrackerSettingsSPO.h"
#import "WeightTrackerSettings.h"
#import "WeightLogSPO.h"
#import "WeightLog.h"
//comment this line to use Sqlite "by hand" implementation
#define SPO


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
#ifndef SPO
	return [WeightTrackerFactory getWeightTrackerSettingsSqlite];
#else
	return [WeightTrackerFactory getWeightTrackerSettingsSPO];
#endif
}



+ (NSObject<WeightLogSupport> *) createWeightLog{
#ifndef SPO	
	return [[WeightLog alloc] initDefaultValues];
#else
	return [[WeightLogSPO alloc] initDefaultValues];
#endif
	
}
+ (Class<WeightLogSupport>) weightLogClass{
#ifndef SPO
	return [WeightLog class];	
#else
	return [WeightLogSPO class];
#endif
}

@end
