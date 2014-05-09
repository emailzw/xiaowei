//
//  ViewController.m
//


#import "MenuViewController.h"
#import "NAMenuItem.h"
#import "SampleViewController.h"
#import "XWSearchViewController.h"
#import "XWSearchProductConditonViewController.h"


@interface MenuViewController()
- (NSArray *)createMenuItems;
@end

@implementation MenuViewController

#pragma mark - Memory Management

- (id)init {
	self = [super init];
	
	if (self) {
		[self setMenuItems:[self createMenuItems]];
	}
	
	return self;
}


#pragma mark - Local Methods

- (NSArray *)createMenuItems {
	NSMutableArray *items = [[NSMutableArray alloc] init];
//	NSString *path = [[NSBundle mainBundle] pathForResource:@"search" ofType:@"png"];
//    UIImage *myImage = [UIImage imageWithContentsOfFile:path];

	// First Item
	NAMenuItem *item1 = [[NAMenuItem alloc] initWithTitle:@"产品查询"
													 image:[UIImage imageNamed:@"search.png"]
												   vcClass:[XWSearchProductConditonViewController class]]  ;
	[items addObject:item1];
	
	// Second Item
	NAMenuItem *item2 = [[NAMenuItem alloc] initWithTitle:@"我的留言"
													 image:[UIImage imageNamed:@"message.png"]
												   vcClass:[XWSearchProductConditonViewController class]];
	[items addObject:item2];
	
	// Third Item
	NAMenuItem *item3 = [[NAMenuItem alloc] initWithTitle:@"共公咨询"
													 image:[UIImage imageNamed:@"info.png"]
												   vcClass:[SampleViewController class]];
	[items addObject:item3];
	
	// Fourth Item
	NAMenuItem *item4 = [[NAMenuItem alloc] initWithTitle:@"我的收藏"
													 image:[UIImage imageNamed:@"favorite.png"]
												   vcClass:[SampleViewController class]];
	[items addObject:item4];
	
	// Fifth Item
	NAMenuItem *item5 = [[NAMenuItem alloc] initWithTitle:@"注册信息"
													 image:[UIImage imageNamed:@"register.png"]
												   vcClass:[SampleViewController class]];
	[items addObject:item5];
	
	// Sixth Item
	NAMenuItem *item6 = [[NAMenuItem alloc] initWithTitle:@"密码修改"
													 image:[UIImage imageNamed:@"password.png"]
												   vcClass:[SampleViewController class]];
	[items addObject:item6];
	
	// Seventh Ite
	NAMenuItem *item7 = [[NAMenuItem alloc] initWithTitle:@"关于我们"
													 image:[UIImage imageNamed:@"about.png"]
												   vcClass:[SampleViewController class]];
	[items addObject:item7];
	

	
	return items;
}


#pragma mark - View Lifecycle

//-(UIStatusBarStyle)preferredStatusBarStyle
//{
//    return UIStatusBarStyleLightContent;
//}

- (BOOL)prefersStatusBarHidden
{
    return NO;
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 	return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)viewDidLoad {
	[super viewDidLoad];
    
    
//    UILabel *lbtitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
//    [lbtitle setTextColor:[UIColor whiteColor]];
//    [lbtitle setText:@"小微企业贷款查询"];
//    lbtitle.font = [UIFont boldSystemFontOfSize:18];
//    self.navigationItem.titleView = lbtitle;

	
	self.navigationItem.title = @"小微企业贷款查询";
//    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:77.0f/255.0f green:173.0f/255.0f blue:255.0f/255.0f alpha:1]];
    [[UINavigationBar appearance] setBarTintColor:UIColorFromRGB(0x4dadff)];
    
//	self.view.backgroundColor =   [UIColor colorWithRed:244.0f/255.0f green:244.0f/255.0f blue:245.0f/255.0f alpha:1];
    self.view.backgroundColor =   [UIColor colorWithWhite: 1 alpha:1];
    
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:nil] ;
   [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    
    //不生效
//    [self.navigationItem.backBarButtonItem setBackButtonBackgroundImage:[UIImage imageNamed:@"icon57.png"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
//    
    
//    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] init];
//    backItem.title = @"返回";
//    backItem.tintColor = [UIColor whiteColor];
//    self.navigationItem.backBarButtonItem =  backItem;
    
//    
//    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
//                                                                     [UIColor whiteColor], UITextAttributeTextColor,
//                                                                     [UIColor colorWithRed:0 green:0.7 blue:0.8 alpha:1], UITextAttributeTextShadowColor,
//                                                                     [NSValue valueWithUIOffset:UIOffsetMake(0, 0)], UITextAttributeTextShadowOffset,
//                                                                     [UIFont fontWithName:@"Arial-Bold" size:14], UITextAttributeFont,
//                                                                     nil]];
//
    [self.navigationController.navigationBar setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:
      [UIColor whiteColor],NSForegroundColorAttributeName,
      [UIFont boldSystemFontOfSize:19], NSFontAttributeName, nil]];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];

}

@end
