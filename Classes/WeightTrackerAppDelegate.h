#import <UIKit/UIKit.h>
#import "WeightTrackerSettings.h"

/**
 Weight Tracker Application delegate.
 
 \pre the instance class implements WeightTrackerSettingsSupport protocol.
 \sa UIApplicationDelegate.
 */
@interface WeightTrackerAppDelegate : NSObject <UIApplicationDelegate> {
	@private
    UIWindow *window;	
	UINavigationController *navController; /**<The main application Navigation Controller.*/
	UINavigationController *navSettings;/**<The settings Navigation Controller.*/
	NSObject<WeightTrackerSettingsSupport> *weightTrackerSettings; /**<The application settings access.*/
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navController;
@property (nonatomic, retain) IBOutlet UINavigationController *navSettings;
@property (retain, nonatomic) NSObject<WeightTrackerSettingsSupport> *weightTrackerSettings;
/**Show navSettings controller as modal.*/
- (IBAction) showAppSettings;
/**Dismiss navSetings as modal controller.*/
- (IBAction) hideAppSettings;

@end

