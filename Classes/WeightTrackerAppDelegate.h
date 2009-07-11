//
//  WeightTrackerAppDelegate.h
//  WeightTracker
//

#import <UIKit/UIKit.h>
#import "WeightTrackerSettings.h"

@interface WeightTrackerAppDelegate : NSObject <UIApplicationDelegate> {
	@private
    UIWindow *window;
	UINavigationController *navController;
	UINavigationController *navSettings;
	NSObject<WeightTrackerSettingsSupport> *weightTrackerSettings;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navController;
@property (nonatomic, retain) IBOutlet UINavigationController *navSettings;
@property (retain, nonatomic) NSObject<WeightTrackerSettingsSupport> *weightTrackerSettings;
- (IBAction) showAppSettings;
- (IBAction) hideAppSettings;

@end

