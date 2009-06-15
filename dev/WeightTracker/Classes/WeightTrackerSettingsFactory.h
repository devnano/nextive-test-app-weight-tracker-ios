//
//  WeightTrackerSettingsFactory.h
//  WeightTracker
//
//  Created by Mariano Heredia on 6/15/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeightTrackerSettings.h"


@interface WeightTrackerSettingsFactory : NSObject {
	

}

+ (id<WeightTrackerSettingsSupport>) createWeightTrackerSettings;

@end
