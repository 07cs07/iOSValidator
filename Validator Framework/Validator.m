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


#import "Validator.h"
#import "QuartzCore/QuartzCore.h"

@interface Validator()

// Private Method
- (Rule *)validateAllRules;
@end

@implementation Validator
@synthesize delegate;
@synthesize nRules;

- (id)init {
    self = [super init];
    if (self) {
        nRules = [[NSMutableArray alloc] init];
    }
    return self;
}

/**
 * Add a {Rule} to the Validator.
 * param-rule The {Rule} associated with the textField that has to be validated.
 */
- (void)putRule:(Rule *)rule {
    
    [nRules addObject:rule];            
}

/**
 * Validate all the {Rule}s against their associated {TextField}s.
 */
- (void)validate {
    
    /**
     * Called before the Validator begins validation.
     */
    [self.delegate preValidation];
    
    Rule *failedRule = [self validateAllRules];
    if (failedRule == NULL) {
        /**
         * Called when all the {Rule}s added to this Validator are valid.
         */   
        [self.delegate onSuccess];
    } else {
        /**
         * Called if any of the {Rule}s fail.
         * param-failedRule The failed {Rule} associated with the {TextField} that did not pass validation..
         */

        [self.delegate onFailure:failedRule];
    }
}

/**
 * Validates all rules added to this Validator.
 * return null if all {Rule}s are valid, else returns the failed{Rule}.
 */
- (Rule *)validateAllRules {
    
    Rule *failedRule = NULL;
    for (Rule *rule in nRules) {
        
        if (rule == NULL) continue;
        // Returns the failed rule
        if (!rule.isValid) {
            failedRule = rule;
            break;
        }
    }
    
    return failedRule;
}


@end
