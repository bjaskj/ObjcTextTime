//
//  TextTimeConverter.m
//  TextTime
//
//  Created by Bjarte Skjørestad on 20/08/14.
//  Copyright (c) 2014 Bjarte Skjørestad. All rights reserved.
//

#import "TextTimeConverter.h"

@implementation TextTimeConverter
- (NSString *) convertNumber:(NSNumber *)number;
{
    return [self convertNumber:number isHour:NO];
}
- (NSString *) convertNumber:(NSNumber *)number isHour:(BOOL)isHour;
{
    if ([number isEqual: @1]) {
        return @"One";
    }
    
    if (isHour == YES)
    {
        return @"Midnight";
    }
    return @"O'clock";
}
@end
