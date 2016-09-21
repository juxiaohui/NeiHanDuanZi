//
//  NSAttributedString+JXHExt.h
//  NeiHanDuanZi
//
//  Created by juxiaohui on 16/9/21.
//  Copyright © 2016年 juxiaohui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSAttributedString (JXHExt)

/**
 *  根据约束的宽度来求NSAttributedString的高度
 */
- (CGFloat)heightWithConstrainedWidth:(CGFloat)width ;

@end
