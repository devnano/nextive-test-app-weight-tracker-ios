#import "WeightTrackerSettingsSPO.h"
#import "WeightTrackerSettings.h"

/**
 Convenience Category that implements common WeightTrackerSettingsSupport methods.
 */
@interface NSObject (WeightTrackerSettingsStorage)
/**
 Given an id<WeightTrackerSettingsSupport> instance, fills the cuerrent one.
 */
- (void) setupAppWithUserInfo:(id<WeightTrackerSettingsSupport>) userInfo;
/**Populates the current settings into userInfo instance.*/
- (void) loadAppUserInfo:(id<WeightTrackerSettingsSupport>)userInfo;	


@end




