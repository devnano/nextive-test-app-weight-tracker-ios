

#import <UIKit/UIKit.h>
#import "WeightTrackerSettings.h"


@class UserInfoController;
@class MainApplicationController;
@class WeightTrackerSettings;


@interface WeightTrackerController : UIViewController {
	UserInfoController *userInfoController;
	MainApplicationController *mainApplicationController;
	WeightTrackerSettings *weightTrackerSettings;
}

@property (retain, nonatomic) UserInfoController *userInfoController;
@property (retain, nonatomic) MainApplicationController *mainApplicationController;
@property (retain, nonatomic) id<WeightTrackerSettingsSupport> weightTrackerSettings;
-(IBAction) switchViews:(id)sender;
-(void) genericSwitchViews:(UIViewController *)oneView otherView:(UIViewController *)otherView;
@end
