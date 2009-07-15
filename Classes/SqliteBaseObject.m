#import "SqliteBaseObject.h"


@implementation SqliteBaseObject
static sqlite3 *db;

+ (sqlite3 *) sharedDb{
	return db;
}

+ (NSString *) dataFilePath
{
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask , YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	return [documentsDirectory stringByAppendingPathComponent: FILE_NAME];
}
+ (BOOL) isDatabaseOpen{
	return db != NULL;
}
+ (BOOL) openDatabase {	
	BOOL returnValue = [SqliteBaseObject isDatabaseOpen];
	
	if(!returnValue){	
		returnValue =  sqlite3_open([[self dataFilePath] UTF8String], &db) == SQLITE_OK;
		if(!returnValue){
			sqlite3_close(db);
			db = NULL;
		}	
	}
	return returnValue;	
}

- (void) createTable{
	int status;
	char *errorMsg;
	NSString *createSQL = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ ;", [self tableString]];
	
	status = sqlite3_exec([SqliteBaseObject sharedDb], [createSQL UTF8String], NULL, NULL, &errorMsg);
	
	if(status != SQLITE_OK){
		sqlite3_close([SqliteBaseObject sharedDb]);
		NSAssert1(0, @"Error creating table: %s", errorMsg);			
	}
	
}
/**Empty implementation*/
- (NSString *) tableString{
	return @"";
}


@end
