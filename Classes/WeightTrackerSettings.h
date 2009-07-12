#import <Foundation/Foundation.h>
#import "/usr/include/sqlite3.h"
#import "WeightTrackerSettingsSupport.h"

#define FILE_NAME @"data.sqlite3"




@interface WeightTrackerSettings : NSObject <WeightTrackerSettingsSupport> {
	@private
		BOOL appAlreadySetup;
		sqlite3 *db;
		
}

- (NSString *) dataFilePath;
- (NSInteger) init;
@end
