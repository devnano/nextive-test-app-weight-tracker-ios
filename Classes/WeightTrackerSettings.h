#import <Foundation/Foundation.h>
#import "/usr/include/sqlite3.h"
#import "WeightTrackerSettingsSupport.h"

#define FILE_NAME @"data.sqlite3"




@interface WeightTrackerSettings : NSObject <WeightTrackerSettingsSupport> {
	@private
		BOOL appAlreadySetup;
		sqlite3 *db;
	NSString *username;/**\sa WeightTrackerSettingsSupport::username.*/
	NSString *userMailAddress;/**\sa WeightTrackerSettingsSupport::userMailAddress.*/
	NSString *recipientMailAddress;/**\sa WeightTrackerSettingsSupport::recipientMailAddress.*/
	NSInteger weightUnitOfMeasure;/**\sa WeightTrackerSettingsSupport::weightUnitOfMeasure.*/
		
}

- (NSString *) dataFilePath;

@end
