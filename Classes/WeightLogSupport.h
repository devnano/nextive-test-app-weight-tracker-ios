#import "WeightUtils.h"

/**
 Defines a weight log entry data and utility methods.
 */
@protocol WeightLogSupport
	@required
		/***Weight in kilograms*/
		@property (nonatomic, retain) NSNumber *weight;
		/**Weight of the weighing log*/
		@property (nonatomic, retain) NSDate *date;
	@optional
		/**If applies, the class adopting this protocol should give information about the 
		 unique object identifier. */
		@property (nonatomic) NSInteger weightLogId;
		/**\return  all weighing logs.*/
		+(NSArray *) allLogs;
		/**\return last weighing log.*/
		+(NSObject<WeightLogSupport> *) getLastLog;
		/**
		 Deletes a weight log.
		 \param weightLogId the unique object identifer of the object to be deleted. */
		+(void) removeWeightLogWithId:(NSInteger) weightLogId;
		/**
		 Make the current state persistent i.e. Saves weight, date and weightLogId.
		 */
		-(void) save;
		/**gives default values for weight and date i.e. last logged values.*/
		-(id) initDefaultValues;
		/**
		 \param units to be used to represent the weight in this instance.
		 \return weight in <b>units</b> units.
		 \sa WeightUnitsOfMeasure
		 */
		-(NSNumber *) weightInUnits:(WeightUnitsOfMeasure) units;
		/**
		 \param decimalPlaces Decimal places to include in weight.
		 \param units to be used to represent the weight in this instance.
		 \return weight in <b>units</b> units as string with <b>decimalPlaces</b> decimal places.
		*/
		-(NSString *) weightStringInUnits:(WeightUnitsOfMeasure) units  withDecimalPlaces:(DecimalPlaces) decimalPlaces;
		/**
		 Gives the log date, with the given <b>format</b>.
		 \param format the format to use.
		 \sa NSDateFormatter
		 */
		-(NSString *) dateStringWithFormat:(NSString *) format;
		/**
		 Sets (WeightLogSupport::weight), converting if needed from <b>units</b> to <b>kilograms</b>.
		 \param units the unit taken into account to convert from.		 
		 \param weight the number of unitsOfMeasure to be converted.
		 */
		-(void) setWeight:(NSNumber *) weight withUnits:(WeightUnitsOfMeasure) units;
@end


