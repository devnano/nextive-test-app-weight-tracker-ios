#import "NewWeightController.h"
#import "UIUtils.h"
#import "WeightTrackerFactory.h"
//note that this should be located in a factory, in order to let the scale be changed more easily
#import "PickerScaleController.h"

@interface NewWeightController()
- (void)save;
-(void) updateDateLabel;
-(void) updateWeightLabel;
- (void) initWeightLog;
- (void)updateWithLastLog;
- (void)initWeightCell;
- (void)initDateCell;
-(void) showScale;
-(void)showDatePickerController;
@end



@implementation NewWeightController
@synthesize weightCell, dateCell, datePickerController, scale;
@dynamic weight, date;


#pragma mark -
#pragma mark Overriden parent callbacks

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

#pragma mark -
#pragma mark NewWeightController methods
- (void)save{
	//saving the weight log
	[self->weightLog save];
	//getting back to the parent view
	[self.navMainApp popViewControllerAnimated:YES];
}

-(void) updateDateLabel{
	//pre: self.dateCell has already been initialized	
	self.dateCell.detailTextLabel.text =  [self->weightLog dateStringWithFormat:@"yyyy-MM-dd"];
	self.datePickerController.datePickerView.date = self->weightLog.date;		
}

-(void) updateWeightLabel{		
	//pre: self.weightCell has already been initialized	
	NSString *units = self.weighningUnitsStr;
	NSString *weightStr =  [self weightStringInUnits: [self settings].weightUnitOfMeasure  withDecimalPlaces :kAppDecimalPlaces];	
	self.weightCell.detailTextLabel.text = [NSString stringWithFormat:@"%@ %@", weightStr, units];	
}

- (void) initWeightLog{
	if(self->weightLog != nil){
		[self->weightLog release];
	}
	self->weightLog = [WeightTrackerFactory createWeightLog];
	[self->weightLog retain];
	[self updateDateLabel];
	[self updateWeightLabel];
}

- (void)updateWithLastLog {  
	//if both cells have not been init yet, don't try to update them
	//(this can happend when an outsider calls this update method)
	if(self.dateCell && self.weightCell){
		[self initWeightLog];
	}
}

- (void)initWeightCell{	
	self.weightCell  = [UIUtils createCellStyleValue1:@"Weight"];
	//when this cell is initialized, then initialized cell labels
	[self initWeightLog];
}

- (void)initDateCell{	
	self.dateCell  = [UIUtils createCellStyleValue1:@"Date"];		
}

-(void)showDatePickerController{
	if(self.datePickerController == nil){
		self.datePickerController=[[WeightLogDatePickerController alloc] initWithNibName:@"WeightLogDatePickerController" bundle:nil];
		//setting the reference to the data source and destination for the picker
		self.datePickerController.weightLog = self;
	}
	[self.navMainApp pushViewController:self.datePickerController animated:YES];
	
}
//TODO: MOVE THIS FACTORY METHODS TO THE APP FACTORY
+(NSObject<ScaleSupport> *) createScaleWithUnitsOfMeasure:(WeightUnitsOfMeasure)units withDecimalPlaces:(DecimalPlaces)places withValue:(NSNumber *)theValue{
	PickerScaleController *pickerScaleController = [[PickerScaleController alloc] initWithNibName:@"PickerScaleController" bundle:nil];
	pickerScaleController.value = theValue;
	return pickerScaleController;
}


-(void) showScale{
	if(self.scale == nil){
		NSObject<WeightTrackerSettingsSupport> *settings = self.settings;
		//HARDCODING DECIMAL PLACES, IS NOT CLEAR IF IS A REQUIREMENT BUT WILL BE EASILY PLUGGED IF NEEDED
		self.scale = [NewWeightController createScaleWithUnitsOfMeasure:settings.weightUnitOfMeasure withDecimalPlaces:kAppDecimalPlaces withValue:[self->weightLog weightInUnits:[self settings].weightUnitOfMeasure]];
		self.scale.owner = self;
	}
	//Trusting in scale UIViewController hierachy belonging....
	[self.navMainApp pushViewController:self.scale animated:YES];
}

#pragma mark -
#pragma mark WeightLogSupport protocol methods

- (NSNumber *) weight{
	return self->weightLog.weight;
}
- (void) setWeight:(NSNumber *)weight{
	[self->weightLog setWeight:weight withUnits:[self settings].weightUnitOfMeasure];
	[self updateWeightLabel];
}
-(NSNumber *) weightInUnits:(WeightUnitsOfMeasure) units{
	return [self->weightLog weightInUnits:units];
}

-(NSString *) weightStringInUnits:(WeightUnitsOfMeasure) units withDecimalPlaces:(DecimalPlaces) decimalPlaces{
	return [self->weightLog weightStringInUnits:units withDecimalPlaces: decimalPlaces];
	
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





#pragma mark -
#pragma mark UITableViewDelegate methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
	NSInteger row = [indexPath row];
	switch (row){
		case 0:
			//date picker
			[self showDatePickerController];
			break;
		case 1:
			//weight picker
			//the picker view will appear to select one of the available mail addresses
			[self showScale];
			break;
	
	}
	
}



@end
