
#import "WeightTrackerSettingsSPO.h"





@implementation WeightTrackerSettingsSPO
	DECLARE_PROPERTIES(
				   DECLARE_PROPERTY(@"username", @"@\"NSString\""),
				DECLARE_PROPERTY(@"userMailAddress", @"@\"NSString\""),
				DECLARE_PROPERTY(@"recipientMailAddress", @"@\"NSString\"")	
	)

@synthesize username, userMailAddress, recipientMailAddress;


- (BOOL) isAppAlreadySetup
{
	return self.username != nil;
}
- (void) setupAppWithUserInfo:(id<WeightTrackerSettingsSupport>) userInfo{
	//relying in dynamic binding for data retriving
	//through message send to userInfo id reference
	//Note that a protocol could be adopted if third parties
	//could make use of this as an API, we are "trusing"
	//in our design and know for sure that the methods will be defined
	//at runtime
	self.username = [userInfo username];
	self.userMailAddress = [userInfo userMailAddress];
	self.recipientMailAddress = [userInfo recipientMailAddress];
	[self save];
}

- (void) loadAppUserInfo:(id<WeightTrackerSettingsSupport>) userInfo{
	[userInfo setUsername:self.username];
	[userInfo setUserMailAddress:self.userMailAddress];
	[userInfo setRecipientMailAddress:self.recipientMailAddress];
}



@end
