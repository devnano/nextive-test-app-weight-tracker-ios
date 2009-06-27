
#import "UserMailPickerContoller.h"
#import "SystemSettingsAccess.h"


@implementation UserMailPickerContoller

@synthesize mailPicker;
@synthesize availableMailAccounts, caller;

- (IBAction) mailChosen:(id) sender{
	NSInteger row = [self.mailPicker selectedRowInComponent:0];
	NSString *mailSelected = [self.availableMailAccounts objectAtIndex:row];
	[self.caller setUserMailAddress : mailSelected];
	[self.caller hideMailPickerView];
	
	[mailSelected release];
	
}

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
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


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
//	self.mailPicker.picke
	self.availableMailAccounts = [SystemSettingsAccess availableMailAccounts];	
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[self.mailPicker release];
	[self.availableMailAccounts release];
	[self.caller release];
	[super dealloc];
}




- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
	return 1;
}


- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
	return [self.availableMailAccounts count];	
}


- (NSString *) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger) row forComponent: (NSInteger) component{
	
	return [self.availableMailAccounts objectAtIndex:row];
}







@end
