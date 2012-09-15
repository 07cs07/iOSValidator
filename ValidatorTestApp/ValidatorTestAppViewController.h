//
//  ValidatorTestAppViewController.h
//  ValidatorTestApp
//
//  Created by MaG 2 on 14/09/12.
//  Copyright (c) 2012 Mobs and Geeks. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Validator.h"
#import "TooltipView.h"
#import "QuartzCore/QuartzCore.h"

@interface ValidatorTestAppViewController : UIViewController<UITextFieldDelegate,ValidatorDelegate>{
    
    UIBarButtonItem *extraSpace;
    UIBarButtonItem *done;
    TooltipView    *_tooltipView;
}
@property (retain, nonatomic) IBOutlet UITextField *textField1;
@property (retain, nonatomic) IBOutlet UITextField *textField2;
@property (retain, nonatomic) IBOutlet UITextField *textField3;
@property (nonatomic, retain) UIToolbar *keyboardToolbar;
- (IBAction)validateAction:(id)sender;
@end
