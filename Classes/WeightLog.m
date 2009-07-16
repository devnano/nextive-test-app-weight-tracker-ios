#import "WeightLog.h"


@implementation WeightLog
@synthesize weight, date, weightLogId;
/***/
-(id) init{
	self = [super init];
	[self createTable];
	
	return self;
}
- (NSString *) tableString{
	return @"WEIGHTLOGS (WEIGHT REAL, LOGDATE TEXT)";
}

+(WeightLog *) weightLogFromRow:(sqlite3_stmt *)statement{
	WeightLog *log = [[WeightLog alloc] init];			
	
	log.weightLogId = sqlite3_column_int(statement, 0);
	log.weight = [NSNumber numberWithDouble: sqlite3_column_double(statement, 1)];
	NSString *dateText = [NSString stringWithCString:(char *)sqlite3_column_text(statement, 2)];
	NSDateFormatter *dateFormatter = [[[NSDateFormatter alloc] init] autorelease];
	[dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSSS"];
	log.date = [dateFormatter dateFromString:dateText];
	
	return log;
}

+(NSArray *) allLogs{
	
	NSString *query = @"SELECT rowid, weight, logdate FROM WEIGHTLOGS;";
	sqlite3_stmt *statement;
	int status;	
	//char *errorMsg;
	NSMutableArray *result = [[NSMutableArray alloc] init];
	status = sqlite3_prepare_v2([SqliteBaseObject sharedDb], [query UTF8String] , -1, &statement, nil);
	if(status == SQLITE_OK){
		
		while(sqlite3_step(statement) == SQLITE_ROW){			
			WeightLog *log = [WeightLog weightLogFromRow:statement];			
			[result addObject:log];
		}			
	} else {
		//fail
	}
	sqlite3_finalize(statement);
	return result;
	
}
+(NSObject<WeightLogSupport> *) getLastLog{
	NSString *query = @"SELECT rowid, weight, logdate FROM WEIGHTLOGS ORDER BY rowid DESC LIMIT 1;";
	sqlite3_stmt *statement;
	int status;	
	//char *errorMsg;
	WeightLog *log = nil;
	status = sqlite3_prepare_v2([SqliteBaseObject sharedDb], [query UTF8String] , -1, &statement, nil);
	if(status == SQLITE_OK){		
		if(sqlite3_step(statement) == SQLITE_ROW){			
			log = [WeightLog weightLogFromRow:statement];						
		}			
	} else {
		//fail
	}
	sqlite3_finalize(statement);
	return log;
	
	
}

+(void) removeWeightLogWithId:(NSInteger) weightLogId{
	NSString *query = [NSString stringWithFormat: @"DELETE FROM WEIGHTLOGS WHERE rowid=%i;", weightLogId];
	
	int status;	
	char *errorMsg;

	status = sqlite3_exec([SqliteBaseObject sharedDb], [query UTF8String], NULL, NULL, &errorMsg);
	
	if(status == SQLITE_OK){		
				
	} else {
		//fail
	}	
}

- (void) save{
	if(self.date != nil){
		char *errorMsg;		
				
		NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
		[dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSSS"];		
		NSString *formattedDateString = [dateFormatter stringFromDate:self.date];
		[dateFormatter release];
		//using the implicit id created by the database engine
		NSString *query = [NSString stringWithFormat:@"INSERT OR REPLACE INTO WEIGHTLOGS (WEIGHT, LOGDATE) VALUES(%f,'%@');", [self.weight doubleValue],formattedDateString];		
		
		int status = sqlite3_exec([SqliteBaseObject sharedDb], [query UTF8String], NULL, NULL, &errorMsg);
		
		if(status != SQLITE_OK){
			NSAssert1(0, @"Error creating table: %s", errorMsg);
			sqlite3_free(errorMsg);				
		} else {
		}		
		
	}
}
@end
