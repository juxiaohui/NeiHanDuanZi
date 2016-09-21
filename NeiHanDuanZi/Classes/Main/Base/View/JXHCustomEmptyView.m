//
//  JXHCustomEmptyView.m
//  NeiHanDuanZi
//
//  Created by juxiaohui on 16/9/20.
//  Copyright © 2016年 juxiaohui. All rights reserved.
//

#import "JXHCustomEmptyView.h"
#import "NSString+JXHExt.h"
#import "NSAttributedString+JXHExt.h"

@interface JXHCustomEmptyView ()

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *secondTitle;
@property (nonatomic, copy) NSMutableAttributedString *attributedTitle;
@property (nonatomic, copy) NSMutableAttributedString *secondAttributedTitle;
@property (nonatomic, copy) NSString *iconname;

@end

@implementation JXHCustomEmptyView


- (UILabel *)firstL {
    if (!_firstL) {
        UILabel *label = [[UILabel alloc] init];
        [self addSubview:label];
        _firstL = label;
        label.font = JXHNormalFont(16);
        label.textColor = [UIColor colorWithRed:0.17f green:0.23f blue:0.28f alpha:1.00f];
        label.textAlignment = NSTextAlignmentCenter;
        label.numberOfLines = 0;
    }
    return _firstL;
}

- (UILabel *)secondL {
    if (!_secondL) {
        UILabel *label = [[UILabel alloc] init];
        [self addSubview:label];
        _secondL = label;
        label.font = JXHNormalFont(14);
        label.textColor = [UIColor colorWithRed:0.63f green:0.63f blue:0.63f alpha:1.00f];
        label.textAlignment = NSTextAlignmentCenter;
        label.numberOfLines = 0;
    }
    return _secondL;
}

- (UIImageView *)topTipImageView {
    if (!_topTipImageView) {
        UIImageView *img = [[UIImageView alloc] init];
        [self addSubview:img];
        _topTipImageView = img;
        img.layer.masksToBounds = YES;
    }
    return _topTipImageView;
}


- (instancetype)initWithTitle:(NSString *)title
                  secondTitle:(NSString *)secondTitle
                     iconname:(NSString *)iconname {
    if (self = [super init]) {
        self.title = title;
        self.secondTitle = secondTitle;
        self.iconname = iconname;
    }
    return self;
}

- (instancetype)initWithAttributedTitle:(NSMutableAttributedString *)attributedTitle
                  secondAttributedTitle:(NSMutableAttributedString *)secondAttributedTitle
                               iconname:(NSString *)iconname {
    if (self = [super init]) {
        self.attributedTitle = attributedTitle;
        self.secondAttributedTitle = secondAttributedTitle;
        self.iconname = iconname;
    }
    return self;
}
- (void)showInView:(UIView *)view {
    if (view) {
        CGFloat selfH = 0;
        if (self.secondAttributedTitle || self.secondTitle) {
            selfH = 170;
        } else {
            selfH = 140;
        }
        [view addSubview:self];
        self.frame = CGRectMake(0, 0, view.jxh_width, selfH);
    }
}

- (void)setTitle:(NSString *)title {
    _title = title;
    if ([title isKindOfClass:[NSString class]]) {
        self.firstL.text = title;
    }
}

- (void)setSecondTitle:(NSString *)secondTitle {
    _secondTitle = secondTitle;
    if ([secondTitle isKindOfClass:[NSString class]]) {
        self.secondL.text = secondTitle;
    }
}

- (void)setAttributedTitle:(NSMutableAttributedString *)attributedTitle {
    _attributedTitle = attributedTitle;
    if ([attributedTitle isKindOfClass:[NSAttributedString class]]) {
        self.firstL.attributedText = attributedTitle;
    }
}

- (void)setSecondAttributedTitle:(NSMutableAttributedString *)secondAttributedTitle {
    _secondAttributedTitle = secondAttributedTitle;
    if ([secondAttributedTitle isKindOfClass:[NSAttributedString class]]) {
        self.secondL.attributedText = secondAttributedTitle;
    }
}

- (void)setIconname:(NSString *)iconname {
    _iconname = iconname;
    if ([iconname isKindOfClass:[NSString class]]) {
        self.topTipImageView.image = [UIImage imageNamed:iconname];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];

    //图片
    CGFloat topTipW = self.topTipImageView.image.size.width;
    CGFloat topTipX = ScreenWidth / 2.0 - topTipW / 2.0;
    CGFloat topTipY = 30;
    CGFloat topTipH = self.topTipImageView.image.size.height;
    self.topTipImageView.frame = CGRectMake(topTipX, topTipY, topTipW, topTipH);
    
    if (self.title) {
        CGFloat firstW = ScreenWidth - 80 * 2;
        CGFloat firstX = (ScreenWidth - firstW) / 2.0;
        CGFloat firstY = self.topTipImageView.jxh_bottom;
        CGFloat firstH = [self.title heightWithFont:self.firstL.font constrainedToWidth:firstW];
        self.firstL.frame = CGRectMake(firstX, firstY, firstW, firstH);
    } else if (self.attributedTitle) {
        CGFloat firstW = ScreenWidth - 80 * 2;
        CGFloat firstX = (ScreenWidth - firstW) / 2.0;
        CGFloat firstY = self.topTipImageView.jxh_bottom + 8;
        CGFloat firstH = [self.attributedTitle heightWithConstrainedWidth:firstW];
        self.firstL.frame = CGRectMake(firstX, firstY, firstW, firstH);
    } else {
        CGFloat firstW = ScreenWidth - 80 * 2;
        CGFloat firstX = (ScreenWidth - firstW) / 2.0;
        CGFloat firstY = self.topTipImageView.jxh_bottom + 0;
        CGFloat firstH = 0;
        self.firstL.frame = CGRectMake(firstX, firstY, firstW, firstH);
    }
    
    if (self.secondTitle) {
        CGFloat secondX = self.firstL.jxh_x;
        CGFloat secondY = self.firstL.jxh_bottom + 8;
        CGFloat secondW = self.firstL.jxh_width;
        CGFloat secondH = [self.secondTitle heightWithFont:self.secondL.font constrainedToWidth:secondW];
        self.secondL.frame = CGRectMake(secondX, secondY, secondW, secondH);
    } else if (self.secondAttributedTitle) {
        CGFloat secondX = self.firstL.jxh_x;
        CGFloat secondY = self.firstL.jxh_bottom + 8;
        CGFloat secondW = self.firstL.jxh_width;
        CGFloat secondH = [self.secondAttributedTitle heightWithConstrainedWidth:secondW];
        self.secondL.frame = CGRectMake(secondX, secondY, secondW, secondH);
    } else {
        CGFloat secondX = self.firstL.jxh_x;
        CGFloat secondY = self.firstL.jxh_bottom + 8;
        CGFloat secondW = self.firstL.jxh_width;
        CGFloat secondH = 0;
        self.secondL.frame = CGRectMake(secondX, secondY, secondW, secondH);
    }
}


@end
