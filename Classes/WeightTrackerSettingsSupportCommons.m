
#import "WeightTrackerSettingsSupportCommons.h"

@implementation NSObject (WeightTrackerSettingsStorage) 

- (void) setupAppWithUserInfo:(id<WeightTrackerSettingsSupport>) userInfo{		
	id<WeightTrackerSettingsSupport> selfSettings = (id<WeightTrackerSettingsSupport>) self;
	selfSettings.username = [userInfo username];
	selfSettings.userMailAddress = [userInfo userMailAddress];
	selfSettings.recipientMailAddress = [userInfo recipientMailAddress];
	selfSettings.weightUnitOfMeasure = [userInfo weightUnitOfMeasure];
	[selfSettings save];
}

- (void) loadAppUserInfo:(id<WeightTrackerSettingsSupport>) userInfo{
	id<WeightTrackerSettingsSupport> selfSettings = (id<WeightTrackerSettingsSupport>) self;
	userInfo.username = selfSettings.username;
	userInfo.userMailAddress = selfSettings.userMailAddress;
	userInfo.recipientMailAddress = selfSettings.recipientMailAddress;
	userInfo.weightUnitOfMeasure = selfSettings.weightUnitOfMeasure;
}


@end