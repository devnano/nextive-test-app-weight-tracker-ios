/*
 *  WeightLogSupport.h
 *  WeightTracker
 *
 *  Created by Mariano Heredia on 7/2/09.
 *  Copyright 2009 __MyCompanyName__. All rights reserved.
 *
 */

#import "WeightUtils.h"





@protocol WeightLogSupport
	@required
		//gives the weight in kilograms
		@property (nonatomic, retain) NSNumber *weight;
		@property (nonatomic, retain) NSDate *date;
	@optional
		@property (nonatomic) NSInteger weightLogId;
		+(NSArray *) allLogs;
		+(NSObject<WeightLogSupport> *) getLastLog;
		+(void) removeWeightLogWithId:(NSInteger) weightLogId;
		-(void) save;
		//gives default values for weight and date
		-(id) initDefaultValues;
		-(NSNumber *) weightInUnits:(WeightUnitsOfMeasure) units;
		-(NSString *) weightStringInUnits:(WeightUnitsOfMeasure) units  withDecimalPlaces:(DecimalPlaces) decimalPlaces;
		-(void) setWeight:(NSNumber *) weight withUnits:(WeightUnitsOfMeasure) units;

		



@end


