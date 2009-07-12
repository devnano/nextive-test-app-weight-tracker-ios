#import <UIKit/UIKit.h>
#import "WeightTrackerSettingsSupport.h"


@interface UserMailPickerContoller : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource> {
	@private
	UIPickerView *mailPicker;/**<Exposes available mail addresses.*/
	NSArray *availableMailAccounts;/**<Array of available mail addresses.*/
	UIViewController<WeightTrackerSettingsSupport> *caller/**<Interested party, that will be notified with the selected mail address.
															@see WeightTrackerSettingsSupport.*/;
}

@property (nonatomic, retain) IBOutlet UIPickerView *mailPicker;
@property (nonatomic, retain) NSArray *availableMailAccounts;
@property (nonatomic, retain) UIViewController<WeightTrackerSettingsSupport> *caller;
/**
 Outlet plugged to the <b>accept</b> trigger. 
 */
- (IBAction) mailChosen;

@end
