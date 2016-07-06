//
//  NSDate+Addition.m
//
//  Created by wu zhikun on 13-4-1.
//  Copyright (c) 2013 Tibco. All rights reserved.
//

#import "NSDate+Addition.h"

#define TT_MINUTE 60
#define TT_HOUR   (60 * TT_MINUTE)
#define TT_DAY    (24 * TT_HOUR)
#define TT_5_DAYS (5 * TT_DAY)
#define TT_WEEK   (7 * TT_DAY)
#define TT_MONTH  (30.5 * TT_DAY)
#define TT_YEAR   (365 * TT_DAY)


@implementation NSDate (Addition)

- (NSString*)formatDateTimeForSchedule{
    static NSDateFormatter* formatter = nil;
    if (nil == formatter) {
        formatter = [[NSDateFormatter alloc] init];
//        [formatter setTimeZone:[NSTimeZone systemTimeZone]];
//        formatter.dateFormat = @"MM/d @ h:mm a zz";
//        formatter.dateFormat = @"EEEE,MM/dd/yyyy";
        formatter.dateFormat = @"EEE,MM/dd(zz)";

        //        formatter.dateFormat = NSLocalizedString(@"EEEE h:mm a", @"Date format: Mon 1:05 pm");
        formatter.locale = [NSLocale currentLocale];
    }
    return [formatter stringFromDate:self];
}
- (NSString*)formatDateTimeToSlashMDY{
    static NSDateFormatter* formatter = nil;
    if (nil == formatter) {
        formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"MM/dd/YYYY";
        //        formatter.dateFormat = NSLocalizedString(@"EEEE h:mm a", @"Date format: Mon 1:05 pm");
        formatter.locale = [NSLocale currentLocale];
    }
    return [formatter stringFromDate:self];
}

- (NSString*)formatDateTimeForScheduleNext{
    static NSDateFormatter* formatter = nil;
    if (nil == formatter) {
        formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"EEE, MM/d @ h:mm a zz";
        //        formatter.dateFormat = NSLocalizedString(@"EEEE h:mm a", @"Date format: Mon 1:05 pm");
        formatter.locale = [NSLocale currentLocale];
    }
    return [formatter stringFromDate:self];
}
- (NSString*)formatDateTimeToSlashMDY_HMS
{
    static NSDateFormatter* formatter = nil;
    if (nil == formatter) {
        formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"EEE, MM/d @ h:mm a zz";
        //        formatter.dateFormat = NSLocalizedString(@"EEEE h:mm a", @"Date format: Mon 1:05 pm");
        formatter.locale = [NSLocale currentLocale];
    }
    return [formatter stringFromDate:self];
}
-(NSString *)timeAgo {
    NSDate *now = [NSDate date];
    double deltaSeconds = fabs([self timeIntervalSinceDate:now]);
    double deltaMinutes = deltaSeconds / 60.0f;
    
    if(deltaSeconds < 5) {
        return @"Just now";
    } else if(deltaSeconds < 60) {
        return [NSString stringWithFormat:@"%d sec ago", (int)deltaSeconds];
    } else if(deltaSeconds < 120) {
        return @"A minute ago";
    } else if (deltaMinutes < 60) {
        return [NSString stringWithFormat:@"%d min ago", (int)deltaMinutes];
    } else if (deltaMinutes < 120) {
        return @"An hour ago";
    } else if (deltaMinutes < (24 * 60)) {
        return [NSString stringWithFormat:@"%d hrs ago", (int)floor(deltaMinutes/60)];
    } else if (deltaMinutes < (24 * 60 * 2)) {
        return @"Yesterday";
    } else if (deltaMinutes < (24 * 60 * 7)) {
        return [NSString stringWithFormat:@"%d days ago", (int)floor(deltaMinutes/(60 * 24))];
    } else if (deltaMinutes < (24 * 60 * 14)) {
        return @"Last week";
    } else if (deltaMinutes < (24 * 60 * 31)) {
        return [NSString stringWithFormat:@"%d weeks ago", (int)floor(deltaMinutes/(60 * 24 * 7))];
    } else if (deltaMinutes < (24 * 60 * 61)) {
        return @"Last month";
    } else if (deltaMinutes < (24 * 60 * 365.25)) {
        return [NSString stringWithFormat:@"%d months ago", (int)floor(deltaMinutes/(60 * 24 * 30))];
    } else if (deltaMinutes < (24 * 60 * 731)) {
        return @"Last year";
    }
    
    return [NSString stringWithFormat:@"%d years ago", (int)floor(deltaMinutes/(60 * 24 * 365))];
}

@end
