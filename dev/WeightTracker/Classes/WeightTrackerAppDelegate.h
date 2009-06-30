#import <UIKit/UIKit.h>

@class WeightTrackerController;

@interface WeightTrackerAppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow *window;
	WeightTrackerController *weightTrackerController;
	UINavigationController *mainNavigationController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet WeightTrackerController *weightTrackerController;
@property (nonatomic, retain) IBOutlet UINavigationController *mainNavigationController;

@end
