//
//  UIView+JXHFrame.m
//  NeiHanDuanZi
//
//  Created by juxiaohui on 16/9/21.
//  Copyright © 2016年 juxiaohui. All rights reserved.
//

#import "UIView+JXHFrame.h"

@implementation UIView (JXHFrame)

-(CGFloat)jxh_x{
    
    return self.frame.origin.x;
}

-(void)setJxh_x:(CGFloat)jxh_x{
    
    CGRect frame = self.frame;
    
    frame.origin.x=jxh_x;
    
    self.frame=frame;
    
}

-(CGFloat)jxh_y{
    
    return self.frame.origin.y;
}

-(void)setJxh_y:(CGFloat)jxh_y{
    
    CGRect frame = self.frame;
    
    frame.origin.y=jxh_y;
    
    self.frame=frame;
    
}

-(CGFloat)jxh_width{
    
    return self.frame.size.width;
}

-(void)setJxh_width:(CGFloat)jxh_width{
    
    CGRect frame = self.frame;
    
    frame.size.width = jxh_width;
    
    self.frame = frame;
}

-(CGFloat)jxh_height{
    
    return self.frame.size.height;
}

-(void)setJxh_height:(CGFloat)jxh_height{
    
    CGRect frame = self.frame;
    
    frame.size.height = jxh_height;
    
    self.frame = frame;
}

-(void)setJxh_centerX:(CGFloat)jxh_centerX{
    
    CGPoint center = self.center;
    
    center.x = jxh_centerX;
    
    self.center = center;
    
}

-(CGFloat)jxh_centerX{
    
    return self.center.x;
}

-(void)setJxh_centerY:(CGFloat)jxh_centerY{
    
    CGPoint center = self.center;
    
    center.y = jxh_centerY;
    
    self.center = center;
    
}

-(CGFloat)jxh_centerY{
    
    return self.center.y;
    
}

-(void)setJxh_right:(CGFloat)jxh_right{
    
    self.jxh_x = jxh_right - self.jxh_width;
    
}

-(CGFloat)jxh_right{
    
    return CGRectGetMaxX(self.frame);
    
}

-(void)setJxh_bottom:(CGFloat)jxh_bottom{
    
    self.jxh_y = jxh_bottom - self.jxh_height;
    
}
-(CGFloat)jxh_bottom{
    
    return CGRectGetMaxY(self.frame);
}


@end
