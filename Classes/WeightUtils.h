/*
 *  WeightUtils.h
 *  WeightTracker
 *
 *  Created by Mariano Heredia on 7/3/09.
 *  Copyright 2009 __MyCompanyName__. All rights reserved.
 *
 */
#define kScaleMaxInKg 150
#define kKgPerPounds 0.45359237



typedef enum{
	OneDecimalPlace = 1,
	TwoDecimalPlaces = 2,
} DecimalPlaces;

//this has to be promoted as an app settings to be set at runtime
#define kAppDecimalPlaces TwoDecimalPlaces

typedef enum {
	NotDefined = -1,
    Pounds = 0,
	Kilograms = 1,
	
} WeightUnitsOfMeasure;
static NSNumber *kilogramsToPounds(NSNumber *kgs){
	return [NSNumber numberWithFloat:[kgs floatValue] / kKgPerPounds];
}

static NSNumber * pundsToKilograms(NSNumber *pounds){
	return [NSNumber numberWithFloat: [pounds floatValue] * kKgPerPounds];
}
