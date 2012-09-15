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


#import "ValidatorRules.h"

@implementation NSString (ValidatorRules)

+ (BOOL)checkIfAlphabetical:(NSString *)string
{
    if (string == nil)
        return NO;
    
    NSError *error             = NULL;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"[a-zA-Z]" options:0 error:&error];
    NSUInteger numberOfMatches = [regex numberOfMatchesInString:string options:0 range:NSMakeRange(0, string.length)];
    
    return numberOfMatches     == string.length;
}

+ (BOOL)checkIfAlphaNumeric:(NSString *)string
{
    if (string == nil)
        return NO;
    
    NSError *error             = NULL;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"[a-zA-Z0-9]" options:0 error:&error];
    NSUInteger numberOfMatches = [regex numberOfMatchesInString:string options:0 range:NSMakeRange(0, string.length)];
    
    return numberOfMatches     == string.length;
}

+ (BOOL)checkIfEmailId:(NSString *)string
{
    if (string == nil)
        string = [NSString string];
    
    NSError *error             = NULL;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"^[+\\w\\.\\-']+@[a-zA-Z0-9-]+(\\.[a-zA-Z]{2,})+$" options:NSRegularExpressionCaseInsensitive error:&error];
    NSUInteger numberOfMatches = [regex numberOfMatchesInString:string options:0 range:NSMakeRange(0, string.length)];
    
    return numberOfMatches     == 1;
}

+ (BOOL)checkNumeric:(NSString *)string
{
    if (string == nil)
        return NO;
    
    NSError *error             = NULL;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"[0-9]" options:0 error:&error];
    NSUInteger numberOfMatches = [regex numberOfMatchesInString:string options:0 range:NSMakeRange(0, string.length)];
    
    return numberOfMatches     == string.length;
}

+ (BOOL)checkPostCodeUK:(NSString *)string
{
    if (string == nil)
        string = @"";
    
    NSError *error             = NULL;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"^([A-PR-UWYZa-pr-uwyz]([0-9]{1,2}|([A-HK-Ya-hk-y][0-9]|[A-HK-Ya-hk-y][0-9]([0-9]|[ABEHMNPRV-Yabehmnprv-y]))|[0-9][A-HJKS-UWa-hjks-uw])\\ {0,1}[0-9][ABD-HJLNP-UW-Zabd-hjlnp-uw-z]{2}|([Gg][Ii][Rr]\\ 0[Aa][Aa])|([Ss][Aa][Nn]\\ {0,1}[Tt][Aa]1)|([Bb][Ff][Pp][Oo]\\ {0,1}([Cc]\\/[Oo]\\ )?[0-9]{1,4})|(([Aa][Ss][Cc][Nn]|[Bb][Bb][Nn][Dd]|[BFSbfs][Ii][Qq][Qq]|[Pp][Cc][Rr][Nn]|[Ss][Tt][Hh][Ll]|[Tt][Dd][Cc][Uu]|[Tt][Kk][Cc][Aa])\\ {0,1}1[Zz][Zz]))$" options:0 error:&error];
    NSUInteger numberOfMatches = [regex numberOfMatchesInString:string options:0 range:NSMakeRange(0, [string length])];
    
    return numberOfMatches     == 1;
}

+ (BOOL)checkIfInRange:(NSString *)string WithRange:(NSRange)_range
{
    if (_range.location == 0
        && _range.length == 0)
        return YES;
    
    if (string == nil)
        string = [NSString string];
    
    NSError *error             = NULL;
    NSString *regexString      = [NSString stringWithFormat:@"^.{%d,%d}$", _range.location, _range.length];
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regexString options:0 error:&error];
    NSUInteger numberOfMatches = [regex numberOfMatchesInString:string options:0 range:NSMakeRange(0, string.length)];
    
    return numberOfMatches     == 1;
}

+ (BOOL)checkIfURL:(NSString *)string
{
    if (string == nil)
    {
        return NO;
    }
    
    NSDataDetector *detector         = [NSDataDetector dataDetectorWithTypes:NSTextCheckingTypeLink error:nil];
    NSTextCheckingResult *firstMatch = [detector firstMatchInString:string options:0 range:NSMakeRange(0, [string length])];
    
    return [firstMatch.URL isKindOfClass:[NSURL class]]
    && ![firstMatch.URL.scheme isEqualToString:@"mailto"]
    && ![firstMatch.URL.scheme isEqualToString:@"ftp"];
}

+ (BOOL)checkIfShorthandURL:(NSString *)string
{
    if (string == nil)
    {
        return NO;
    }
    
    NSError *error             = NULL;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"^((https?)://)?[a-z0-9-]+(\\.[a-z0-9-]+)+([/?].*)?$" options:NSRegularExpressionCaseInsensitive error:&error];
    NSUInteger numberOfMatches = [regex numberOfMatchesInString:string options:0 range:NSMakeRange(0, string.length)];
    
    return numberOfMatches     == 1;
}

- (BOOL)isNotEqualToString:(NSString *)string 
{
    
    return [self isEqualToString:string] ? NO : YES;
    
}

- (BOOL)containsString:(NSString *)string 
{
    
    return [self rangeOfString:string].location == NSNotFound ? NO : YES;
    
}

- (NSString *)stringBetweenString:(NSString *)start andString:(NSString *)end 
{
    
    NSRange startRange       = [self rangeOfString:start];
    if (startRange.location != NSNotFound) {
        
        NSRange targetRange;
        targetRange.location = startRange.location + startRange.length;
        targetRange.length   = [self length] - targetRange.location;        
        NSRange endRange     = [self rangeOfString:end options:0 range:targetRange];
        
        if (endRange.location != NSNotFound) {
            
            targetRange.length = endRange.location - targetRange.location;
            return [self substringWithRange:targetRange];
        }
    }    
    return nil;
}

@end
