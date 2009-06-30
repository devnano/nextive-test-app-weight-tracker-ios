
#import <Foundation/Foundation.h>
#import "WeightTrackerSettings.h"


@interface WeightTrackerSettingsFactory : NSObject {
	

}

+ (id<WeightTrackerSettingsSupport>) getWeightTrackerSettings;

@end
