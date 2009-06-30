//
//  UIUtils.m
//  WeightTracker
//
//  Created by Mariano Heredia on 6/29/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "UIUtils.h"

@implementation UIUtils 
+ (id) loadUIViewFromNib:(NSString *)nibName withOwner:(id) owner{
		id view;
		NSArray *nib = [[NSBundle mainBundle] loadNibNamed:nibName 
													 owner:owner options:nil];
		
#ifdef __IPHONE_2_1
		view = [nib objectAtIndex:0];
#else
		view = [nib objectAtIndex:1];
#endif
	return view;		
	}

@end
