//
//  WeightHistory.m
//  WeightTracker
//
//  Created by Mariano Heredia on 7/7/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "WeightHistory.h"
#import "WeightTrackerFactory.h"



@implementation WeightHistory
@synthesize weightLogs;

-(id) init{
	self = [super init];	
	
	return self;	
}
-(void) dealloc{
	[self.weightLogs release];
	[super dealloc];
	
}

-(void) refresh{
	Class<WeightLogSupport> weightLogClass = [WeightTrackerFactory weightLogClass];	
	self.weightLogs = [weightLogClass allLogs];
}
-(void) remove:(NSInteger) i{
	Class<WeightLogSupport> weightLogClass = [WeightTrackerFactory weightLogClass];	
	id<WeightLogSupport> weightLog = [self.weightLogs objectAtIndex:i];
	[weightLogClass removeWeightLogWithId:weightLog.weightLogId];
}

-(NSUInteger) count{
	//refresh available logs to show updated results.
	//elf.weightHistory refresh];
	//if(self.weightLogs == nil){
	[self refresh];
//	}
	return self.weightLogs.count;
}

@end
