//
//  JXHMacros.h
//  NeiHanDuanZi
//
//  Created by juxiaohui on 16/9/14.
//  Copyright © 2016年 juxiaohui. All rights reserved.
//

#ifndef JXHMacros_h
#define JXHMacros_h

//**************调试和发布版本之间的设置*****************
#ifdef DEBUG //调试模式--模拟器

#define JXHLog(...) NSLog(__VA_ARGS__)  //公司自定义打印

#else //发布模式 RELEASE--真机

#define JXHLog(...)  //发布版本下取消自定义打印，自定义打印不起作用

#endif

#define SH  [UIScreen mainScreen].bounds.size.height

#define SW  [UIScreen mainScreen].bounds.size.width

#define ScreenWidth  (SH < SW ? SH : SW)

#define ScreenHeight (SH > SW ? SH : SW)

#define iOS(version) ([[UIDevice currentDevice].systemVersion doubleValue]>=(version))

#define JXHNormalFont(size) [UIFont systemFontOfSize:size]

#define JXHBoldFont(size) [UIFont boldSystemFontOfSize:size]

#define JXHRGBColor(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

#define JXHRGBAColor(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

#define JXHGlobalColor  [UIColor colorWithRed:0.94f green:0.94f blue:0.94f alpha:1.00f];

#define JXHWeakSelf __weak typeof(self) weakSelf = self;

#define JXHUserDefaults [NSUserDefaults standardUserDefaults]

#define JXHLogFunc JXHLog(@"%s", __FUNCTION__);


#endif /* JXHMacros_h */
