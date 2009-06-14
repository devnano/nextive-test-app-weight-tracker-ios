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


@interface WeightTrackerSettings : NSObject {
	@private
		BOOL appAlreadySetup;
		sqlite3 *db;
		
}

- (NSString *) dataFilePath;
- (NSInteger) init;
- (BOOL) isAppAlreadySetup;
- (void) setupAppWithUserInfo:(id) userInfo;
@property (readonly) NSString * username;

@end
