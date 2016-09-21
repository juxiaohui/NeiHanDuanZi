//
//  NSDate+JXHExt.m
//  NeiHanDuanZi
//
//  Created by juxiaohui on 16/9/21.
//  Copyright © 2016年 juxiaohui. All rights reserved.
//

#import "NSDate+JXHExt.h"
#import "NSCalendar+JXHExt.h"

@implementation NSDate (JXHExt)

- (BOOL)isThisYear{
    
    NSDateComponents *components1 = [[NSCalendar calender] components:NSCalendarUnitYear fromDate:self];
    NSDateComponents *components2 = [[NSCalendar calender] components:NSCalendarUnitYear fromDate:[NSDate date]];
    return (components1.year == components2.year);
    
}
@end
