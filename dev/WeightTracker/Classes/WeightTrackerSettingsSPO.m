
#import "WeightTrackerSettingsSPO.h"





@implementation WeightTrackerSettingsSPO
	DECLARE_PROPERTIES(
				   DECLARE_PROPERTY(@"username", @"@\"NSString\""),
				DECLARE_PROPERTY(@"userMailAddress", @"@\"NSString\"")	   
	)
@synthesize username, userMailAddress;


- (BOOL) isAppAlreadySetup
{
	return self.username != nil;
}
- (void) setupAppWithUserInfo:(id) userInfo{
	self.username = [userInfo username];
	self.userMailAddress = [userInfo userMailAddress];
	[self save];
}

- (void) loadAppUserInfo:(id) userInfo{
	[userInfo setUsername:self.username];
	[userInfo setUserMailAddress:self.userMailAddress];
}


@end
