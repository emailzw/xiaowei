//
//  ViewController.m
//


#import "MainPage.h"
#import "SampleViewController.h"
#import "XWSearchViewController.h"
#import "XWSearchProductConditonViewController.h"
#import "XWMyMessageController.h"
#import "XWRegisterController.h"
#import "XWMyfavolistViewController.h"
#import "XWNewinfoViewController.h"
#import "XWAboutViewController.h"
#import "XWChangePasswordViewController.h"
#import "XWRegisterTabViewController.h"
#import "XWComanyResiterController.h"
#import "XWLoginController.h"
#import "TOWebViewController.h"
#import "NAMenuItemView.h"
#import "WeixinSessionActivity.h"
#import "WeixinTimelineActivity.h"
#import "XWSearchResultItem.h"
#import "XWMyinfoTabViewController.h"
#import "XWMessageListItem.h"

@interface MainPage(){
    NSArray *activity;
}
@end

@implementation MainPage

#pragma mark - Memory Management

- (id)init {
	self = [super init];
	
	
	return self;
}



- (void)layoutSubviews {
    //	[super layoutSubviews];
    //登录信息
    
    
    NSString *uid =  [[NSUserDefaults standardUserDefaults] objectForKey:LOGIN];
    NSString *uname =  [[NSUserDefaults standardUserDefaults] objectForKey:LOGIN_NAME];
    
    
    NSLog([NSString stringWithFormat:@"userlogin:%@",uname ]);
    
    
    
  
    
}

#pragma mark - Local Methods


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
 	//return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    return false;
}


- (NSUInteger)supportedInterfaceOrientations
{
    return NO;
}



- (BOOL)shouldAutorotate
{
    return NO;
}

- (void)viewWillAppear:(BOOL)animated
{
    
    
    NSString *uid =  [[NSUserDefaults standardUserDefaults] objectForKey:LOGIN];
    NSString *uname =  [[NSUserDefaults standardUserDefaults] objectForKey:LOGIN_NAME];
    
    
    NSLog([NSString stringWithFormat:@"userlogin1111:%@",uname ]);
    
    
    
}

- (void)viewDidLoad {
	[super viewDidLoad];
    activity = @[[[WeixinSessionActivity alloc] init], [[WeixinTimelineActivity alloc] init]];
    
    
    //    UILabel *lbtitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    //    [lbtitle setTextColor:[UIColor whiteColor]];
    //    [lbtitle setText:@"小微企业贷款查询"];
    //    lbtitle.font = [UIFont boldSystemFontOfSize:18];
    //    self.navigationItem.titleView = lbtitle;
    
    
	self.navigationItem.title = @"小微企业贷款查询";
    //    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:77.0f/255.0f green:173.0f/255.0f blue:255.0f/255.0f alpha:1]];
    [[UINavigationBar appearance] setBarTintColor:UIColorFromRGB(0x4dadff)];
    
    //	self.view.backgroundColor =   [UIColor colorWithRed:244.0f/255.0f green:244.0f/255.0f blue:245.0f/255.0f alpha:1];
    // self.view.backgroundColor =   [UIColor colorWithWhite: 1 alpha:1];
    self.view.backgroundColor =   [UIColor clearColor];
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
    
    
    //背景图片
    NSString *path = [[NSBundle mainBundle] pathForResource:@"middle" ofType:@"png"];
    UIImage *middleimg = [UIImage imageWithContentsOfFile:path];
    CGSize iconsize; ;
    iconsize.height=151;
    iconsize.width=320;
    UIImage *resizedImage = [self imageWithImage:middleimg scaledToSize:iconsize];
    UIImageView *resizedImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,63, 320, 151)];
    resizedImageView.image = resizedImage;
    resizedImageView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:resizedImageView];
    
    
    path = [[NSBundle mainBundle] pathForResource:@"bottom" ofType:@"png"];
    UIImage *bottomimg = [UIImage imageWithContentsOfFile:path];
    iconsize.height=349;
    iconsize.width=320;
    resizedImage = [self imageWithImage:bottomimg scaledToSize:iconsize];
    resizedImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,214, 320, 355)];
    resizedImageView.image = resizedImage;
    resizedImageView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:resizedImageView];
    
    
    //登录信息
    
    
    NSString *uid =  [[NSUserDefaults standardUserDefaults] objectForKey:LOGIN];
    NSString *uname =  [[NSUserDefaults standardUserDefaults] objectForKey:LOGIN_NAME];
    
    
    NSLog([NSString stringWithFormat:@"userlogin:%@",uname ]);
    
    
    //按钮
    //产品查询
    NAMenuItemView *itemView = [[NAMenuItemView alloc] init];
    path = [[NSBundle mainBundle] pathForResource:@"query" ofType:@"png"];
    middleimg = [UIImage imageWithContentsOfFile:path];
    iconsize.height=151;
    iconsize.width=320;
    resizedImage = [self imageWithImage:middleimg scaledToSize:iconsize];
    
    itemView.frame = CGRectMake(20,230, 60, 60);
    itemView.label.text = @"产品查询";
    itemView.imageView.image = resizedImage;
    [itemView addTarget:self action:@selector(queryProduct:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:itemView];
    
    
    //我的留言
    itemView = [[NAMenuItemView alloc] init];
    path = [[NSBundle mainBundle] pathForResource:@"message" ofType:@"png"];
    middleimg = [UIImage imageWithContentsOfFile:path];
    iconsize.height=151;
    iconsize.width=320;
    resizedImage = [self imageWithImage:middleimg scaledToSize:iconsize];
    
    itemView.frame = CGRectMake(115,230, 60, 60);
    itemView.label.text = @"我的留言";
    itemView.imageView.image = resizedImage;
    [itemView addTarget:self action:@selector(myMessage:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:itemView];
    
    
    itemView = [[NAMenuItemView alloc] init];
    path = [[NSBundle mainBundle] pathForResource:@"info" ofType:@"png"];
    middleimg = [UIImage imageWithContentsOfFile:path];
    iconsize.height=151;
    iconsize.width=320;
    resizedImage = [self imageWithImage:middleimg scaledToSize:iconsize];
    
    itemView.frame = CGRectMake(205,230, 60, 60);
    itemView.label.text = @"公共资讯";
    itemView.imageView.image = resizedImage;
    [itemView addTarget:self action:@selector(info:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:itemView];
    
    
    
    //第二排
    
    //按钮
    //我的收藏
    itemView = [[NAMenuItemView alloc] init];
    path = [[NSBundle mainBundle] pathForResource:@"favorite" ofType:@"png"];
    middleimg = [UIImage imageWithContentsOfFile:path];
    iconsize.height=151;
    iconsize.width=320;
    resizedImage = [self imageWithImage:middleimg scaledToSize:iconsize];
    
    itemView.frame = CGRectMake(20,330, 60, 60);
    itemView.label.text = @"我的收藏";
    itemView.imageView.image = resizedImage;
    [itemView addTarget:self action:@selector(favorit:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:itemView];
    
    
    //注册信息
    itemView = [[NAMenuItemView alloc] init];
    path = [[NSBundle mainBundle] pathForResource:@"register" ofType:@"png"];
    middleimg = [UIImage imageWithContentsOfFile:path];
    iconsize.height=151;
    iconsize.width=320;
    resizedImage = [self imageWithImage:middleimg scaledToSize:iconsize];
    
    itemView.frame = CGRectMake(115,330, 60, 60);
    itemView.label.text = @"注册信息";
    itemView.imageView.image = resizedImage;
    [itemView addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:itemView];
    
    //密码修改
    itemView = [[NAMenuItemView alloc] init];
    path = [[NSBundle mainBundle] pathForResource:@"password" ofType:@"png"];
    middleimg = [UIImage imageWithContentsOfFile:path];
    iconsize.height=151;
    iconsize.width=320;
    resizedImage = [self imageWithImage:middleimg scaledToSize:iconsize];
    
    itemView.frame = CGRectMake(205,330, 60, 60);
    itemView.label.text = @"密码修改";
    itemView.imageView.image = resizedImage;
    [itemView addTarget:self action:@selector(password:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:itemView];
    
    
    
    //第三排
    
    //按钮
    //关于我们
    itemView = [[NAMenuItemView alloc] init];
    path = [[NSBundle mainBundle] pathForResource:@"about" ofType:@"png"];
    middleimg = [UIImage imageWithContentsOfFile:path];
    iconsize.height=151;
    iconsize.width=320;
    resizedImage = [self imageWithImage:middleimg scaledToSize:iconsize];
    
    itemView.frame = CGRectMake(20,430, 60, 60);
    itemView.label.text = @"关于我们";
    itemView.imageView.image = resizedImage;
    [itemView addTarget:self action:@selector(about:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:itemView];
    
    /*
    //分享
    itemView = [[NAMenuItemView alloc] init];
    path = [[NSBundle mainBundle] pathForResource:@"share" ofType:@"png"];
    middleimg = [UIImage imageWithContentsOfFile:path];
    iconsize.height=151;
    iconsize.width=320;
    resizedImage = [self imageWithImage:middleimg scaledToSize:iconsize];
    
    itemView.frame = CGRectMake(115,430, 60, 60);
    itemView.label.text = @"分享";
    itemView.imageView.image = resizedImage;
    [itemView addTarget:self action:@selector(share:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:itemView];
    */
    
    //网址
    UITextView *utl = [[UITextView alloc] initWithFrame:CGRectMake(0, 530, 320, 38)];
    utl.text = @"http://loan.sbacn.org";
    utl.backgroundColor = [UIColor clearColor];
    utl.editable = NO;
    utl.dataDetectorTypes = UIDataDetectorTypeAll;
    utl.font = [UIFont systemFontOfSize:14];
    utl.textColor =UIColorFromRGB(0x6e6e6e);
    utl.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:utl];
    
    
}



- (UIImage*)imageWithImage:(UIImage*)image
              scaledToSize:(CGSize)newSize;
{
    UIGraphicsBeginImageContext( newSize );
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}


- (void)queryProduct:(UIButton *)sender {
	NSParameterAssert(sender);
    
    XWSearchProductConditonViewController *viewController = [[XWSearchProductConditonViewController alloc] init] ;
    viewController.navigationController = self.navigationController;
    [self.navigationController pushViewController:viewController animated:YES];
    
}


- (void)myMessage:(UIButton *)sender {
	NSParameterAssert(sender);
    
    
    
    
    
    
    NSString *uid =  [[NSUserDefaults standardUserDefaults] objectForKey:LOGIN];
    
    if (uid == nil){
        
        UIAlertView *view = [[UIAlertView alloc] initWithTitle:@"登录提示"    //标题
                                                       message:@"该功能需要登录后使用，您目前还没有登录。"   //显示内容
                                                      delegate:self          //委托，可以点击事件进行处理
                                             cancelButtonTitle:@"取消"
                                             otherButtonTitles:@"登录"
                             //,@"其他",    //添加其他按钮
                             ,nil];
        view.tag=100;
        [view show];
        return;
    }
    
    
    
    //我的留言内容
    
    NSMutableString  *url =  [[NSMutableString alloc] initWithString:SERVER_URL];
    [url appendString: [NSString  stringWithFormat: @"message/%@",uid]];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    
    
    UIActivityIndicatorView *activityIndicator;
    activityIndicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 32.0f, 32.0f)];
    CGPoint center  = CGPointMake(self.view.center.x, self.view.center.y-50);
    [activityIndicator setCenter:center];
    [activityIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    [self.view addSubview:activityIndicator];
    
    [activityIndicator startAnimating];
    
    
    @try {
        [NSURLConnection sendAsynchronousRequest:request
                                           queue:[NSOperationQueue mainQueue]
                               completionHandler:^(NSURLResponse *response,  NSData *data, NSError *error) {
                                   if (error != nil) {
                                       NSLog(@"Error on load = %@", [error localizedDescription]);
                                       UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"通讯错误"
                                                                                       message:nil
                                                                                      delegate:nil
                                                                             cancelButtonTitle:@"确定"
                                                                             otherButtonTitles:nil, nil];
                                       [alert show];
                                       return;
                                   }else {
                                       [activityIndicator stopAnimating];
                                       // check the HTTP status
                                       if ([response isKindOfClass:[NSHTTPURLResponse class]]) {                    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
                                           if (httpResponse.statusCode != 200) {
                                               return;                    }
                                           NSLog(@"Headers: %@", [httpResponse allHeaderFields]);
                                           NSDictionary  *rawresult = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves  error:&error];
                                           
                                           NSArray *queryproducts = [rawresult objectForKey:@"message"];
                                           NSString *code = [rawresult objectForKey:@"code"];
                                           NSLog(@"查询结果 %@", rawresult );
                                           
                                           
                                           if([code isEqualToString:@"40019"]){
                                               UIAlertView * alert =
                                               [[UIAlertView alloc]
                                                initWithTitle:@"您目前没有留言"
                                                message: nil
                                                delegate:nil
                                                cancelButtonTitle:nil
                                                otherButtonTitles:@"确定", nil];
                                               [alert show];
                                               
                                           }else if(![code isEqualToString:@"101"]){
                                               UIAlertView * alert =
                                               [[UIAlertView alloc]
                                                initWithTitle:@"错误"
                                                message: [[NSString alloc] initWithFormat:@"查询失败:%@",code]
                                                delegate:nil
                                                cancelButtonTitle:nil
                                                otherButtonTitles:@"确定", nil];
                                               [alert show];
                                               return;
                                               
                                           }else if([code isEqualToString:@"101"]){
                                               NSMutableArray *result = [[NSMutableArray alloc] init];
                                               
                                               XWMessageListItem *item = [[XWMessageListItem alloc] init];
                                               
                                               for(int i=0;i<[queryproducts count];i++){
                                                   item = [[XWMessageListItem alloc] init];
                                                   NSString *t =[queryproducts[i] objectForKey:@"leaveMessageTitle"];
                                                   if (t == [NSNull null]){
                                                       t =@"";
                                                   }
                                                   item.messageTitle = t;
                                                   t =[queryproducts[i] objectForKey:@"leaveMessageStatus"];
                                                   if (t == [NSNull null]){
                                                       t =@"";
                                                   }
                                                   
                                                   item.status = t;
                                                   t =[queryproducts[i] objectForKey:@"leaveMessageDate"];
                                                   if (t == [NSNull null]){
                                                       t =@"";
                                                   }
                                                   item.postDate = t;
                                                   item.mid= [queryproducts[i] objectForKey:@"leaveMessageID"];
                                                   item.productID= [queryproducts[i] objectForKey:@"productID"];

                                                   [result addObject:item];
                                                   
                                               }
                                               XWMyMessageController *viewController = [[XWMyMessageController alloc] init] ;
                                               viewController.results = result;
                                               viewController.navigationController = self.navigationController;
                                               [self.navigationController pushViewController:viewController animated:YES];
                                           }//end 101
                                       }
                                   }
                               }
         ];
        
        
        
        
    }@catch (NSException *exception) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"对不起，服务故障，请稍后再试"
                                                        message:nil
                                                       delegate:self
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil, nil];
        [activityIndicator stopAnimating];
        
        [alert show];
        return;
    }
    @finally {
        
    }

    
    
    
}



- (void)login:(UIButton *)sender {
	NSParameterAssert(sender);
    /*
     XWLoginController *viewController = [[XWLoginController alloc] init] ;
     [self.navigationController pushViewController:viewController animated:YES];
     */
    
    
    NSString *uid =  [[NSUserDefaults standardUserDefaults] objectForKey:LOGIN];
    
    if (uid == nil){
        
        UIAlertView *view = [[UIAlertView alloc] initWithTitle:@"登录提示"    //标题
                                                       message:@"该功能需要登录后使用，您目前还没有登录。"   //显示内容
                                                      delegate:self          //委托，可以点击事件进行处理
                                             cancelButtonTitle:@"取消"
                                             otherButtonTitles:@"登录"
                             //,@"其他",    //添加其他按钮
                             ,nil];
        view.tag=100;
        [view show];
        return;
    }
    
    
    
    //获取用户信息
    
    
    NSMutableString  *url =  [[NSMutableString alloc] initWithString:SERVER_URL];
    [url appendString: [NSString  stringWithFormat: @"showinfo/%@",uid]];
    NSLog(url);
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    
    
    UIActivityIndicatorView *activityIndicator;
    activityIndicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 32.0f, 32.0f)];
    CGPoint center  = CGPointMake(self.view.center.x, self.view.center.y-50);
    [activityIndicator setCenter:center];
    [activityIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    [self.view addSubview:activityIndicator];
    
    [activityIndicator startAnimating];
    
    
    @try {
        [NSURLConnection sendAsynchronousRequest:request
                                           queue:[NSOperationQueue mainQueue]
                               completionHandler:^(NSURLResponse *response,  NSData *data, NSError *error) {
                                   if (error != nil) {
                                       NSLog(@"Error on load = %@", [error localizedDescription]);
                                       [activityIndicator stopAnimating];

                                       UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"通讯错误"
                                                                                       message:nil
                                                                                      delegate:nil
                                                                             cancelButtonTitle:@"确定"
                                                                             otherButtonTitles:nil, nil];
                                       [alert show];
                                       return;
                                   }else {
                                       [activityIndicator stopAnimating];
                                       // check the HTTP status
                                       if ([response isKindOfClass:[NSHTTPURLResponse class]]) {                    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
                                           if (httpResponse.statusCode != 200) {
                                               return;                    }
                                           NSLog(@"Headers: %@", [httpResponse allHeaderFields]);
                                           NSDictionary  *rawresult = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves  error:&error];
                                           
                                           NSMutableDictionary *t = [rawresult objectForKey:@"message"];                                         
                                           
                                           NSMutableDictionary *customerinfo = [[NSMutableDictionary alloc] initWithDictionary:t];
                                           
                                           NSString *code = [rawresult objectForKey:@"code"];
                                           NSLog(@"查询结果 %@", rawresult );
                                           
                                           if(![code isEqualToString:@"101"]){
                                               UIAlertView * alert =
                                               [[UIAlertView alloc]
                                                initWithTitle:@"错误"
                                                message: [[NSString alloc] initWithFormat:@"用户信息获取:%@",code]
                                                delegate:nil
                                                cancelButtonTitle:nil
                                                otherButtonTitles:@"确定", nil];
                                               [alert show];
                                               return;
                                               
                                           }else if([code isEqualToString:@"101"]){
                                                XWMyinfoTabViewController *viewController = [[XWMyinfoTabViewController alloc] init] ;
                                               viewController.info = customerinfo;
                                               viewController.navigationController = self.navigationController;
                                               [self.navigationController pushViewController:viewController animated:YES];
                                           }//end 101
                                       }
                                   }
                               }
         ];
        
        
        
        
    }@catch (NSException *exception) {
        [activityIndicator stopAnimating];

        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"对不起，服务故障，请稍后再试"
                                                        message:nil
                                                       delegate:self
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil, nil];
        
        [alert show];
        return;
    }
    @finally {
        
    }
    
    
    
    
}


- (void)about:(UIButton *)sender {
    XWAboutViewController  *viewController = [[XWAboutViewController alloc] init] ;
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void)info:(UIButton *)sender {
    
    
    NSURL *url = [NSURL URLWithString:@"http://www3.tonknet.com/"];
    
    
    TOWebViewController *webViewController = [[TOWebViewController alloc] initWithURL:url];
    //  self.navigationItem.title = @"公共咨询";
    webViewController.showLoadingBar=true;
    webViewController.showActionButton =true;
    
    // [self.navigationController pushViewController:webViewController animated:YES];
    
    [self presentViewController:[[UINavigationController alloc] initWithRootViewController:webViewController] animated:YES completion:nil];
}

- (void)favorit:(UIButton *)sender {
    
    
    NSString *uid =  [[NSUserDefaults standardUserDefaults] objectForKey:LOGIN];
    
    if (uid == nil){
        
        UIAlertView *view = [[UIAlertView alloc] initWithTitle:@"登录提示"    //标题
                                                       message:@"该功能需要登录后使用，您目前还没有登录。"   //显示内容
                                                      delegate:self          //委托，可以点击事件进行处理
                                             cancelButtonTitle:@"取消"
                                             otherButtonTitles:@"登录"
                             //,@"其他",    //添加其他按钮
                             ,nil];
        view.tag=100;
        [view show];
        return;
    }
    
    
    
    //收藏产品
    
    
    NSMutableString  *url =  [[NSMutableString alloc] initWithString:SERVER_URL];
    [url appendString: [NSString  stringWithFormat: @"collect/query/%@",uid]];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    
    
    UIActivityIndicatorView *activityIndicator;
    activityIndicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 32.0f, 32.0f)];
    CGPoint center  = CGPointMake(self.view.center.x, self.view.center.y-50);
    [activityIndicator setCenter:center];
    [activityIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    [self.view addSubview:activityIndicator];
    
    [activityIndicator startAnimating];
    
    
    @try {
        [NSURLConnection sendAsynchronousRequest:request
                                           queue:[NSOperationQueue mainQueue]
                               completionHandler:^(NSURLResponse *response,  NSData *data, NSError *error) {
                                   if (error != nil) {
                                       NSLog(@"Error on load = %@", [error localizedDescription]);
                                       UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"通讯错误"
                                                                                       message:nil
                                                                                      delegate:nil
                                                                             cancelButtonTitle:@"确定"
                                                                             otherButtonTitles:nil, nil];
                                       [alert show];
                                       return;
                                   }else {
                                       [activityIndicator stopAnimating];
                                       // check the HTTP status
                                       if ([response isKindOfClass:[NSHTTPURLResponse class]]) {                    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
                                           if (httpResponse.statusCode != 200) {
                                               return;                    }
                                           NSLog(@"Headers: %@", [httpResponse allHeaderFields]);
                                           NSDictionary  *rawresult = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves  error:&error];
                                           
                                           NSArray *queryproducts = [rawresult objectForKey:@"message"];
                                           NSString *code = [rawresult objectForKey:@"code"];
                                           NSLog(@"查询结果 %@", rawresult );
                                           
                                           
                                           if([code isEqualToString:@"40021"]){
                                               UIAlertView * alert =
                                               [[UIAlertView alloc]
                                                initWithTitle:@"您还没有任何收藏的产品"
                                                message: nil
                                                delegate:nil
                                                cancelButtonTitle:nil
                                                otherButtonTitles:@"确定", nil];
                                               [alert show];
                                               
                                           }else if(![code isEqualToString:@"101"]){
                                               UIAlertView * alert =
                                               [[UIAlertView alloc]
                                                initWithTitle:@"错误"
                                                message: [[NSString alloc] initWithFormat:@"查询失败:%@",code]
                                                delegate:nil
                                                cancelButtonTitle:nil
                                                otherButtonTitles:@"确定", nil];
                                               [alert show];
                                               return;
                                               
                                           }else if([code isEqualToString:@"101"]){
                                               NSMutableArray *result = [[NSMutableArray alloc] init];
                                               
                                               XWSearchResultItem *item = [[XWSearchResultItem alloc] init];
                                               
                                               for(int i=0;i<[queryproducts count];i++){
                                                   item = [[XWSearchResultItem alloc] init];
                                                   NSString *t =[queryproducts[i] objectForKey:@"bankname"];
                                                   if (t == [NSNull null]){
                                                       t =@"";
                                                   }
                                                   item.bankName = t;
                                                   t =[queryproducts[i] objectForKey:@"productname"];
                                                   if (t == [NSNull null]){
                                                       t =@"";
                                                   }

                                                   item.productName = t;
                                                   t =[queryproducts[i] objectForKey:@"repaymentType"];
                                                   if (t == [NSNull null]){
                                                       t =@"";
                                                   }
                                                   item.productDesc= t;
                                                   item.productid= [queryproducts[i] objectForKey:@"productid"];
                                                   [result addObject:item];
                                                   
                                               }
                                               XWMyfavolistViewController *viewController = [[XWMyfavolistViewController alloc] init] ;
                                               viewController.results = result;
                                               [self.navigationController pushViewController:viewController animated:YES];
                                           }//end 101
                                       }
                                   }
                               }
         ];
        
        
        
        
    }@catch (NSException *exception) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"对不起，服务故障，请稍后再试"
                                                        message:nil
                                                       delegate:self
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil, nil];
        [activityIndicator stopAnimating];
        
        [alert show];
        return;
    }
    @finally {
        
    }
    
    
    
    
}


- (void)password:(UIButton *)sender {
    
    NSString *uid =  [[NSUserDefaults standardUserDefaults] objectForKey:LOGIN];
    
    if (uid == nil){
        
        UIAlertView *view = [[UIAlertView alloc] initWithTitle:@"登录提示"    //标题
                                                       message:@"该功能需要登录后使用，您目前还没有登录。"   //显示内容
                                                      delegate:self          //委托，可以点击事件进行处理
                                             cancelButtonTitle:@"取消"
                                             otherButtonTitles:@"登录"
                             //,@"其他",    //添加其他按钮
                             ,nil];
        view.tag=100;
        [view show];
        return;
    }
    

    XWChangePasswordViewController  *viewController = [[XWChangePasswordViewController alloc] init] ;
    [self.navigationController pushViewController:viewController animated:YES];



}

- (IBAction)share:(id)sender
{
    
    UIActivityViewController *activityView = [[UIActivityViewController alloc] initWithActivityItems:@[@"这里是标题", [UIImage imageNamed:@"Oauth"], [NSURL URLWithString:@"http://www.google.com"]] applicationActivities:activity];
    activityView.excludedActivityTypes = @[UIActivityTypeAssignToContact, UIActivityTypeCopyToPasteboard, UIActivityTypePrint];
    [self presentViewController:activityView animated:YES completion:nil];
}







-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(alertView.tag==100){
        NSLog([NSString stringWithFormat:@"index:%i" ,buttonIndex]);
        if( buttonIndex == 1 ){
            XWLoginController *viewController = [[XWLoginController alloc] init] ;
            [self.navigationController pushViewController:viewController animated:YES];
        }
    }
}





@end
