//
//  NAMenuItemView.h
//
//

#import <UIKit/UIKit.h>

@interface NAMenuItemView : UIView {
	NSInteger tag;
}
@property (retain, nonatomic) IBOutlet UIImageView *imageView;
@property (retain, nonatomic) IBOutlet UILabel *label;
@property (retain, nonatomic) IBOutlet UIButton *button;

/**
 * Supports UIButton-style adding targets
 */
- (void)addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;
- (id)initForIP4;

@end
