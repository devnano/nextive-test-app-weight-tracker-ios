//
//  Utils.m
//  WeightTracker
//
//  Created by Mariano Heredia on 6/14/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Utils.h"


@implementation Utils

//builds a mail url as recommended in iCodeblog
+ (void) sendMailTo : (NSString *) to withSubject:(NSString *) subject withBody:(NSString *) body
{
	NSString *mailString = [NSString stringWithFormat:@"mailto:?to=%@&subject=%@&body=%@", 
							[to stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding], 
							[subject stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding],
							[body stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding]];
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:mailString]];
							
}


@end
