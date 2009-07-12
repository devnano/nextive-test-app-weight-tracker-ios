#import <Foundation/Foundation.h>

/**
 Utitilty class to access system settings.
 */
@interface SystemSettingsAccess : NSObject {

}

/**\return all the system configured mail addresses*/
+ (NSArray *) availableMailAccounts;
/**\return the name of the device user.*/
+ (NSString *) deviceUsername;
/**\return the default mail address of the device.*/
+ (NSString *) defaultMailAddress;
@end
