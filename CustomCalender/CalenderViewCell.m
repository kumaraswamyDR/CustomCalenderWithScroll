//
//  CalenderViewCell.m
//  SarvintApp
//
//  Created by Kumaraswamy D R on 31/08/16.
//  Copyright © 2016 Sarvint. All rights reserved.
//

#import "CalenderViewCell.h"

@interface CalenderViewCell()

@end

@implementation CalenderViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _circleView = [[UIView alloc]init];
//        _circleView.backgroundColor = [UIColor greenColor];
        _circleView.layer.cornerRadius = self.frame.size.width/2;
        [self.contentView addSubview:_circleView];
        
        _dateLabel = [[UILabel alloc]init];
        _dateLabel.textColor = [UIColor blackColor];
        [_circleView addSubview:_dateLabel];
        
    }
    return self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    _circleView.frame = self.contentView.frame;
    _dateLabel.frame = _circleView.frame;
 
}
@end
