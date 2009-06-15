//
//  WeightTrackerSettingsFactory.m
//  WeightTracker
//
//  Created by Mariano Heredia on 6/15/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "WeightTrackerSettingsFactory.h"
#import "WeightTrackerSettingsSPO.h"


@implementation WeightTrackerSettingsFactory
+ ( id<WeightTrackerSettingsSupport>) createWeightTrackerSettings
{
	//WeightTrackerSettings * settings = [WeightTrackerSettings alloc];
	//[settings init];
	WeightTrackerSettingsSPO * settings = nil;
	settings = (WeightTrackerSettingsSPO *) [WeightTrackerSettingsSPO findByPK:1];
	
	if(settings == nil){
		//settings are not created yet...
		settings = [[[WeightTrackerSettingsSPO alloc] init] autorelease];
	}
	
	return settings;
}

@end
