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
		
		+(NSArray *) getAllLogs;
		+(NSObject<WeightLogSupport> *) getLastLog;
		-(void) save;
		//gives default values for weight and date
		-(id) initDefaultValues;
		-(NSNumber *) weightInUnits:(WeightUnitsOfMeasure) units;
		-(void) setWeight:(NSNumber *) weight withUnits:(WeightUnitsOfMeasure) units;

		



@end


