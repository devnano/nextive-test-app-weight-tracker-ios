

#import <UIKit/UIKit.h>
#import "WeightTrackerController.h"


@interface MainApplicationController : UIViewController {
	UILabel *username;
	WeightTrackerController *weightTrackerController;
}


@property(retain, nonatomic) IBOutlet UILabel *username;
@property (retain, nonatomic) WeightTrackerController *weightTrackerController;
- (IBAction) sendInfoButtonPressed:(id)sender;

@end
