#import <UIKit/UIKit.h>
#import "WeightLogSupport.h"
#import "WeightLogDatePickerController.h"
#import "ScaleSupport.h"
#import "WeightTrackerViewController.h"


@interface NewWeightController : UITableViewController<UITableViewDelegate, UITableViewDataSource,WeightLogSupport> {
	
	@private
		NSObject<WeightLogSupport> *weightLog;
		UITableViewCell *weightCell;
		UITableViewCell *dateCell;
		WeightLogDatePickerController *datePickerController;
		NSObject<ScaleSupport> *scale;
}

@property(nonatomic, retain) UITableViewCell *weightCell;
@property(nonatomic, retain) UITableViewCell *dateCell;
@property(nonatomic, retain) WeightLogDatePickerController *datePickerController;
@property(nonatomic, retain) NSObject<ScaleSupport> *scale;
- (void)updateWithLastLog;


@end
