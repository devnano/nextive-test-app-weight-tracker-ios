//
//  WeightTrackerViewController.h
//  WeightTracker
//
//  Created by Mariano Heredia on 7/10/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "WeightTrackerAppDelegate.h"
#import "WeightTrackerSettingsSupport.h"


@interface UIViewController (WeightTrackerViewController) 

- (WeightTrackerAppDelegate *) weightTrackerAppDelegate;
-(NSObject<WeightTrackerSettingsSupport> *) settings;

@end
