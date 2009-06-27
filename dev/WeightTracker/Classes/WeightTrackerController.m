
#import "WeightTrackerController.h"
#import "UserInfoController.h"
#import "MainApplicationController.h"
#import "WeightTrackerSettingsFactory.h"


@implementation WeightTrackerController
@synthesize userInfoController;
@synthesize mainApplicationController;
@synthesize weightTrackerSettings;

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


- (void) initUserInfoController
{
	self.userInfoController =  [[UserInfoController alloc] initWithNibName:@"UserInfo" bundle: nil];
	self.userInfoController.weightTrackerController = self;	
}

- (void) initMainAppController
{
	self.mainApplicationController = [[MainApplicationController alloc] initWithNibName:@"MainApplication" bundle:nil];
	self.mainApplicationController.weightTrackerController = self;
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	//TODO: see memory managemnt	
	self.weightTrackerSettings = [WeightTrackerSettingsFactory createWeightTrackerSettings];
	//self.weightTrackerSettings = [WeightTrackerSettings alloc];
	//[self.weightTrackerSettings init];
	UIViewController *tmpController;
	if(![self.weightTrackerSettings isAppAlreadySetup]){
		[self initUserInfoController];
		tmpController = self.userInfoController;
	} else {
		[self initMainAppController];
		tmpController = self.mainApplicationController;
	}
	
	[self.view insertSubview:tmpController.view atIndex:0];
	[tmpController viewDidAppear:NO];
	
	[tmpController release];
}


-(void) genericSwitchViews:(UIViewController *)oneView otherView:(UIViewController *)otherView{
	UIViewController *toShow;
	UIViewController *toHide;
	UIViewAnimationTransition transitionType;
	
	if(oneView.view.superview == nil){
		toShow = oneView;
		toHide = otherView;
		transitionType = UIViewAnimationTransitionFlipFromRight;
	} else {
		toShow = otherView;
		toHide = oneView;
		transitionType = UIViewAnimationTransitionFlipFromLeft;
	}
	
	
	[UIView beginAnimations:@"View Flip" context:nil];
	[UIView setAnimationDuration:1];
	[UIView setAnimationCurve : UIViewAnimationCurveEaseInOut];
	
	[UIView setAnimationTransition : transitionType  forView: self.view cache:YES];
	[toShow viewWillAppear:YES];
	[toHide viewWillDisappear:YES];
	[toHide.view removeFromSuperview];
	[self.view insertSubview:toShow.view atIndex:0];
	[toHide viewDidDisappear:YES];
	[toShow viewDidAppear:YES];
	
	[UIView commitAnimations];		
}

- (IBAction) switchViews:(id)sender
{	
	if(self.mainApplicationController == nil){				
		[self initMainAppController];				
	} else if(self.userInfoController == nil) {
		[self initUserInfoController];		
	}	
	if(self.userInfoController.view.superview != nil){
		[self.userInfoController save];
	}
	[self genericSwitchViews:self.userInfoController otherView:self.mainApplicationController];
	/*UIViewController *toShow;
	UIViewController *toHide;
	UIViewAnimationTransition transitionType;
	
	if(self.userInfoController.view.superview == nil){
		toShow = userInfoController;
		toHide = mainApplicationController;
		transitionType = UIViewAnimationTransitionFlipFromRight;
	} else {
		toShow = mainApplicationController;
		toHide = userInfoController;
		transitionType = UIViewAnimationTransitionFlipFromLeft;
	}
	
	
	[UIView beginAnimations:@"View Flip" context:nil];
	[UIView setAnimationDuration:1];
	[UIView setAnimationCurve : UIViewAnimationCurveEaseInOut];
	
	[UIView setAnimationTransition : transitionType  forView: self.view cache:YES];
	[toShow viewWillAppear:YES];
	[toHide viewWillDisappear:YES];
	[toHide.view removeFromSuperview];
	[self.view insertSubview:toShow.view atIndex:0];
	[toHide viewDidDisappear:YES];
	[toShow viewDidAppear:YES];
	
	[UIView commitAnimations];*/
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
	[mainApplicationController release];
	[userInfoController release];
    [super dealloc];
}


@end
