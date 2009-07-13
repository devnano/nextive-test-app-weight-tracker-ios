#import "PickerScaleController.h"



@implementation PickerScaleController
@synthesize valuePicker, owner;
@dynamic value;

- (void) save{
	owner.weight =self.value;
	
	[self.navMainApp popViewControllerAnimated:YES];
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



-(void) viewWillAppear:(BOOL)animated{
	[super viewWillAppear:animated];
//	for(int i=NoDecimalPlaces; i<=self.decimalPlaces; i++){
		//sets the main units being entered by the user in the first componenet of the picker (i.e. kg, lb)
		[self.valuePicker addLabel:stringForDecimalPlaceAndUnits(self.settings.weightUnitOfMeasure, NoDecimalPlaces) forComponent:0 forLongestString:nil];
	//}

	
	
}
-(void)viewDidAppear:(BOOL)animated{
	[super viewDidAppear:animated];
	self.value = [owner weightInUnits:self.settings.weightUnitOfMeasure];
}

-(void) setValue:(NSNumber *) value{		
	NSString *format = [NSString stringWithFormat:@"%%.%df", kAppDecimalPlaces];
	NSString *valueStr = [NSString stringWithFormat:format, [value floatValue]];
	NSArray *components = [valueStr componentsSeparatedByString:@"."];
	//the first component respresentes the integer part
	[self.valuePicker selectRow:[[components objectAtIndex:0] integerValue] inComponent:0 animated:YES];
	//the remainging decimal values, are inside the second component
	NSString *decimals = [components objectAtIndex:1];
	
	for(int i =0; i<kAppDecimalPlaces; i++ ){
		//parsing each unichar of the remaining component
		//todo to use atoi instead
		unichar *decimal = malloc(sizeof(unichar));
		decimal[0] = [decimals characterAtIndex:i];
		
		NSInteger selected =  [[NSString stringWithCharacters:decimal length:1] integerValue];
		[self.valuePicker selectRow:selected inComponent:i+1 animated:YES];
		free(decimal);
	}	
}
-(NSNumber *) value{
	NSMutableString *valueStr = [[NSMutableString alloc]initWithString:@""];
	for(int i =0; i<=kAppDecimalPlaces; i++ ){		
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
	return 1 + kAppDecimalPlaces;
	
}

- (NSInteger) numberOfUnits{
	NSInteger n;
	switch (self.settings.weightUnitOfMeasure) {
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

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{}


@end
