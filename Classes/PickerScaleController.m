//
//  PickerScaleController.m
//  WeightTracker
//
//  Created by Mariano Heredia on 7/2/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "PickerScaleController.h"
#import "WeightTrackerAppDelegate.h"


@implementation PickerScaleController
@synthesize valuePicker, decimalPlaces, unitsOfMeasure, owner;
@dynamic value;

- (WeightTrackerAppDelegate *) weightTrackerAppDelegate{
	return (WeightTrackerAppDelegate *) [[UIApplication sharedApplication] delegate];
}

- (void) save{
	owner.weight =self.value;
	
	[[self weightTrackerAppDelegate].navController popViewControllerAnimated:YES];
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {    
	UIBarButtonItem *saveButton = [[UIBarButtonItem alloc]
								   initWithTitle:@"Save" 
								   style:UIBarButtonItemStyleDone
								   target:self
								   action:@selector(save)];
	self.navigationItem.rightBarButtonItem = saveButton;	
	[saveButton release];
	self.title = @"Scale";
	[super viewDidLoad];
}





/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

-(id) initWithUnitsOfMeasure:(WeightUnitsOfMeasure)units withDecimalPlaces:(DecimalPlaces)places withValue:(NSNumber *)theValue{
	self = [super initWithNibName:@"PickerScaleController" bundle:nil];
	self.unitsOfMeasure = units;
	self.decimalPlaces = places;
	//posposing the value setting til the viewDidAppear callback
	//self.value = theValue;
	return self;
	
}
-(void)viewDidAppear:(BOOL)animated{
	[super viewDidAppear:animated];
	self.value = [owner weightInUnits:self.unitsOfMeasure];
}

-(void) setValue:(NSNumber *) value{	
	//todo: obtain componentes
	NSString *format = [NSString stringWithFormat:@"%%.%df", [self decimalPlaces]];
	NSString *valueStr = [NSString stringWithFormat:format, [value floatValue]];
	NSArray *components = [valueStr componentsSeparatedByString:@"."];
	//the first component respresentes the integer part
	[self.valuePicker selectRow:[[components objectAtIndex:0] integerValue] inComponent:0 animated:YES];
	//the remainging decimal values, are inside the second component
	NSString *decimals = [components objectAtIndex:1];
	
	for(int i =0; i<self.decimalPlaces; i++ ){
		unichar *decimal = malloc(sizeof(unichar));
		decimal[0] = [decimals characterAtIndex:i];
		
		NSInteger selected =  [[NSString stringWithCharacters:decimal length:1] integerValue];
		[self.valuePicker selectRow:selected inComponent:i+1 animated:YES];
		free(decimal);
	}	
}
-(NSNumber *) value{
	NSMutableString *valueStr = [[NSMutableString alloc]initWithString:@""];
	for(int i =0; i<=self.decimalPlaces; i++ ){		
		[valueStr appendString:[NSString stringWithFormat:@"%d", [self.valuePicker selectedRowInComponent:i] ]];
		if(i==0){
			[valueStr appendString:@"."];
		}
		
	}
	
	return [NSNumber numberWithFloat:[valueStr floatValue]];	
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
	[self.valuePicker release];
    [super dealloc];
}

#pragma mark -
#pragma mark UIPickerViewDataSource methods
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
	return 1 + self.decimalPlaces;
	
}

- (NSInteger) numberOfUnits{
	NSInteger n;
	switch (self.unitsOfMeasure) {
		case Kilograms:
			n = kScaleMaxInKg;
			break;
			
		case Pounds:
			n = [kilogramsToPounds([NSNumber numberWithFloat: kScaleMaxInKg]) integerValue];
			break;
	}
	return n;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
	NSInteger n;
	switch (component) {
		case 0:
			n = [self numberOfUnits];			
			break;
		default:
			//decimal places
			n = 10;
			break;
	}
	return n;
	
}


#pragma mark -
#pragma mark UIPickerViewDelegate methods
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
	return [NSString stringWithFormat:@"%d", row];
}


@end
