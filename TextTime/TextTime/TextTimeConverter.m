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
    if (intNumber > 0 && intNumber < 10) {
        return [_numbersOneToNine objectAtIndex:intNumber-1];
    }
    
    if (isHour == YES)
    {
        return @"Midnight";
    }
    return @"O'clock";
}

@end
