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
+ (UITableViewCell *) createCellStyleValue1:(NSString *) label{

	UITableViewCell *cell= [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil] autorelease];

	//recommended way for 3.0
	cell.textLabel.text = label;

	[cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];

	return cell;
}

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
