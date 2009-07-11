
#import <Foundation/Foundation.h>
#import "WeightTrackerSettings.h"
#import "WeightLogSupport.h"

@interface WeightTrackerFactory : NSObject {
	
	

}

+ ( NSObject<WeightTrackerSettingsSupport> *) getWeightTrackerSettings;
+ (NSObject<WeightLogSupport> *) createWeightLog;
+ (Class<WeightLogSupport>) weightLogClass;

@end
