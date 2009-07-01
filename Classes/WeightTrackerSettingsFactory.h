
#import <Foundation/Foundation.h>
#import "WeightTrackerSettings.h"


@interface WeightTrackerSettingsFactory : NSObject {
	

}

+ ( NSObject<WeightTrackerSettingsSupport> *) getWeightTrackerSettings;

@end
