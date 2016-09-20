//
//  JXHMessageCell.m
//  NeiHanDuanZi
//
//  Created by juxiaohui on 16/9/20.
//  Copyright © 2016年 juxiaohui. All rights reserved.
//

#import "JXHMessageCell.h"

@implementation JXHMessageCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setFrame:(CGRect)frame{
    
    frame.origin.y += 1;
    frame.size.height -= 1;
    [super setFrame:frame];
}

@end
