//
//  RootViewController.m
//  WeightTracker
//
//  Created by Mariano Heredia on 6/28/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "WeightTrackerController.h"
#import "UIUtils.h"
#import "WeightTrackerAppDelegate.h"


@implementation WeightTrackerController
@synthesize newWeightCell, weightHistoryCell, shareWeightInfoCell, newWeightController, weightHistoryController;


- (WeightTrackerAppDelegate *) weightTrackerAppDelegate{
	return (WeightTrackerAppDelegate *) [[UIApplication sharedApplication] delegate];
}


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

- (void)initNewWeightCell{
	self.newWeightCell  = [UIUtils createCellStyleValue1:@"New Weight"];	
}

- (void)initWeigthHistoryCell{
	self.weightHistoryCell  = [UIUtils createCellStyleValue1:@"View/Edit History"];
}
- (void)initShareWeightInfoCell{
	self.shareWeightInfoCell  = [UIUtils createCellStyleValue1:@"Share Weight Info"];
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

#pragma mark UITableViewDelegate related methods

-(void)showNewWeightController{
	if(self.newWeightController == nil){
		self.newWeightController=[[NewWeightController alloc] initWithNibName:@"NewWeightController" bundle:nil];
	}
	[self.newWeightController updateWithLastLog];
	[[self weightTrackerAppDelegate].navController pushViewController:self.newWeightController animated:YES];
	
}

-(void)showWeightHistoryController{
	if(self.weightHistoryController == nil){
		self.weightHistoryController = [[WeightHistoryController alloc] init];
	}
	[[self weightTrackerAppDelegate].navController pushViewController:self.weightHistoryController animated:YES];
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
			//the multiple alternatives to select de recipient mail addres will be shown
			//in the correspondent view
			//[self showRecipientMailOptionsView];
			break;		
	}
	
}


@end
