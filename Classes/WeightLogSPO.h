#import <Foundation/Foundation.h>
#import "SQLitePersistentObject.h"
#import "WeightLogSupport.h"


@interface WeightLogSPO : SQLitePersistentObject<WeightLogSupport> {
	NSNumber *weight/**<\sa WeightLogSupport::weight*/;
	NSDate *date/**<\sa WeightLogSupport::date*/;
}


@end
