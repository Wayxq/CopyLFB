//
//  NSString+UrlCheck.m
//
//
//  Created by wu zhikun on 13-4-15.
//  Copyright (c) 2013年 Tibco. All rights reserved.
//

#import "NSString+UrlCheck.h"

@implementation NSString (UrlCheck)

- (BOOL)isValidEmail
{
    BOOL stricterFilter = YES;
    NSString *stricterFilterString = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSString *laxString = @".+@.+\\.[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}

@end
