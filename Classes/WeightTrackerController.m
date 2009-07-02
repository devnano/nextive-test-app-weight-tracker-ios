//
//  RootViewController.m
//  WeightTracker
//
//  Created by Mariano Heredia on 6/28/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "WeightTrackerController.h"
#import "UIUtils.h"


@implementation WeightTrackerController
@synthesize newWeightCell, weightHistoryCell, shareWeightInfoCell;


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


#pragma mark -
#pragma mark UITableViewDelegate methods




- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
	switch ([indexPath row]){
			//case 0:
			//self.usernameCell.editing=YES;
			//	break;
		case 1:
			//the picker view will appear to select one of the available mail addresses
			//[self showMailPickerView];
			break;
		case 2:
			//the multiple alternatives to select de recipient mail addres will be shown
			//in the correspondent view
			//[self showRecipientMailOptionsView];
			break;		
	}
	
}


@end
