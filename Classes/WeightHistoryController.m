//
//  WeightHistoryController.m
//  WeightTracker
//
//  Created by Mariano Heredia on 7/7/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "WeightHistoryController.h"
#import "WeightLogSupport.h"


@implementation WeightHistoryController
@synthesize weightHistory;

-(id) init{	
	self = [super initWithNibName:@"WeightHistoryController" bundle:nil];	
		
	self.weightHistory = [[WeightHistory alloc]init];	

	return self;		
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

- (void) edit{
	[self.tableView setEditing : !self.tableView.editing animated: YES ];
	if(self.tableView.editing){
		self.navigationItem.rightBarButtonItem.title=@"Done";	
	} else{
		self.navigationItem.rightBarButtonItem.title=@"Edit";
	}
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	UIBarButtonItem *editButton = [[UIBarButtonItem alloc]
								   initWithTitle:@"Edit" 
								   style:UIBarButtonItemStyleDone
								   target:self
								   action:@selector(edit)];
	self.navigationItem.rightBarButtonItem = editButton;	
	[editButton release];
	self.title = @"Weight History";
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void) viewWillAppear:(BOOL) animated{	
	[super viewWillAppear:animated];
	[self.tableView reloadData];
	if(self.tableView.editing){
		[self edit];
	}
	
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
	[self.weightHistory release];
    [super dealloc];
}

#pragma mark -
#pragma mark UITableViewDataSource methods



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	static NSString *weightHistoryCellId  = @"WeightHistoryCell";
	
	UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:weightHistoryCellId]; 
	if(cell == nil){
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:weightHistoryCellId]autorelease];
		cell.detailTextLabel.textAlignment = UITextAlignmentRight;
		cell.textLabel.adjustsFontSizeToFitWidth = YES;
		cell.textLabel.minimumFontSize = 8;
		
	}
	id<WeightLogSupport> weightLog = (id<WeightLogSupport>) [self.weightHistory.weightLogs objectAtIndex:[indexPath row]]; 
	
	
	NSDateFormatter *formater =[[NSDateFormatter alloc] init];
	[formater setDateFormat:@"yyyy-MM-dd"];
	
	cell.textLabel.text = [formater stringFromDate:[weightLog date]];
	cell.detailTextLabel.text = [weightLog weightStringInUnits: [self settings].weightUnitOfMeasure  withDecimalPlaces :kAppDecimalPlaces]; 
	cell.tag = [indexPath row];
	
	return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	return self.weightHistory.count;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{	
	return @"";
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
	return @"";	
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
	[weightHistory remove:[tableView cellForRowAtIndexPath:indexPath].tag ];
	[self.tableView reloadData];
}

#pragma mark UITableViewDelegate related methods



#pragma mark -
#pragma mark UITableViewDelegate methods




- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
	/*NSInteger row = [indexPath row];
	switch (row){
		case 0:
			//date picker
			//[self showDatePickerController];
			break;
		case 1:
			//weight picker
			//the picker view will appear to select one of the available mail addresses
			//[self showScale];
			break;
			
	}*/
	
}



@end
