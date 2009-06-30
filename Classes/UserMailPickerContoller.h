
#import <UIKit/UIKit.h>


@interface UserMailPickerContoller : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource> {
	UIPickerView *mailPicker;
	NSArray *availableMailAccounts;
	UIViewController *caller;
}

@property (nonatomic, retain) IBOutlet UIPickerView *mailPicker;
@property (nonatomic, retain) NSArray *availableMailAccounts;
@property (nonatomic, retain) UIViewController *caller;
- (IBAction) mailChosen;

@end
