/*
 *  ScaleSupport.h
 *  WeightTracker
 *
 *  Created by Mariano Heredia on 7/2/09.
 *  Copyright 2009 __MyCompanyName__. All rights reserved.
 *
 */
#import "WeightLogSupport.h"
#import "WeightUtils.h"



@protocol ScaleSupport	
	//returns the last measurment
	@property (nonatomic, assign) NSNumber *value;	
	@property (nonatomic, retain) NSObject<WeightLogSupport> *owner;
@end




