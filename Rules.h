/*
 * Copyright (C) 2012 Mobs and Geeks
 *
 * Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file 
 * except in compliance with the License. You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software distributed under the 
 * License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, 
 * either express or implied. See the License for the specific language governing permissions and 
 * limitations under the License.
 *
 * @author Balachander.M <chicjai@gmail.com>
 * @version 0.1
 */


#import <Foundation/Foundation.h>
#import "Rule.h"

@interface Rules : NSObject

+ (id)sharedInstance;

+ (Rule *)maxLength:(int)maxLength withFailureString:(NSString *)failureString forTextField:(UITextField *)textField;
+ (Rule *)minLength:(int)minLength withFailureString:(NSString *)failureString forTextField:(UITextField *)textField;
+ (Rule *)checkRange:(NSRange )range withFailureString:(NSString *)failureString forTextField:(UITextField *)textField;
+ (Rule *)checkIfNumericWithFailureString:(NSString *)failureString forTextField:(UITextField *)textField;
+ (Rule *)checkIfAlphaNumericWithFailureString:(NSString *)failureString forTextField:(UITextField *)textField;
+ (Rule *)checkIfAlphabeticalWithFailureString:(NSString *)failureString forTextField:(UITextField *)textField;
+ (Rule *)checkIsValidEmailWithFailureString:(NSString *)failureString forTextField:(UITextField *)textField;
+ (Rule *)checkIfURLWithFailureString:(NSString *)failureString forTextField:(UITextField *)textField;
+ (Rule *)checkIfShortandURLWithFailureString:(NSString *)failureString forTextField:(UITextField *)textField;
@end
