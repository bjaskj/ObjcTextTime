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

@interface TextTimeConverterTests : XCTestCase

@end

@implementation TextTimeConverterTests
- (void)testZeroReturnsOClock {
    TextTimeConverter *converter = [[TextTimeConverter alloc] init];
    NSString *result = [converter convertNumber:@0];
    XCTAssertTrue([result isEqualToString:@"O'clock"]);
}
@end