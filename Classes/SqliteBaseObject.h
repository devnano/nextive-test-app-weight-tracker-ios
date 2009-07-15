#import <Foundation/Foundation.h>
#import "/usr/include/sqlite3.h"
#define FILE_NAME @"data.sqlite3"


@interface SqliteBaseObject : NSObject {
	
}

+ (NSString *) dataFilePath;
+ (BOOL) openDatabase;
+ (sqlite3 *) sharedDb;
- (void) createTable;
- (NSString *) tableString;


@end


