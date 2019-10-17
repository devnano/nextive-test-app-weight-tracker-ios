#import <Foundation/Foundation.h>
#import "WeightTrackerSettingsSupport.h"
#import "SQLitePersistentObject.h"



@interface WeightTrackerSettingsSPO : SQLitePersistentObject<WeightTrackerSettingsSupport> {
	@private
	NSString *username;/**\sa WeightTrackerSettingsSupport::username.*/
	NSString *userMailAddress;/**\sa WeightTrackerSettingsSupport::userMailAddress.*/
	NSString *recipientMailAddress;/**\sa WeightTrackerSettingsSupport::recipientMailAddress.*/
	WeightUnitsOfMeasure weightUnitOfMeasure;/**\sa WeightTrackerSettingsSupport::weightUnitOfMeasure.*/
}

@end
