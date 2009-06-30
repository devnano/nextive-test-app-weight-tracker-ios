
#import <UIKit/UIKit.h>
#import "WeightTrackerSettings.h"
#import "WeightTrackerController.h"
#import "UserMailPickerContoller.h"
#import "DefaultRecipientMailOptionsController.h"

@class WeightTrackerController;


@interface UserInfoController : UIViewController {
	UITextField * usernameTextField;
	UserMailPickerContoller *userMailPickerController;
	WeightTrackerController *weightTrackerController;
	DefaultRecipientMailOptionsController *defaultRecipientMailOptionsController;
	UILabel *userMailLabel;
	
}

@property(nonatomic,retain) IBOutlet UITextField * usernameTextField;
@property(nonatomic,retain) IBOutlet UILabel *userMailLabel;
@property(nonatomic, copy) NSString * username;
@property(nonatomic, copy) NSString *userMailAddress;
@property(nonatomic, retain) UserMailPickerContoller *userMailPickerController;
@property(nonatomic, retain) DefaultRecipientMailOptionsController *defaultRecipientMailOptionsController;
- (void) save;
- (IBAction) textFieldDoneEditing:(id)sender;
- (IBAction) changeMail:(id)sender;
- (IBAction) changeDefaultRecipientMail:(id)sender;


@property(retain, nonatomic) WeightTrackerController *weightTrackerController;
@property(readonly, nonatomic) id<WeightTrackerSettingsSupport> weightTrackerSettings;



@end
