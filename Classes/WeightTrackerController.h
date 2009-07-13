#import <UIKit/UIKit.h>
#import "NewWeightController.h"
#import "WeightHistoryController.h"
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>
#import "WeightTrackerViewController.h"


@interface WeightTrackerController : UITableViewController<UITableViewDelegate, UITableViewDataSource, MFMailComposeViewControllerDelegate> {
@private
	//id<WeightTrackerSettingsSupport> weightTrackerSettings;
	UITableViewCell *newWeightCell;
	UITableViewCell *weightHistoryCell;
	UITableViewCell *shareWeightInfoCell;
	NewWeightController *newWeightController;
	WeightHistoryController *weightHistoryController;

}

@property(nonatomic, retain) UITableViewCell *newWeightCell;
@property(nonatomic, retain) UITableViewCell *weightHistoryCell;
@property(nonatomic, retain) UITableViewCell *shareWeightInfoCell;
@property(nonatomic, retain) NewWeightController *newWeightController;
@property(nonatomic, retain) WeightHistoryController *weightHistoryController;

@end
