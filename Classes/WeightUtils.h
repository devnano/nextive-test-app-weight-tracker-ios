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
#define kKgNoDecimalPlaces "kg ."
#define kLbNoDecimalPlaces "lb ."
#define kKgOneDecimalPlace ""
#define kLbOneDecimalPlace ""
#define kKgTwoDecimalPlaces ""
#define kLbTwoDecimalPlaces ""




typedef enum{
	NoDecimalPlaces = 0,
	OneDecimalPlace = 1,
	TwoDecimalPlaces = 2,
	ThreeDecimalPlaces = 3
} DecimalPlaces;

/**this has to be promoted as an app settings to be set at runtime
otherwise, you must switch the value defined to let the app change its behavior*/

#define kAppDecimalPlaces OneDecimalPlace
//#define kAppDecimalPlaces ThreeDecimalPlaces

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

static NSString * stringForDecimalPlaceAndUnits(WeightUnitsOfMeasure units, DecimalPlaces place){
	char *str;
	switch (place) {
		case NoDecimalPlaces:
			str = units == Kilograms ? kKgNoDecimalPlaces : kLbNoDecimalPlaces;  
			break;
		case OneDecimalPlace:
			str = units == Kilograms ? kKgOneDecimalPlace : kLbOneDecimalPlace;
			break;
		case TwoDecimalPlaces:
			str = units == Kilograms ? kKgTwoDecimalPlaces : kLbTwoDecimalPlaces;
		default:
			break;
	}
	return [NSString stringWithCString:str];
}


