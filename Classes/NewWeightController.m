//
//  NewWeightController.m
//  WeightTracker
//
//  Created by Mariano Heredia on 7/2/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "NewWeightController.h"
#import "UIUtils.h"


@implementation NewWeightController
@synthesize weightCell, dateCell;

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
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

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
    [super dealloc];
}


- (void)initWeightCell{
	self.weightCell  = [UIUtils createCellStyleValue1:@"Weight"];	
}

- (void)initDateCell{
	self.dateCell  = [UIUtils createCellStyleValue1:@"Date"];	
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

/*-(void)showNewWeightController{
	if(self.newWeightController == nil){
		self.newWeightController=[[NewWeightController alloc] initWithNibName:@"NewWeightController" bundle:nil];
	}
	[[self weightTrackerAppDelegate].navController pushViewController:self.newWeightController animated:YES];
	
}*/


#pragma mark -
#pragma mark UITableViewDelegate methods




- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
	switch ([indexPath row]){
		case 0:
			//date picker
			//[self showNewWeightController];
			break;
		case 1:
			//weight picker
			//the picker view will appear to select one of the available mail addresses
			//[self showMailPickerView];
			break;
	
	}
	
}



@end
