//
//  WeightTrackerSettingsSPO.h
//  WeightTracker
//
//  Created by Mariano Heredia on 6/15/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeightTrackerSettings.h"
#import "SQLitePersistentObject.h"



@interface WeightTrackerSettingsSPO : SQLitePersistentObject<WeightTrackerSettingsSupport> {
	@private
	NSString * username;
}

@end
