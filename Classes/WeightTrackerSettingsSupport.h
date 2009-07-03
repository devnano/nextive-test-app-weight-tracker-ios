/*
 *  WeightTrackerSettingsSupport.h
 *  WeightTracker
 *
 *  Created by Mariano Heredia on 6/27/09.
 *  Copyright 2009 __MyCompanyName__. All rights reserved.
 *
 */

#import "SystemSettingsAccess.h"
#import "ScaleSupport.h"




@protocol WeightTrackerSettingsSupport
@required
	@property (nonatomic, copy) NSString *username;
	@property (nonatomic, copy) NSString *userMailAddress;	
	@property (nonatomic, copy) NSString *recipientMailAddress;
	@property (nonatomic) WeightUnitsOfMeasure weightUnitOfMeasure;
@optional
	//as the above properties gives complete information, the below
	//accesory methods are tagged as optional
	- (BOOL) isAppAlreadySetup;	
	- (void) setupAppWithUserInfo:(id<WeightTrackerSettingsSupport>) userInfo;
	- (void) loadAppUserInfo:(id<WeightTrackerSettingsSupport>)userInfo;
	//workaround to avoid warnings when releasing id<WeightTrackerSettingsSupport> objects
	//- (void) release;

@end


static void loadSystemSettingsDefaults(id<WeightTrackerSettingsSupport> userInfo){
	userInfo.username = [SystemSettingsAccess deviceUsername];
	userInfo.userMailAddress = [SystemSettingsAccess defaultMailAddress];	
	//when the app si not already set, it must be empty until the user chose a valid mail from
	//contancts
	userInfo.recipientMailAddress=@"";
	userInfo.weightUnitOfMeasure = NotDefined;	
}

