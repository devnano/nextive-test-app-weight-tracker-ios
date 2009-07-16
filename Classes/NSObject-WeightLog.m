#import "NSObject-WeightLog.h"


@implementation NSObject(WeightLog) 
//sets default values
-(id) initDefaultValues{
	if(self = [self init]){
		//setting today's date
		self.date = [[NSDate alloc] init];
		//the last log
		NSObject<WeightLogSupport> *lastLog = [[self class] getLastLog];		
		//initializing with the last weight log if exist, 0.0 otherwise...
		self.weight = lastLog != nil ? lastLog.weight : [NSNumber numberWithFloat:0.0];			
	}
	return self;
	
}
-(NSNumber *) weightInUnits:(WeightUnitsOfMeasure) units{
	NSNumber *result;
	switch (units) {
		case Kilograms:
			result = self.weight;
			break;
		case Pounds:
			result =  kilogramsToPounds(self.weight);
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
