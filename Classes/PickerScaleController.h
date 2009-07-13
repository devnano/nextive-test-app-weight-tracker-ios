#import <UIKit/UIKit.h>
#import "ScaleSupport.h"
#import "WeightLogSupport.h"
#import "LabeledPickerView.h"
#import "WeightTrackerViewController.h"


@interface PickerScaleController : UIViewController<ScaleSupport, UIPickerViewDelegate, UIPickerViewDataSource> {
	@private
	LabeledPickerView *valuePicker;	
	NSObject<WeightLogSupport> *owner;
	
}


@property (nonatomic, retain) IBOutlet LabeledPickerView *valuePicker;



@end
