
#import <Foundation/Foundation.h>
#import "WeightTrackerSettingsSupport.h"
#import "SQLitePersistentObject.h"



@interface WeightTrackerSettingsSPO : SQLitePersistentObject<WeightTrackerSettingsSupport> {
	@private
	NSString *username;
	NSString *userMailAddress;
	NSString *recipientMailAddress;
}

@end
