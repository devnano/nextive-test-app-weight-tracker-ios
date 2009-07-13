#import <UIKit/UIKit.h>
#import "WeightHistory.h"
#import "WeightTrackerViewController.h"

@interface WeightHistoryController : UITableViewController<UITableViewDelegate, UITableViewDataSource> {
	@private
	WeightHistory *weightHistory;

}
@property (nonatomic, retain) WeightHistory *weightHistory;
-(id) init;
@end
