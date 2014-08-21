//
//  TextTimeConverterTests.m
//  TextTime
//
//  Created by Bjarte Skjørestad on 21/08/14.
//  Copyright (c) 2014 Bjarte Skjørestad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "TextTimeConverter.h"

@interface TextTimeConverterTests : XCTestCase{
    TextTimeConverter *_converter;
    NSDictionary *_numbersOneToNine;
}

@end

@implementation TextTimeConverterTests

- (void)setUp {
    [super setUp];
    _converter = [[TextTimeConverter alloc] init];
    
    _numbersOneToNine = @{ @"One": @1, @"Two": @2, @"Three": @3, @"Four": @4, @"Five": @5, @"Six": @6, @"Seven": @7, @"Eight": @8, @"Nine": @9 };
}

- (void)tearDown {
    [super tearDown];
}

- (void)testZeroReturnsOClock {
    NSString *result = [_converter convertNumber:@0];
    XCTAssertEqualObjects(result, @"O'clock");
}

- (void)testZeroAndHourReturnsMidnight {
    NSString *result = [_converter convertNumber:@0 isHour:YES];
    XCTAssertEqualObjects(result, @"Midnight");
}

- (void)testNumbersBelowTen {
    
    for (NSString *expectedText in _numbersOneToNine) {
        NSNumber *numberToConvert = _numbersOneToNine[expectedText];
        
        NSString *result = [_converter convertNumber:numberToConvert];
        XCTAssertEqualObjects(result, expectedText);
    }
}

- (void)testNumbersFromTenToNineteen {
    
    NSDictionary *numbers = @{ @"Ten": @10, @"Eleven": @11, @"Twelve": @12, @"Thirteen": @13, @"Fourteen": @14, @"Fifteen": @15, @"Sixteen": @16, @"Seventeen": @17, @"Eighteen": @18, @"Nineteen": @19 };
    
    for (NSString *expectedText in numbers) {
        NSNumber *numberToConvert = numbers[expectedText];
        
        NSString *result = [_converter convertNumber:numberToConvert];
        XCTAssertEqualObjects(result, expectedText);
    }
}

- (void)testNumbersFromTwentyUntilFifty {
    NSDictionary *numbers = @{ @"Twenty": @20, @"Thirty": @30, @"Forty": @40, @"Fifty": @50 };
    
    for (NSString *expectedText in numbers) {
        NSNumber *numberToConvert = numbers[expectedText];
        
        NSString *result = [_converter convertNumber:numberToConvert];
        XCTAssertEqualObjects(result, expectedText);
    }
}

// numbers 21-29 starts with "Twenty-"

- (void)testNumbersTwentyRangeShouldReturnCorrectFirstPart {
    for (int number = 21; number <= 29; number++) {
        NSString *result = [_converter convertNumber:[NSNumber numberWithInt:number]];
        XCTAssertTrue([result hasPrefix:@"Twenty-"]);
    }
}

// numbers 21-29 ends with number

- (void)testNumbersTwentyRangeShouldReturnCorrectLastPart {
    for (NSString *expectedText in _numbersOneToNine) {
        NSNumber *numberToConvert = _numbersOneToNine[expectedText];
        NSNumber *numberWanted = @(20 + [numberToConvert intValue]);
        
        NSString *result = [_converter convertNumber:numberWanted];
        NSString *expectedTextWithDash = [NSString stringWithFormat:@"-%@", expectedText];
        XCTAssertTrue([result hasSuffix:expectedTextWithDash], @"'%@' did not end with: '%@'", result, expectedTextWithDash);
    }
}

// numbers 31-39 starts with "Thirty-"

- (void)testNumbersThirtyRangeShouldReturnCorrectFirstPart {
    for (int number = 31; number <= 39; number++) {
        NSString *result = [_converter convertNumber:[NSNumber numberWithInt:number]];
        XCTAssertTrue([result hasPrefix:@"Thirty-"]);
    }
}

// numbers 31-39 ends with number

- (void)testNumbersThirtyRangeShouldReturnCorrectLastPart {
    for (NSString *expectedText in _numbersOneToNine) {
        NSNumber *numberToConvert = _numbersOneToNine[expectedText];
        NSNumber *numberWanted = @(20 + [numberToConvert intValue]);
        
        NSString *result = [_converter convertNumber:numberWanted];
        NSString *expectedTextWithDash = [NSString stringWithFormat:@"-%@", expectedText];
        XCTAssertTrue([result hasSuffix:expectedTextWithDash], @"'%@' did not end with: '%@'", result, expectedTextWithDash);
    }
}

// numbers 41-49 starts with "Forty-"

- (void)testNumbersFortyRangeShouldReturnCorrectFirstPart {
    for (int number = 41; number <= 49; number++) {
        NSString *result = [_converter convertNumber:[NSNumber numberWithInt:number]];
        XCTAssertTrue([result hasPrefix:@"Forty-"]);
    }
}

// numbers 41-49 ends with number

- (void)testNumbersFortyRangeShouldReturnCorrectLastPart {
    for (NSString *expectedText in _numbersOneToNine) {
        NSNumber *numberToConvert = _numbersOneToNine[expectedText];
        NSNumber *numberWanted = @(40 + [numberToConvert intValue]);
        
        NSString *result = [_converter convertNumber:numberWanted];
        NSString *expectedTextWithDash = [NSString stringWithFormat:@"-%@", expectedText];
        XCTAssertTrue([result hasSuffix:expectedTextWithDash], @"'%@' did not end with: '%@'", result, expectedTextWithDash);
    }
}

@end