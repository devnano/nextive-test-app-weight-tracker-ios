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



@end
