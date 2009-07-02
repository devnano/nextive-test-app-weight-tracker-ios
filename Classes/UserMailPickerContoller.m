
#import "UserMailPickerContoller.h"
#import "SystemSettingsAccess.h"
#import "WeightTrackerAppDelegate.h"


@implementation UserMailPickerContoller

@synthesize mailPicker;
@synthesize availableMailAccounts, caller;

- (IBAction) mailChosen{
	NSInteger row = [self.mailPicker selectedRowInComponent:0];
	NSString *mailSelected = [self.availableMailAccounts objectAtIndex:row];
	self.caller.userMailAddress = mailSelected;
	//[self.caller hideMailPickerView];
	
	[mailSelected release];
	WeightTrackerAppDelegate *app = (WeightTrackerAppDelegate *) [[UIApplication sharedApplication] delegate];
	UINavigationController *navSettings = [app navSettings];
	[navSettings popViewControllerAnimated:YES];
	
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	//initializing accounts to let the user chose one
	self.availableMailAccounts = [SystemSettingsAccess availableMailAccounts];	
	//
	//SEL selector = @selector(mailChosen);
	//BOOL responds =[self respondsToSelector:@selector(mailChosen)]; 
	//NSLog(@"%@", responds);
	UIBarButtonItem *saveButton = [[UIBarButtonItem alloc]
								   initWithTitle:@"Save" 
								   style:UIBarButtonItemStyleDone
								   target:self
								   action:@selector(mailChosen)];
	self.navigationItem.rightBarButtonItem = saveButton;
	self.title = @"User Mail Choice";
	[saveButton release];
	
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
