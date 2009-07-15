#import "WeightTrackerSettings.h"


@implementation WeightTrackerSettings
@synthesize username, userMailAddress, recipientMailAddress,weightUnitOfMeasure;

- (NSString *) dataFilePath
{
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask , YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	return [documentsDirectory stringByAppendingPathComponent: FILE_NAME];
}

- (void) loadSavedSettings{
	NSString *query = @"SELECT USERNAME,USERMAILADDRESS,RECIPIENTADDRESS,UNITSOFMEASURE  FROM SETTINGS WHERE ID=1;";
	sqlite3_stmt *statement;
	int status;	
	//char *errorMsg;
	
	status = sqlite3_prepare_v2(db, [query UTF8String] , -1, &statement, nil);
	if(status == SQLITE_OK){				
		if(sqlite3_step(statement) == SQLITE_ROW){			
			char *column = (char *)sqlite3_column_text(statement, 0);
			//see temporary variable to release after assignment
			self.username = [[NSString alloc] initWithUTF8String:column];
			column =  (char *)sqlite3_column_text(statement, 1);
			self.userMailAddress = [[NSString alloc] initWithUTF8String:column];
			column =  (char *)sqlite3_column_text(statement, 2);
			self.recipientMailAddress = [[NSString alloc] initWithUTF8String:column];
			self.weightUnitOfMeasure = sqlite3_column_int(statement, 3);
		}			
	} else {
		//fail
	}
	
}

- (id) init
{
	self =  [super init];
	int status = sqlite3_open([[self dataFilePath] UTF8String], &db);
	if(status != SQLITE_OK){
		sqlite3_close(db);
		NSAssert(0, @"Failed to open database");		
	} else {	
		char *errorMsg;
		NSString *createSQL = @"CREATE TABLE IF NOT EXISTS SETTINGS (ID INTEGER PRIMARY KEY, USERNAME TEXT, USERMAILADDRESS TEXT, RECIPIENTADDRESS TEXT, UNITSOFMEASURE INTEGER);";
	
		status = sqlite3_exec(db, [createSQL UTF8String], NULL, NULL, &errorMsg);
	
		if(status != SQLITE_OK){
			sqlite3_close(db);
			NSAssert1(0, @"Error creating table: %s", errorMsg);			
		}
		if([self isAppAlreadySetup]){
			[self loadSavedSettings];
		}
	}
	return self;
}




- (BOOL) isAppAlreadySetup
{
	
	NSString *query = @"SELECT ID FROM SETTINGS WHERE ID=1;";
	sqlite3_stmt *statement;
	int status;	
	//char *errorMsg;
	
	status = sqlite3_prepare_v2(db, [query UTF8String] , -1, &statement, nil);
	self->appAlreadySetup = status == SQLITE_OK &&	sqlite3_step(statement) == SQLITE_ROW;
		
	return self->appAlreadySetup;
}

- (void) save{
	char *errorMsg;
	
	
	//the resulting rows must be only one
	//create the row and set app_setup to false
	
	NSString *query = [NSString stringWithFormat:@"INSERT OR REPLACE INTO SETTINGS (ID, USERNAME,USERMAILADDRESS,RECIPIENTADDRESS,UNITSOFMEASURE) VALUES(1,'%@','%@','%@',%i);", self.username,self.userMailAddress,self.recipientMailAddress, self.weightUnitOfMeasure];
	
	
	
	int status = sqlite3_exec(db, [query UTF8String], NULL, NULL, &errorMsg);
	self->appAlreadySetup = status == SQLITE_OK;
	if(!self->appAlreadySetup){
		NSAssert1(0, @"Error creating table: %s", errorMsg);
		sqlite3_free(errorMsg);				
	} else {
	}			
	
}



@end
