//
//  WeightTrackerSettingsSPO.m
//  WeightTracker
//
//  Created by Mariano Heredia on 6/15/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "WeightTrackerSettingsSPO.h"





@implementation WeightTrackerSettingsSPO
	DECLARE_PROPERTIES(
				   DECLARE_PROPERTY(@"username", @"@\"NSString\"")
	)
@synthesize username;


- (BOOL) isAppAlreadySetup
{
	return self.username != nil;
}
- (void) setupAppWithUserInfo:(id) userInfo{
	self.username = [userInfo username];
	[self save];
}
@end
