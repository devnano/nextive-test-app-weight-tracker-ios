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
//sets default values
-(id) initDefaultValues{
	if(self = [super init]){
		self->date = [[NSDate alloc] init];
		//the last log
		NSObject<WeightLogSupport> *lastLog = [WeightLogSPO getLastLog];
		self->weight = lastLog != nil ? lastLog.weight : [NSNumber numberWithFloat:0.0];
		[self->weight retain];	
		[self->date retain];		
	}
	return self;
	
}
-(void) save{
	[super save];
}

- (void)dealloc {
	[date release];
	[weight release];
	[super dealloc];
}

-(NSNumber *) weightInUnits:(WeightUnitsOfMeasure) units{
	NSNumber *result;
	switch (units) {
		case Kilograms:
			result = weight;
			break;
		case Pounds:
			result =  kilogramsToPounds(weight);
			break;
	}
	return result;
}

-(void) setWeight:(NSNumber *) value withUnits:(WeightUnitsOfMeasure) units{
	switch (units) {
		case Kilograms:
			self.weight = value;
			break;
		default:
			self.weight = pundsToKilograms(value);
			break;
	}
}



@end
