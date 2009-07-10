//
//  PickerScaleController.h
//  WeightTracker
//
//  Created by Mariano Heredia on 7/2/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ScaleSupport.h"
#import "WeightLogSupport.h"
#import "LabeledPickerView.h"
#import "WeightTrackerViewController.h"


@interface PickerScaleController : UIViewController<ScaleSupport, UIPickerViewDelegate, UIPickerViewDataSource> {
	LabeledPickerView *valuePicker;
	DecimalPlaces decimalPlaces;
	WeightUnitsOfMeasure unitsOfMeasure;
	NSObject<WeightLogSupport> *owner;
	
}


@property (nonatomic, retain) IBOutlet LabeledPickerView *valuePicker;



@end
