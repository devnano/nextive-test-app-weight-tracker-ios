#import <Foundation/Foundation.h>
#import "WeightTrackerSettings.h"
#import "WeightLogSupport.h"




/**
 WeightTracker Creational class.
 */
@interface WeightTrackerFactory : NSObject {
	
	

}
/** 
 \sa WeightTrackerSettingsSupport
 \return a single shared instance of the application persistent settings. 
 */
+ (NSObject<WeightTrackerSettingsSupport> *) getWeightTrackerSettings;
/**Creates a WeightLogSupport compliant object.
 \return the new created instance of WeightLogSupport compliant class.
 */
+ (NSObject<WeightLogSupport> *) createWeightLog;
/**
 \return the system class used to create WeightLogSupport campliant objects.
 */
+ (Class<WeightLogSupport>) weightLogClass;

@end
