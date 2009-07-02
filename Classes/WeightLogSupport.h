/*
 *  WeightLogSupport.h
 *  WeightTracker
 *
 *  Created by Mariano Heredia on 7/2/09.
 *  Copyright 2009 __MyCompanyName__. All rights reserved.
 *
 */


@protocol WeightLogSupport
	@required
		@property (nonatomic, retain) NSNumber *weight;
		@property (nonatomic, retain) NSDate *date;
	@optional
		+(NSArray *) getAllLogs;
		+(NSObject<WeightLogSupport> *) getLastLog;
		-(void) save;
		//gives default values for weight and date
		-(id) init;


@end


