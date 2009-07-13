#import <UIKit/UIKit.h>
#import "WeightLogSupport.h"
#import "WeightTrackerViewController.h"


@interface WeightLogDatePickerController : UIViewController {
	@private
		UIDatePicker *datePickerView;
		NSObject<WeightLogSupport> *weightLog;

}

@property(nonatomic, retain) IBOutlet UIDatePicker *datePickerView;
@property(nonatomic, retain) NSObject<WeightLogSupport> *weightLog;


@end
