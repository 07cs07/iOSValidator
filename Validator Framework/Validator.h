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
#import "Rules.h"

@protocol ValidatorDelegate <NSObject>

@optional
- (void)preValidation;

@required
- (void)onSuccess;
- (void)onFailure:(Rule *)failedRule;

@end

@interface Validator : NSObject{

    NSMutableArray *nRules;
}

@property (nonatomic, retain) NSMutableArray *nRules;
@property (nonatomic, retain) id <ValidatorDelegate> delegate;

- (void)validate;
- (void)putRule:(Rule *)rule;
@end
