//
//  WeightLog.h
//  WeightTracker
//
//  Created by Mariano Heredia on 7/2/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SQLitePersistentObject.h"
#import "WeightLogSupport.h"


@interface WeightLogSPO : SQLitePersistentObject<WeightLogSupport> {
	NSNumber *weight;
	NSDate *date;
}


@end
