

#import "UserInfoController.h"
#import "SystemSettingsAccess.h"

@implementation UserInfoController
@synthesize usernameTextField, userMailLabel;
@dynamic username, weightTrackerSettings, userMailAddress;
@synthesize weightTrackerController;
@synthesize userMailPickerController;
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


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	//initialize ui with current data
    [super viewDidLoad];
	if([self.weightTrackerSettings isAppAlreadySetup]){
		[self.weightTrackerSettings loadAppUserInfo:self];
	} else {
		loadSystemSettingsDefaults(self);
	}
	//NSString *username = [self.weightTrackerSettings username];
	//if(username == nil){
	//	username = [SystemSettingsAccess deviceUsername];	
	//}
	//self.usernameTextField.text = username;
	//self.userMailLabel.text = [SystemSettingsAccess defaultMailAddress];
	//[username release];
}
	
- (id<WeightTrackerSettingsSupport> ) weightTrackerSettings{
	return self.weightTrackerController.weightTrackerSettings;
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/
- (IBAction) textFieldDoneEditing:(id)sender
{
	[sender resignFirstResponder];
}
- (void) save
{
//	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"save" message:@"saving" delegate:nil cancelButtonTitle:@"save" otherButtonTitles:nil];
//	[alert show];
//	[alert release];
	[self.weightTrackerSettings setupAppWithUserInfo:self];
	[self.usernameTextField resignFirstResponder];
	//[self.weightTrackerController switchViews:self];	
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
    [super dealloc];
}

- (NSString *) username{
	return [self.usernameTextField text];
}

-(void) setUsername:(NSString *) username{
	self.usernameTextField.text = username;
}
- (NSString *) userMailAddress{
	return [self.userMailLabel text];
}

- (void) setUserMailAddress:(NSString *) mailAddress{
	self.userMailLabel.text = mailAddress;
}

- (void) initMailPickerView{
	self.userMailPickerController = [[UserMailPickerContoller alloc] initWithNibName:@"UserMailPickerView" bundle:nil];
	self.userMailPickerController.caller = self;
}

- (void) showMailPickerView{
	if (self.userMailPickerController == nil){
		[self initMailPickerView];
	}
	[self.weightTrackerController presentModalViewController:userMailPickerController animated:YES]; 
	//[weightTrackerController genericSwitchViews:self otherView:self.userMailPickerController];
}

- (void) hideMailPickerView{
	[self.weightTrackerController dismissModalViewControllerAnimated:YES]; 
//	[self presentModalViewController:picker animated:YES]; 
	//[weightTrackerController genericSwitchViews:self otherView:self.userMailPickerController];
}



- (IBAction) changeMail:(id)sender{
	[self showMailPickerView];
}



@end
