#import "WeightLogDatePickerController.h"

@interface WeightLogDatePickerController ()

- (void) save;

@end


@implementation WeightLogDatePickerController
@synthesize datePickerView, weightLog;


#pragma mark -
#pragma mark Overriden parent callbacks

- (void)viewDidLoad {
    [super viewDidLoad];
	UIBarButtonItem *saveButton = [[UIBarButtonItem alloc]
								   initWithTitle:@"Save" 
								   style:UIBarButtonItemStyleDone
								   target:self
								   action:@selector(save)];
	self.navigationItem.rightBarButtonItem = saveButton;	
	[saveButton release];
	self.title = @"Weight log date";
}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

- (void) viewDidAppear:(BOOL) animated{
	[super viewDidAppear:animated];
	self.datePickerView.date = self.weightLog.date;
}


- (void)dealloc {
	[self.datePickerView release];
	[self.weightLog release];
    [super dealloc];
	
}

#pragma mark -
#pragma mark WeightLogDatePickerController methods

- (void) save{
	self.weightLog.date = [self.datePickerView date];
	[self.navMainApp popViewControllerAnimated:YES];
}




@end
