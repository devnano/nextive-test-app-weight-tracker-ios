#import "WeightLogSPO.h"


@implementation WeightLogSPO
DECLARE_PROPERTIES(
				   DECLARE_PROPERTY(@"weight", @"@\"NSNumber\""),
				   DECLARE_PROPERTY(@"date", @"@\"NSDate\"")
				  
				   
				   )
@synthesize weight, date;
@dynamic weightLogId;

#pragma mark -
#pragma mark Overriden parent callbacks

- (void)dealloc {
	[date release];
	[weight release];
	[super dealloc];
}

#pragma mark -
#pragma mark WeightLogSupport

-(void) setWeightLogId:(NSInteger) theId{
	//as spo autogenerates pks, do nothing here in this implementation	
}

-(NSInteger) weightLogId{
	return self.pk;
}


+(NSArray *) allLogs{
	return [WeightLogSPO allObjects];
}
+(NSObject<WeightLogSupport> *) getLastLog{
	NSObject<WeightLogSupport> *lastLog = (NSObject<WeightLogSupport> *) [WeightLogSPO findFirstByCriteria:@" order by date desc"];
	return lastLog;
}

-(void) save{
	[super save];
}

+(void) removeWeightLogWithId:(NSInteger) weightLogId{
	[WeightLogSPO deleteObject:weightLogId cascade:NO];
}

@end
