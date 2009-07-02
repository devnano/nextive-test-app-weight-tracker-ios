//
//  WeightLog.m
//  WeightTracker
//
//  Created by Mariano Heredia on 7/2/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "WeightLogSPO.h"


@implementation WeightLogSPO
DECLARE_PROPERTIES(
				   DECLARE_PROPERTY(@"weight", @"@\"NSNumber\""),
				   DECLARE_PROPERTY(@"date", @"@\"NSDate\"")
				  
				   
				   )
@synthesize weight, date;


+(NSArray *) getAllLogs{
	return [WeightLogSPO allObjects];
}
+(NSObject<WeightLogSupport> *) getLastLog{
	NSObject<WeightLogSupport> *lastLog = (NSObject<WeightLogSupport> *) [WeightLogSPO findFirstByCriteria:@" order by date desc"];
	return lastLog;
}

-(id) init{
	if(self = [super init]){
		self->date = [[NSDate alloc] init];
		//the last
		NSObject<WeightLogSupport> *lastLog = [WeightLogSPO getLastLog];
		self->weight = lastLog != nil ? lastLog.weight : [NSNumber numberWithFloat:0.0];
		[self->weight retain];			
		 
		
	}
	return self;
	
}
-(void) save{
	[self save];
}

- (void)dealloc {
	[date release];
	[weight release];
	[super dealloc];
}



@end
