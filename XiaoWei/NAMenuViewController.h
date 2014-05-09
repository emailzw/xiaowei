//
//  NAMenuViewController.h
//
//

#import "NAMenuView.h"
#import "XWSearchProductConditonViewController.h"

@interface NAMenuViewController : UIViewController<NAMenuViewDelegate>

@property (nonatomic, retain) NSArray *menuItems;
@property (nonatomic, retain)  XWSearchProductConditonViewController *searchProductConditonViewController;

@end
