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

+(void) removeWeightLogWithId:(NSInteger) weightLogId{
	[WeightLogSPO deleteObject:weightLogId cascade:NO];
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

-(NSString *) weightStringInUnits:(WeightUnitsOfMeasure) units withDecimalPlaces:(DecimalPlaces) decimalPlaces{
	NSString *weightString;
	float localizedWeight = [[self weightInUnits:units]floatValue];
	
	NSString *format = [NSString stringWithFormat:@"%%.%df", decimalPlaces];
	weightString = [NSString stringWithFormat:format, localizedWeight];
	
	return weightString;
	
}

-(NSString *) dateStringWithFormat:(NSString *) format{
	//pre: self.dateCell has already been initialized
	NSDateFormatter *formater =[[NSDateFormatter alloc] init];
	[formater setDateFormat:format];
	NSString *dateString =  [formater stringFromDate:self.date];
	
	[formater release];	
	return dateString;
}



@end
