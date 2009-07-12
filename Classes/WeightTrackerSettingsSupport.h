#import "SystemSettingsAccess.h"
#import "ScaleSupport.h"

/**Defines the application settings properties and related access methods.*/
@protocol WeightTrackerSettingsSupport
@required
	@property (nonatomic, copy) NSString *username;/**<User name setting.*/
	@property (nonatomic, copy) NSString *userMailAddress;/**<User Mail Address setting.*/	
	@property (nonatomic, copy) NSString *recipientMailAddress;/**<Recipient Mail Address setting.*/
	@property (nonatomic) WeightUnitsOfMeasure weightUnitOfMeasure;/**<WeightUnitsOfMeasure settings. \sa WeightUnitsOfMeasure.*/
@optional
	//as the above properties gives complete information, the below
	//accesory methods are tagged as optional
	/**
	 Tells wheather or not the application has all the requiered information to properly work.
	 */
	- (BOOL) isAppAlreadySetup;	
	/**
	 Given an id<WeightTrackerSettingsSupport> instance, fills the cuerrent one.
	 */
	- (void) setupAppWithUserInfo:(id<WeightTrackerSettingsSupport>) userInfo;
	/**Populates the current settings into userInfo instance.*/
	- (void) loadAppUserInfo:(id<WeightTrackerSettingsSupport>)userInfo;	
@end

/**
 Loads system default settings into userInfo instance.
 */
static void loadSystemSettingsDefaults(id<WeightTrackerSettingsSupport> userInfo){
	userInfo.username = [SystemSettingsAccess deviceUsername];
	userInfo.userMailAddress = [SystemSettingsAccess defaultMailAddress];	
	//when the app si not already set, it must be empty until the user chose a valid mail from
	//contancts
	userInfo.recipientMailAddress=@"";
	userInfo.weightUnitOfMeasure = NotDefined;	
}

