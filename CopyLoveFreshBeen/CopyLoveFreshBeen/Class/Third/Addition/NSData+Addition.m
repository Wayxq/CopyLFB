//
//  NSData+Addition.m
//  CuotiStudent
//
//  Created by   on 14/11/19.
//  Copyright (c) 2014年 rock. All rights reserved.
//

#import "NSData+Addition.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSData (Addition)
- (NSString *)md5
{
    if(self == nil || [self length] == 0)
        return nil;
    
    const void *value = [self bytes];
    
    unsigned char r[CC_MD5_DIGEST_LENGTH];
    CC_MD5(value, (unsigned int)self.length, r);
    
    NSString *output = [NSString stringWithFormat:@"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
                        r[0], r[1], r[2], r[3], r[4], r[5], r[6], r[7], r[8], r[9], r[10], r[11], r[12], r[13], r[14], r[15]];
    
    return output;
}
@end
