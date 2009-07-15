#import <Foundation/Foundation.h>
#import "WeightLogSupport.h"


@interface NSObject(WeightLog) <WeightLogSupport>
-(id) initDefaultValues;
-(NSString *) dateStringWithFormat:(NSString *) format;
-(NSString *) weightStringInUnits:(WeightUnitsOfMeasure) units withDecimalPlaces:(DecimalPlaces) decimalPlaces;
-(void) setWeight:(NSNumber *) value withUnits:(WeightUnitsOfMeasure) units;
-(NSNumber *) weightInUnits:(WeightUnitsOfMeasure) units;
@end
