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
    _numbersByTen = @{ @2: @"Twenty", @3: @"Thirty", @4: @"Forty", @5: @"Fifty"};
    
    return [super init];
}

- (NSString *) convertNumber:(NSNumber *)number;
{
    return [self convertNumber:number isHour:NO];
}

- (NSString *) convertNumber:(NSNumber *)number isHour:(BOOL)isHour;
{
    int intNumber = [number intValue];
    
    // between 1 and 9
    if (intNumber >= 1 && intNumber <= 9) {
        return [_numbersOneToNine objectAtIndex:intNumber-1];
    }
    
    // between 10 and 19
    if (intNumber >= 10 && intNumber <= 19) {
        return [_numbersFromTenToNineteen objectAtIndex:intNumber-10];
    }
    
    // between 20 and 59
    if (intNumber >= 20 && intNumber <= 59) {
        int firstNumber = [number intValue] / 10;
        
        return [_numbersByTen objectForKey:[NSNumber numberWithInt:firstNumber]];
    }
    
    if (isHour == YES)
    {
        return @"Midnight";
    }
    return @"O'clock";
}

@end
