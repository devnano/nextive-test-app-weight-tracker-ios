#import "WeightTrackerController.h"
#import "UIUtils.h"


@interface WeightTrackerController()

-(void)showWeightHistoryController;
-(void)showNewWeightController;
- (void)initShareWeightInfoCell;
- (void)initWeigthHistoryCell;
- (void)initNewWeightCell;
-(void)showComposerSheet;

@end


@implementation WeightTrackerController
@synthesize newWeightCell, weightHistoryCell, shareWeightInfoCell, newWeightController, weightHistoryController;



#pragma mark -
#pragma mark Overriden parent callbacks

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	self.title = @"Weight Tracker";
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
    [super dealloc];
	[self.newWeightCell release];
	[self.weightHistoryCell release];
	[self.newWeightController release];
	[self.shareWeightInfoCell release];
	[self.weightHistoryController release];
}

#pragma mark -
#pragma mark WeightTrackerController methods

- (void)initNewWeightCell{
	self.newWeightCell  = [UIUtils createCellStyleValue1:@"New Weight"];	
}

- (void)initWeigthHistoryCell{
	self.weightHistoryCell  = [UIUtils createCellStyleValue1:@"View/Edit History"];
}

- (void)initShareWeightInfoCell{
	self.shareWeightInfoCell  = [UIUtils createCellStyleValue1:@"Share Weight Info"];
}

-(void)showNewWeightController{
	if(self.newWeightController == nil){
		self.newWeightController=[[NewWeightController alloc] initWithNibName:@"NewWeightController" bundle:nil];
	}
	[self.newWeightController updateWithLastLog];
	[self.navMainApp pushViewController:self.newWeightController animated:YES];
	
}

-(void)showWeightHistoryController{
	if(self.weightHistoryController == nil){
		self.weightHistoryController = [[WeightHistoryController alloc] init];
	}
	[self.navMainApp pushViewController:self.weightHistoryController animated:YES];
}

// Displays an email composition interface inside the application. Populates all the Mail fields. 
-(void)showComposerSheet 
{
	MFMailComposeViewController *picker = [[MFMailComposeViewController alloc] init];
	picker.mailComposeDelegate = self;
	
	[picker setSubject:@"My Weight History"];
	
	
	// Set up recipients
	//NSArray *toRecipients = [self settings].userMailAddress; 
	NSArray *toRecipients = [NSArray arrayWithObject:[self settings].recipientMailAddress]; 
	//NSArray *toRecipients = toRecipients;
	
	
	[picker setToRecipients:toRecipients];
	//[picker setCcRecipients:ccRecipients];	
	//[picker setBccRecipients:bccRecipients];
	if(self.weightHistoryController == nil){
		self.weightHistoryController = [[WeightHistoryController alloc] init];
	}
	
	
	[self.weightHistoryController.weightHistory refresh];
	
	NSArray *weightLogs = [self.weightHistoryController.weightHistory weightLogs];
	NSMutableString *entriesCsv = [NSMutableString stringWithFormat:@"date, weight (%@)\n", self.weighningUnitsStr];
	
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask , YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	NSString *documentName = [documentsDirectory stringByAppendingPathComponent:@"weight.csv"];
	
	for(int i=0; i<[weightLogs count]; i++){
		id<WeightLogSupport> log = [weightLogs objectAtIndex:i];		
		[entriesCsv appendFormat:@"%@, %@\n", [log  dateStringWithFormat:@"yyyy-MM-dd"], [log weightStringInUnits:[self settings].weightUnitOfMeasure withDecimalPlaces:kAppDecimalPlaces]];
	}
	NSError *error = [[NSError alloc] init];
	if(![entriesCsv writeToFile:documentName atomically:NO encoding:NSASCIIStringEncoding error:&error]) {
		[error release];
	}
	
	
	//fopen(documentName, "rw");
	// Attach an image to the email
	//NSString *path = [[NSBundle mainBundle] pathForResource:@"rainy" ofType:@"png"];
	//[entriesCsv cString];
	//TODO: see if can make the NSData directly from string
	//[NSData dataWithBytes:[entriesCsv cStringUsingEncoding:NSASCIIStringEncoding] length:[entriesCsv count];
	
	
	
    NSData *myData = [NSData dataWithContentsOfFile:documentName];
	[picker addAttachmentData:myData mimeType:@"text/plain" fileName:@"weightHistory"];
	
	// Fill out the email body text
	NSString *emailBody = [NSString stringWithFormat:@"I'm sending you an up to date weight history.\n%@", entriesCsv];
	[picker setMessageBody:emailBody isHTML:NO];
	
	[self presentModalViewController:picker animated:YES];
    [picker release];
}



#pragma mark -
#pragma mark UITableViewDataSource methods

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	UITableViewCell *cell;
	switch ([indexPath row]) {
		case 0:	
			if(self.newWeightCell == nil){
				[self initNewWeightCell];				
				
			}
			cell = self.newWeightCell;; 			
			break;
		case 1:
			if(self.weightHistoryCell == nil){
				[self initWeigthHistoryCell];
			}
			cell = self.weightHistoryCell;			
			break;
		case 2:
			cell = self.shareWeightInfoCell;
			if(self.shareWeightInfoCell == nil){
				[self initShareWeightInfoCell];
			}
			cell = self.shareWeightInfoCell;
			break;		
		default:
			break;
	}
	return cell;
	
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	return 3;	
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{	
	return @"Weight Tracking";
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
	return @"";
	
}

#pragma mark -
#pragma mark UITableViewDelegate methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
	switch ([indexPath row]){
		case 0:
			[self showNewWeightController];
			break;
		case 1:			
			[self showWeightHistoryController];
			break;
		case 2:
			
			// We must always check whether the current device is configured for sending emails
			if ([MFMailComposeViewController canSendMail])
			{
				[self showComposerSheet];
			}
			
			break;		
	}
	
}

#pragma mark -
#pragma mark Compose Mail


// Dismisses the email composition interface when users tap Cancel or Send. Proceeds to update the message field with the result of the operation.
- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error 
{	
	//message.hidden = NO;
	// Notifies users about errors associated with the interface
	switch (result)
	{
		case MFMailComposeResultCancelled:
			//message.text = @"Result: canceled";
			break;
		case MFMailComposeResultSaved:
			//message.text = @"Result: saved";
			break;
		case MFMailComposeResultSent:
			//message.text = @"Result: sent";
			break;
		case MFMailComposeResultFailed:
			//message.text = @"Result: failed";
			break;
		default:
			//message.text = @"Result: not sent";
			break;
	}
	[self dismissModalViewControllerAnimated:YES];
}




@end
