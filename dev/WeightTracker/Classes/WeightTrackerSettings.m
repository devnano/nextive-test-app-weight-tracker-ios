//
//  WeightTrackerSettings.m
//  WeightTracker
//
//  Created by Mariano Heredia on 6/13/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "WeightTrackerSettings.h"


@implementation WeightTrackerSettings
@dynamic username;

//@synthesize appAlreadySetup;



- (NSString *) dataFilePath
{
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask , YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	return [documentsDirectory stringByAppendingPathComponent: FILE_NAME];
}

- (NSInteger) init
{
	int status = sqlite3_open([[self dataFilePath] UTF8String], &db);
	if(status != SQLITE_OK){
		sqlite3_close(db);
		NSAssert(0, @"Failed to open database");
		return status;
	}
	
	char *errorMsg;
	NSString *createSQL = @"CREATE TABLE IF NOT EXISTS SETTINGS (ID INTEGER PRIMARY KEY, USERNAME TEXT);";
	
	status = sqlite3_exec(db, [createSQL UTF8String], NULL, NULL, &errorMsg);
	
	if(status != SQLITE_OK){
		sqlite3_close(db);
		NSAssert1(0, @"Error creating table: %s", errorMsg);
		return status;
	}
	
	
	
	return 0;
}


- (BOOL) isAppAlreadySetup
{
	NSString *query = @"SELECT ID FROM SETTINGS WHERE ID=1;";
	sqlite3_stmt *statement;
	int status;	
	//char *errorMsg;
	
	status = sqlite3_prepare_v2(db, [query UTF8String] , -1, &statement, nil);
	if(status == SQLITE_OK){		
		self->appAlreadySetup = sqlite3_step(statement) == SQLITE_ROW;			
	} else {
		//fail
	}
	
	return self->appAlreadySetup;
	
}

- (void) setupAppWithUserInfo:(id) userInfo
{
	
	//taking advantege of dynamic nature of objective c
	//the userInfo reference must have a meessage named "username"
	NSString *username = (NSString *) [userInfo username];
	char *errorMsg;
	
	
	//the resulting rows must be only one
	//create the row and set app_setup to false
	
	NSString *query = [NSString stringWithFormat:@"INSERT OR REPLACE INTO SETTINGS (ID,USERNAME) VALUES(1,'%@');", username];
	int status = sqlite3_exec(db, [query UTF8String], NULL, NULL, &errorMsg);
	self->appAlreadySetup = status == SQLITE_OK;
	if(!self->appAlreadySetup){
		NSAssert1(0, @"Error creating table: %s", errorMsg);
		sqlite3_free(errorMsg);				
	} else {
	}			
	
}

- (NSString *) username
{
	NSString *query = @"SELECT USERNAME FROM SETTINGS WHERE ID=1;";
	sqlite3_stmt *statement;
	int status;
	NSString *username = nil;
	//char *errorMsg;
	
	status = sqlite3_prepare_v2(db, [query UTF8String] , -1, &statement, nil);
	if(status == SQLITE_OK){		
		if(sqlite3_step(statement) == SQLITE_ROW){
			char *columnUsername = (char *)sqlite3_column_text(statement, 0);
			username = [[NSString alloc] initWithUTF8String:columnUsername];
		}			
	} else {
		//fail
	}
	
	return username;
	
	
}

@end
