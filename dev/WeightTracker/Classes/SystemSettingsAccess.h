//
//  SystemSettingsAccess.h
//  WeightTracker
//
//  Created by Mariano Heredia on 6/25/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface SystemSettingsAccess : NSObject {

}

+ (NSArray *) availableMailAccounts;
+ (NSString *) deviceUsername;
+ (NSString *) defaultMailAddress;
@end
