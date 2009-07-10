//
//  WeightHistory.h
//  WeightTracker
//
//  Created by Mariano Heredia on 7/7/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

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
