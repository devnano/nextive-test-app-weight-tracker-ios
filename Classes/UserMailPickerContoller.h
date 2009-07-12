
#import <UIKit/UIKit.h>
#import "WeightTrackerSettingsSupport.h"


@interface UserMailPickerContoller : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource> {
	@private
	UIPickerView *mailPicker;
	NSArray *availableMailAccounts;
	UIViewController<WeightTrackerSettingsSupport> *caller;
}

@property (nonatomic, retain) IBOutlet UIPickerView *mailPicker;
@property (nonatomic, retain) NSArray *availableMailAccounts;
@property (nonatomic, retain) UIViewController<WeightTrackerSettingsSupport> *caller;
- (IBAction) mailChosen;

@end
