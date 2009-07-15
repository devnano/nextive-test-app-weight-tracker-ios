#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "WeightTrackerAppDelegate.h"
#import "WeightTrackerSettingsSupport.h"

/**
 Convenience Category that exposes common properties and methods for all WeightTracker view controllers.
 */
@interface UIViewController (WeightTrackerViewController) 

/**
 Current application settings. Through this property, all view controllers must access to up to date
 application settings and al the related properties and methods.
 \sa WeightTrackerSettingsSupport
 */
@property(readonly) NSObject<WeightTrackerSettingsSupport> *settings;
/**
 The application settings UINavigationController. All settings related view controllers must
 be pushed to poped from this controller.
 */
@property(readonly) UINavigationController *navSettings;
/**
 The main application UINavigationController. All core applications view contollers must
 be pushed to and poped from this controller.
 */
@property(readonly) UINavigationController *navMainApp;

/**Gives the short string that refers to the weighning units. (e.g. lb. or kg.)*/
@property(readonly) NSString *weighningUnitsStr;


@end
