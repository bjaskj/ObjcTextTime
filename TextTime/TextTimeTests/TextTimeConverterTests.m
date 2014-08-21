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
}

@end

@implementation TextTimeConverterTests

- (void)setUp {
    [super setUp];
    _converter = [[TextTimeConverter alloc] init];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testZeroReturnsOClock {
    NSString *result = [_converter convertNumber:@0];
    XCTAssertTrue([result isEqualToString:@"O'clock"]);
}

- (void)testZeroAndHourReturnsMidnight {
    NSString *result = [_converter convertNumber:@0 isHour:YES];
    XCTAssertTrue([result isEqualToString:@"Midnight"]);
}
@end