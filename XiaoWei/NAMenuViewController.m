//
//  NAMenuViewController.m
//
//

#import "NAMenuViewController.h"
#import "XWSearchProductConditonViewController.h"

@implementation NAMenuViewController
@synthesize menuItems;

#pragma mark - Memory Management

- (void)dealloc {
	
}


#pragma mark - View lifecycle

- (void)loadView{
	NAMenuView *menuView = [[NAMenuView alloc] init];
	menuView.menuDelegate = self;
	self.view = menuView;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


#pragma mark - NAMenuViewDelegate Methods

- (NSUInteger)menuViewNumberOfItems:(id)menuView {
	NSAssert([self menuItems], @"You must set menuItems before attempting to load.");
	return menuItems.count;
}

- (NAMenuItem *)menuView:(NAMenuView *)menuView itemForIndex:(NSUInteger)index {
	NSAssert([self menuItems], @"You must set menuItems before attempting to load.");
	return [menuItems objectAtIndex:index];
}

- (void)menuView:(NAMenuView *)menuView didSelectItemAtIndex:(NSUInteger)index {
	NSAssert([self menuItems], @"You must set menuItems before attempting to load.");
	
	Class class = [[self.menuItems objectAtIndex:index] targetViewControllerClass];
	UIViewController *viewController = [[class alloc] init] ;
    if([viewController isKindOfClass:XWSearchProductConditonViewController.class]){
        if(self.searchProductConditonViewController){
            viewController = self.searchProductConditonViewController;
        }else{
            self.searchProductConditonViewController =viewController;
        }
    }
     [self.navigationController pushViewController:viewController animated:YES];
}


@end
