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
