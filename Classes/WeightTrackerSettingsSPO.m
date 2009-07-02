
#import "WeightTrackerSettingsSPO.h"





@implementation WeightTrackerSettingsSPO
	DECLARE_PROPERTIES(
				   DECLARE_PROPERTY(@"username", @"@\"NSString\""),
				DECLARE_PROPERTY(@"userMailAddress", @"@\"NSString\""),
				DECLARE_PROPERTY(@"recipientMailAddress", @"@\"NSString\""),
				DECLARE_PROPERTY(@"weightUnitOfMeasure", @"@\"NSInteger\"")
				
	)

@synthesize username, userMailAddress, recipientMailAddress, weightUnitOfMeasure;


- (BOOL) isAppAlreadySetup
{
	return self.username != nil;
}
- (void) setupAppWithUserInfo:(id<WeightTrackerSettingsSupport>) userInfo{	
	self.username = [userInfo username];
	self.userMailAddress = [userInfo userMailAddress];
	self.recipientMailAddress = [userInfo recipientMailAddress];
	self.weightUnitOfMeasure = [userInfo weightUnitOfMeasure];
	[self save];
}

- (void) loadAppUserInfo:(id<WeightTrackerSettingsSupport>) userInfo{
	userInfo.username = self.username;
	userInfo.userMailAddress = self.userMailAddress;
	userInfo.recipientMailAddress = self.recipientMailAddress;
	userInfo.weightUnitOfMeasure = self.weightUnitOfMeasure;
}



@end
