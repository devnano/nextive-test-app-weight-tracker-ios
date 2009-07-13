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
	[self refresh];

	return self.weightLogs.count;
}

@end
