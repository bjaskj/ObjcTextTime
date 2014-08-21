//
//  TextTimeConverter.h
//  TextTime
//
//  Created by Bjarte Skjørestad on 20/08/14.
//  Copyright (c) 2014 Bjarte Skjørestad. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TextTimeConverter : NSObject{
    NSArray *_numbersOneToNine;
}
- (NSString *) convertNumber:(NSNumber *)number;
- (NSString *) convertNumber:(NSNumber *)number isHour:(BOOL)isHour;
@end
