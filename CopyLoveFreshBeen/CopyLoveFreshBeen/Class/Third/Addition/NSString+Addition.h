
#import <Foundation/Foundation.h>

@interface NSString(MD5Addition)
- (NSString *)MD5;
- (NSString*)urlEncodedString;
- (NSString*)urlDecodedString;
- (BOOL)includeIosFormatVideo;

+ (BOOL)isMobilePhoneNumber:(NSString *)mobileNum;
+ (BOOL)isEmailAddress:(NSString *)str;
@end
