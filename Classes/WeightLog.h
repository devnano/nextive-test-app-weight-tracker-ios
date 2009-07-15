#import <Foundation/Foundation.h>
#import "WeightLogSupport.h"
#import "SqliteBaseObject.h"


@interface WeightLog : SqliteBaseObject<WeightLogSupport> {
	NSNumber *weight/**<\sa WeightLogSupport::weight*/;
	NSDate *date/**<\sa WeightLogSupport::date*/;
	NSInteger weightLogId/**<\sa WeightLogSupport::weightLogId*/;
}

@end
