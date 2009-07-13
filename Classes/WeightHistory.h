#import <Foundation/Foundation.h>



@interface WeightHistory : NSObject {
	@private
		NSArray *weightLogs;

}

@property (nonatomic, retain) NSArray *weightLogs;
-(id) init;
//-(void) refresh;
-(NSUInteger) count;
-(void) remove:(NSInteger) i;
-(void) refresh;



@end
