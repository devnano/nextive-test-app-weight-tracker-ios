/*
 *  WeightTrackerSettingsSupport.h
 *  WeightTracker
 *
 *  Created by Mariano Heredia on 6/27/09.
 *  Copyright 2009 __MyCompanyName__. All rights reserved.
 *
 */

#import "SystemSettingsAccess.h"

@protocol WeightTrackerSettingsSupport
- (BOOL) isAppAlreadySetup;	
- (void) setupAppWithUserInfo:(id) userInfo;
- (void) loadAppUserInfo:(id)userInfo;
@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSString *userMailAddress;	
@property (nonatomic, copy) NSString *recipientMailAddress;
@end


static void loadSystemSettingsDefaults(id userInfo){
	[userInfo setUsername:[SystemSettingsAccess deviceUsername]];
	[userInfo setUserMailAddress:[SystemSettingsAccess defaultMailAddress]];	
	//when the app si not already set, it must be empty until the user chose a valid mail from
	//contancts
	[userInfo setRecipientMailAddress:@""];
}

