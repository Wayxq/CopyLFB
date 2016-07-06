//
//  NSDate+Addition.h
//
//  Created by wu zhikun on 13-4-1.
//  Copyright (c) 2013 Tibco. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Addition)

- (NSString *)timeAgo;

- (NSString*)formatDateTimeForSchedule;

- (NSString*)formatDateTimeForScheduleNext;

- (NSString*)formatDateTimeToSlashMDY;

- (NSString*)formatDateTimeToSlashMDY_HMS;
@end
