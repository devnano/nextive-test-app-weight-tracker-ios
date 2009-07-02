//
//  NewWeightController.m
//  WeightTracker
//
//  Created by Mariano Heredia on 7/2/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "NewWeightController.h"
#import "UIUtils.h"
#import "WeightTrackerFactory.h"
#import "WeightTrackerAppDelegate.h"


@implementation NewWeightController
@synthesize weightCell, dateCell, datePickerController;
@dynamic weight, date;


/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

- (WeightTrackerAppDelegate *) weightTrackerAppDelegate{
	return (WeightTrackerAppDelegate *) [[UIApplication sharedApplication] delegate];
}

- (void)save{
	//saving the weight log
	[self->weightLog save];
	//getting back to the parent view
	[[self weightTrackerAppDelegate].navController popViewControllerAnimated:YES];
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	UIBarButtonItem *saveButton = [[UIBarButtonItem alloc]
								   initWithTitle:@"Save" 
								   style:UIBarButtonItemStyleDone
								   target:self
								   action:@selector(save)];
	self.navigationItem.rightBarButtonItem = saveButton;	
	[saveButton release];
	self.title = @"New Weight Log";
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
	[weightCell release];
	[dateCell release];
	[self->weightLog release];
    [super dealloc];
}

-(void) updateDateLabel{
	NSDateFormatter *formater =[[NSDateFormatter alloc] init];
	[formater setDateFormat:@"yyyy-MM-dd"];
	self.dateCell.detailTextLabel.text =  [formater stringFromDate:self->weightLog.date];
	[formater release];		
}
-(void) updateWeightLabel{	
	NSString *weightString = [self->weightLog.weight floatValue] == 0.0 ? @"-" :
	[NSString stringWithFormat:@"%@",self->weightLog.weight ];
	self.weightCell.detailTextLabel.text = weightString;	
}

- (void) initWeightLog{
	self->weightLog = [WeightTrackerFactory createWeightLog];
	[self->weightLog retain];
	[self updateDateLabel];
	[self updateWeightLabel];
}

- (void)initWeightCell{	
	self.weightCell  = [UIUtils createCellStyleValue1:@"Weight"];
	//when this cell is initialized, then initialized cell labels
	[self initWeightLog];	
}

- (void)initDateCell{	
	self.dateCell  = [UIUtils createCellStyleValue1:@"Date"];		
}

#pragma mark WeightLogSupport delegate methods

- (NSNumber *) weight{
	return self->weightLog.weight;
}
- (void) setWeight:(NSNumber *)weight{
	self->weightLog.weight = weight;
	[self updateWeightLabel];
}

- (NSDate *) date{
	return self->weightLog.date;
}

- (void) setDate:(NSDate *)date{
	self->weightLog.date = date;
	[self updateDateLabel];
}

#pragma mark -
#pragma mark UITableViewDataSource methods



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	UITableViewCell *cell;
	switch ([indexPath row]) {
		case 0:	
			if(self.dateCell == nil){
				[self initDateCell];
			}
			cell = self.dateCell;			
			break;
			
		case 1:
			if(self.weightCell == nil){
				[self initWeightCell];				
				
			}
			cell = self.weightCell;; 			
			break;
					
		default:
			break;
	}
	return cell;
	
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	return 2;	
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{	
	return @"New Weight Log";
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
	return @"";
	
}

#pragma mark UITableViewDelegate related methods

-(void)showDatePickerController{
	if(self.datePickerController == nil){
		self.datePickerController=[[WeightLogDatePickerController alloc] initWithNibName:@"WeightLogDatePickerController" bundle:nil];
		self.datePickerController.weightLog = self;
	}
	[[self weightTrackerAppDelegate].navController pushViewController:self.datePickerController animated:YES];
	
}


#pragma mark -
#pragma mark UITableViewDelegate methods




- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
	switch ([indexPath row]){
		case 0:
			//date picker
			[self showDatePickerController];
			break;
		case 1:
			//weight picker
			//the picker view will appear to select one of the available mail addresses
			//[self showMailPickerView];
			break;
	
	}
	
}



@end
