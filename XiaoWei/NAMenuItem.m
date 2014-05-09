//
//  NAMenuItem.m
//
//

#import "NAMenuItem.h"

@implementation NAMenuItem
@synthesize title;
@synthesize icon;
@synthesize targetViewControllerClass;

#pragma mark - Memory Management

- (id)initWithTitle:(NSString *)aTitle image:(UIImage *)image vcClass:(Class)targetClass {
	self = [super init];
	
	if (self) {
		title = [aTitle copy];
        icon = image;
		targetViewControllerClass = targetClass;
	}
	
	return self;
}

- (void)dealloc {
  
}

@end
