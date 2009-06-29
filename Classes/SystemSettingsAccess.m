//
//  SystemSettingsAccess.m
//  WeightTracker
//
//  Created by Mariano Heredia on 6/25/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "SystemSettingsAccess.h"

static NSArray *accounts;

@implementation SystemSettingsAccess

+ (NSArray *) availableMailAccounts

{
	//mocked data
	if(accounts == nil){
		accounts = [[NSArray alloc] initWithObjects:@"albolocura@gmail.com", @"marianoheredia@gmail.com", nil];
	}
	
	//[accounts release];
	
	return accounts;	
}

+ (NSString *) deviceUsername
{
	//mocked data
	return @"Mariano";
}

+ (NSString *) defaultMailAddress{
	return @"albolocura@gmail.com";
}



@end
