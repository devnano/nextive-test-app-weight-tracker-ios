
#import <UIKit/UIKit.h>
#import "WeightTrackerSettings.h"
#import "WeightTrackerController.h"
#import "UserMailPickerContoller.h"

@class WeightTrackerController;


@interface UserInfoController : UIViewController {
	UITextField * usernameTextField;
	UserMailPickerContoller *userMailPickerController;
	WeightTrackerController *weightTrackerController;
	UILabel *userMailLabel;
	
}

@property(nonatomic,retain) IBOutlet UITextField * usernameTextField;
@property(nonatomic,retain) IBOutlet UILabel *userMailLabel;
@property(nonatomic, copy) NSString * username;
@property(nonatomic, copy) NSString *userMailAddress;
@property(nonatomic, retain) UserMailPickerContoller *userMailPickerController;
- (void) save;
- (IBAction) textFieldDoneEditing:(id)sender;
- (IBAction) changeMail:(id)sender;


@property(retain, nonatomic) WeightTrackerController *weightTrackerController;
@property(readonly, nonatomic) id<WeightTrackerSettingsSupport> weightTrackerSettings;



@end
