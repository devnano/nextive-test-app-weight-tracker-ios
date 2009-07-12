#import <UIKit/UIKit.h>
#import "WeightTrackerSettings.h"
#import "UserMailPickerContoller.h"
#import "DefaultRecipientMailOptionsController.h"
#import "WeightTrackerViewController.h"

/**
 Main view controller for the application settings.
 */
@interface WeightTrackerSettingsController : UITableViewController<UITableViewDelegate, UITableViewDataSource,
														           WeightTrackerSettingsSupport, UITextFieldDelegate> {
	@private
	UITableViewCell *usernameCell; /**<Holds user name input field.*/
	UITableViewCell *userMailAddressCell;/**<Holds user mail data, and triggers user mail selection screen when selected.*/
	UITableViewCell *recipientMailAddressCell;/**<Holds default recipient mail address,
												 and triggers recipient mail selection screen when selected.*/
	UITableViewCell *weightUnitOfMeasureCell;/**<Holds unit of measure input field.*/
	UserMailPickerContoller *userMailPickerController;/**<ViewController responsible to manage user mail selection.
														 @see UserMailPickerContoller.*/
	DefaultRecipientMailOptionsController *defaultRecipientMailOptionsController; /**<ViewController Responsible to manage recipient mail
																				  address selection.
																					@see DefaultRecipientMailOptionsController*/
}


@property(nonatomic, retain) UITableViewCell *usernameCell;
@property(nonatomic, retain) UITableViewCell *userMailAddressCell;
@property(nonatomic, retain) UITableViewCell *recipientMailAddressCell;
@property(nonatomic, retain) UITableViewCell *weightUnitOfMeasureCell;
@property(nonatomic, retain) UserMailPickerContoller *userMailPickerController;
@property(nonatomic, retain) DefaultRecipientMailOptionsController *defaultRecipientMailOptionsController;

-(void) save;

@end
