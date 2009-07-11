//
//  SystemSettingsAccess.m
//  WeightTracker
//


#import "SystemSettingsAccess.h"

static NSArray *accounts;

@implementation SystemSettingsAccess

+ (NSArray *) availableMailAccounts

{
	//mocked data
	//TODO: retrieve mail accounts from device settings
	if(accounts == nil){
		accounts = [[NSArray alloc] initWithObjects:@"albolocura@gmail.com", @"marianoheredia@gmail.com", nil];
	}
	
	//[accounts release];
	
	return accounts;	
}

+ (NSString *) deviceUsername
{
	//TODO: retrieve username from device settings
	//mocked data
	return @"Mariano";
}

+ (NSString *) defaultMailAddress{
	//TODO: retrieve mail accounts from device settings
	return @"albolocura@gmail.com";
}



@end
