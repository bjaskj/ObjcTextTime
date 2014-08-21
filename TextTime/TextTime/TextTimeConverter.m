//
//  TextTimeConverter.m
//  TextTime
//
//  Created by Bjarte Skjørestad on 20/08/14.
//  Copyright (c) 2014 Bjarte Skjørestad. All rights reserved.
//

#import "TextTimeConverter.h"

@implementation TextTimeConverter

- (TextTimeConverter *)init;
{
    _numbersOneToNine = @[ @"One", @"Two", @"Three", @"Four", @"Five", @"Six", @"Seven", @"Eight", @"Nine"];
    _numbersFromTenToNineteen = @[ @"Ten", @"Eleven", @"Twelve", @"Thirteen", @"Fourteen", @"Fifteen", @"Sixteen", @"Seventeen", @"Eighteen", @"Nineteen"];
    
    return [super init];
}

- (NSString *) convertNumber:(NSNumber *)number;
{
    return [self convertNumber:number isHour:NO];
}

- (NSString *) convertNumber:(NSNumber *)number isHour:(BOOL)isHour;
{
    int intNumber = [number intValue];
    
    // betwheen 1 and 9
    if (intNumber >= 1 && intNumber <= 9) {
        return [_numbersOneToNine objectAtIndex:intNumber-1];
    }
    
    // betwheen 10 and 19
    if (intNumber >= 10 && intNumber <= 19) {
        return [_numbersFromTenToNineteen objectAtIndex:intNumber-10];
    }
    
    if (isHour == YES)
    {
        return @"Midnight";
    }
    return @"O'clock";
}

@end
