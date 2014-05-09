
//

#import "PSTextField.h"
#import <QuartzCore/QuartzCore.h>

@implementation PSTextField

- (id)initWithFrame:(CGRect)frame
		cornerRadio:(CGFloat)radio
		borderColor:(UIColor*)bColor
		borderWidth:(CGFloat)bWidth
		 lightColor:(UIColor*)lColor
		  lightSize:(CGFloat)lSize
   lightBorderColor:(UIColor*)lbColor
   backgroundColor:(UIColor *)bkColor
{
    self = [super initWithFrame:frame];
    if (self) {
        _borderColor = bColor;
		_cornerRadio = radio;
		_borderWidth = bWidth;
		_lightColor = lColor;
		_lightSize = lSize;
		_lightBorderColor = lbColor;
        _backgroundColor = bkColor;
		
		[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(beginEditing:) name:UITextFieldTextDidBeginEditingNotification object:self];
		[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(endEditing:) name:UITextFieldTextDidEndEditingNotification object:self];
		[self.layer setCornerRadius:_cornerRadio];
		[self.layer setBorderColor:_borderColor.CGColor];
		[self.layer setBorderWidth:_borderWidth];
		[self setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
		[self setBackgroundColor:[UIColor whiteColor]];
		[self.layer setMasksToBounds:NO];
        self.backgroundColor =bkColor;
    }
    return self;
}

- (void)beginEditing:(NSNotification*) notification
{
	[[self layer] setShadowOffset:CGSizeMake(0, 0)];
    [[self layer] setShadowRadius:_lightSize];
    [[self layer] setShadowOpacity:1];
    [[self layer] setShadowColor:_lightColor.CGColor];
	[self.layer setBorderColor:_lightBorderColor.CGColor];
    self.backgroundColor = [UIColor whiteColor];
}

- (void)endEditing:(NSNotification*) notification
{
	[[self layer] setShadowOffset:CGSizeZero];
    [[self layer] setShadowRadius:0];
    [[self layer] setShadowOpacity:0];
    [[self layer] setShadowColor:nil];
	[self.layer setBorderColor:_borderColor.CGColor];
    self.backgroundColor = _backgroundColor;

}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (CGRect)textRectForBounds:(CGRect)bounds
{
	CGRect inset = CGRectMake(bounds.origin.x + _cornerRadio*2,
							  bounds.origin.y,
							  bounds.size.width - _cornerRadio*2-30,
							  bounds.size.height);
    return inset;
}

- (CGRect)editingRectForBounds:(CGRect)bounds
{
	CGRect inset = CGRectMake(bounds.origin.x + _cornerRadio*2,
							  bounds.origin.y,
							  bounds.size.width - _cornerRadio*2-30,
							  bounds.size.height);
    return inset;
}

/*-(CGRect)placeholderRectForBounds:(CGRect)bounds
{
    
    CGRect inset = CGRectMake(bounds.origin.x+100, bounds.origin.y, bounds.size.width -100, bounds.size.height);
    return inset;
}*/




@end
