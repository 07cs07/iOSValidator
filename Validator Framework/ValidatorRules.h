
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

/**
 * A built-in class with a collection of common rules.
 *
 * You may add any rules here that extends NSString which makes a category of it that might be usefull.
 *
 */

#import <Foundation/Foundation.h>

@interface NSString (ValidatorRules)

+ (BOOL)checkIfAlphaNumeric:(NSString *)string;
+ (BOOL)checkIfAlphabetical:(NSString *)string;
+ (BOOL)checkIfEmailId:(NSString *)string;
+ (BOOL)checkNumeric:(NSString *)string;
+ (BOOL)checkPostCodeUK:(NSString *)string;
+ (BOOL)checkIfURL:(NSString *)string;
+ (BOOL)checkIfShorthandURL:(NSString *)string;
+ (BOOL)checkIfInRange:(NSString *)string WithRange:(NSRange)_range;
- (BOOL)isNotEqualToString:(NSString *)string;
- (BOOL)containsString:(NSString *)string;
- (NSString *)stringBetweenString:(NSString *)start andString:(NSString*)end;

@end
