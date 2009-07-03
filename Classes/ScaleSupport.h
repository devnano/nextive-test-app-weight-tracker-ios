/*
 *  ScaleSupport.h
 *  WeightTracker
 *
 *  Created by Mariano Heredia on 7/2/09.
 *  Copyright 2009 __MyCompanyName__. All rights reserved.
 *
 */
#import "WeightLogSupport.h"
#import "WeightUtils.h"



@protocol ScaleSupport
	@property (nonatomic) WeightUnitsOfMeasure unitsOfMeasure;
	//returns the last measurment
	@property (nonatomic, assign) NSNumber *value;
	@property (nonatomic) DecimalPlaces decimalPlaces;
	@property (nonatomic, retain) NSObject<WeightLogSupport> *owner;
	-(id) initWithUnitsOfMeasure:(WeightUnitsOfMeasure)units withDecimalPlaces:(DecimalPlaces)places withValue:(NSNumber *)theValue;
@end




