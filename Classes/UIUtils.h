#import <UIKit/UIKit.h>

/**
 Util class that provides useful methods.
 */
@interface UIUtils : NSObject {
	
}
/**Loads and returns an UIView from a nib, setting the view owner.
 \param nibName the name of the nib from which the view will be loaded.
 \param owner the owner to be set to the view.
 */
+ (id) loadUIViewFromNib:(NSString *)nibName withOwner:(id) owner;
/**
 Creates a label with style UITableViewCellStyleValue1, and sets label to the main label text. 
 \param label the text to be set to the main label in the cell view.
 */
+ (UITableViewCell *) createCellStyleValue1:(NSString *) label;
/**Sends mail through mail.app.*/	
+ (void) sendMailTo : (NSString *) to withSubject:(NSString *) subject withBody:(NSString *) body;

@end


