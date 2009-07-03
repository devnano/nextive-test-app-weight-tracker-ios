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


@interface PickerScaleController : UIViewController<ScaleSupport, UIPickerViewDelegate, UIPickerViewDataSource> {
	UIPickerView *valuePicker;
	DecimalPlaces decimalPlaces;
	WeightUnitsOfMeasure unitsOfMeasure;
	NSObject<WeightLogSupport> *owner;
	
}


@property (nonatomic, retain) IBOutlet UIPickerView *valuePicker;



@end
