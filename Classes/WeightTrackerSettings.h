#import <Foundation/Foundation.h>
#import "WeightTrackerSettingsSupport.h"
#import "SqliteBaseObject.h"





@interface WeightTrackerSettings : SqliteBaseObject <WeightTrackerSettingsSupport> {
	@private
		BOOL appAlreadySetup;
		
	NSString *username;/**\sa WeightTrackerSettingsSupport::username.*/
	NSString *userMailAddress;/**\sa WeightTrackerSettingsSupport::userMailAddress.*/
	NSString *recipientMailAddress;/**\sa WeightTrackerSettingsSupport::recipientMailAddress.*/
	NSInteger weightUnitOfMeasure;/**\sa WeightTrackerSettingsSupport::weightUnitOfMeasure.*/
		
}



@end
