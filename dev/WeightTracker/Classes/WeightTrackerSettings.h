//
//  WeightTrackerSettings.h
//  WeightTracker
//
//  Created by Mariano Heredia on 6/13/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "/usr/include/sqlite3.h"

#define FILE_NAME @"data.sqlite3"

@protocol WeightTrackerSettingsSupport
	- (BOOL) isAppAlreadySetup;	
	- (void) setupAppWithUserInfo:(id) userInfo;
	@property (retain,nonatomic) NSString * username;
@end


@interface WeightTrackerSettings : NSObject <WeightTrackerSettingsSupport> {
	@private
		BOOL appAlreadySetup;
		sqlite3 *db;
		
}

- (NSString *) dataFilePath;
- (NSInteger) init;
@end
