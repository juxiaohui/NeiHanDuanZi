//
//  NSAttributedString+JXHExt.m
//  NeiHanDuanZi
//
//  Created by juxiaohui on 16/9/21.
//  Copyright © 2016年 juxiaohui. All rights reserved.
//

#import "NSAttributedString+JXHExt.h"
#import <CoreText/CoreText.h>

@implementation NSAttributedString (JXHExt)

- (CGFloat)heightWithConstrainedWidth:(CGFloat)width {
    
    if (self == nil || ![self isKindOfClass:[NSAttributedString class]]) {
        return 0;
    }
    
    return [self boundingHeightForWidth:width];
}

- (CGFloat)boundingHeightForWidth:(CGFloat)inWidth {
    
    if (self == nil || ![self isKindOfClass:[NSAttributedString class]]) {
        return 0;
    }
    
    return [self boundingRectWithSize:CGSizeMake(inWidth, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin context:nil].size.height + 3;
}

- (CGFloat)boundingWidthForHeight:(CGFloat)inHeight {
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((CFMutableAttributedStringRef) self);
    CGSize suggestedSize         = CTFramesetterSuggestFrameSizeWithConstraints(framesetter, CFRangeMake(0, 0),NULL, CGSizeMake(CGFLOAT_MAX, inHeight), NULL);
    CFRelease(framesetter);
    return suggestedSize.width;
}

@end
