#import <UIKit/UIKit.h>

@class WeightTrackerController;

@interface WeightTrackerAppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow *window;
	WeightTrackerController *weightTrackerController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet WeightTrackerController *weightTrackerController;


@end
