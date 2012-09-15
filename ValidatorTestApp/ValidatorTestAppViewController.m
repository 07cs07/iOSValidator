//
//  ValidatorTestAppViewController.m
//  ValidatorTestApp
//
//  Created by MaG 2 on 14/09/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ValidatorTestAppViewController.h"
#import "InvalidTooltipView.h"
#import "ValidTooltipView.h"
#import "QuartzCore/QuartzCore.h"

@implementation ValidatorTestAppViewController
@synthesize textField1;
@synthesize textField2;
@synthesize textField3;
@synthesize keyboardToolbar;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    if (keyboardToolbar == nil)
    {
        keyboardToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0,self.view.bounds.size.width, 44)]; 
        
        extraSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:(UIBarButtonSystemItemFlexibleSpace) target:nil action:nil];
        
        done = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:(UIBarButtonSystemItemDone) target:self action:@selector(resignKeyboard)];
        
        [keyboardToolbar setItems:[[NSArray alloc] initWithObjects:extraSpace, done, nil]];
        
        [keyboardToolbar setTranslucent:YES];
        [keyboardToolbar setTintColor:[UIColor blackColor]];
    }
    
    for (id view in self.view.subviews) {
        if ([view isKindOfClass:[UITextField class]]) {
            [(UITextField *)view setInputAccessoryView:keyboardToolbar];
        }
    }
}

-(void) resignKeyboard 
{
    
    [self.view endEditing:YES];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    // Hides Tooltip 
    if (_tooltipView != nil)
    {
        [_tooltipView removeFromSuperview];
        _tooltipView = nil;
    }
    return YES;
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    // Hide tooltip 
    if (_tooltipView != nil)
    {
        [_tooltipView removeFromSuperview];
        _tooltipView = nil;
    }
    
    return YES;
}

- (void)viewDidUnload
{
    [self setTextField1:nil];
    [self setTextField2:nil];
    [self setTextField3:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)validateAction:(id)sender
{
    
    [self resignKeyboard];
    
    if (_tooltipView != nil)
    {
        [_tooltipView removeFromSuperview];
        _tooltipView = nil;
    }
    
    Validator *validator = [[Validator alloc] init];
    validator.delegate   = self;
    
    [validator putRule:[Rules checkRange:NSMakeRange(2, 5) withFailureString:@"Should be in range 2 to 5" forTextField:textField1]];
    
    [validator putRule:[Rules minLength:2 withFailureString:@"has less than min length 2" forTextField:textField2]];
    
    [validator putRule:[Rules checkIfNumericWithFailureString:@"Should be only numerics" forTextField:textField3]];
    
    [validator putRule:[Rules maxLength:4 withFailureString:@"has more than max length 4" forTextField:textField3]];
    
    [validator validate];
}

#pragma ValidatorDelegate - Delegate methods

- (void) preValidation
{
    for (UITextField *textField in self.view.subviews) {
        textField.layer.borderWidth = 0;
    }
    
    NSLog(@"Called before the validation begins");
}

- (void)onSuccess
{
    
    if (_tooltipView != nil)
    {
        [_tooltipView removeFromSuperview];
        _tooltipView  = nil;
    }
    [[[UIAlertView alloc] initWithTitle:@"Alert" message:@"Success" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil] show];
    NSLog(@"Success");
}

- (void)onFailure:(Rule *)failedRule
{
    NSLog(@"Failed");
    failedRule.textField.layer.borderColor   = [[UIColor redColor] CGColor];
    failedRule.textField.layer.cornerRadius  = 5;    
    failedRule.textField.layer.borderWidth   = 2;
    
    CGPoint point           = [failedRule.textField convertPoint:CGPointMake(0.0, failedRule.textField.frame.size.height - 4.0) toView:self.view];
    CGRect tooltipViewFrame = CGRectMake(6.0, point.y, 309.0, _tooltipView.frame.size.height);
    
    _tooltipView       = [[InvalidTooltipView alloc] init];
    _tooltipView.frame = tooltipViewFrame;
    _tooltipView.text  = [NSString stringWithFormat:@"%@",failedRule.failureMessage];
    _tooltipView.rule  = failedRule;
    [self.view addSubview:_tooltipView];
}

@end
