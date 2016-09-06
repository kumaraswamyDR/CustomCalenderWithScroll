//
//  CalendarHeaderView.m
//  SarvintApp
//
//  Created by Kumaraswamy D R on 01/09/16.
//  Copyright © 2016 Sarvint. All rights reserved.
//

#import "CalendarHeaderView.h"

@interface CalendarHeaderView()
@property (nonatomic,strong) NSMutableArray *weekLabelArray;
@end

@implementation CalendarHeaderView

- (instancetype)initWithWeekArray:(NSMutableArray *)weekArray
{
    self = [super init];
    if (self)
    {
        self.layer.cornerRadius = self.frame.size.height*0.2;
        self.layer.borderWidth=2;
        self.layer.borderColor = [UIColor redColor].CGColor;
        _weekLabelArray = [[NSMutableArray  alloc]init];
        for (int i=0; i<weekArray.count; i++)
        {
             UILabel *dayNameLabel = [[UILabel alloc]init];
            dayNameLabel.text = [weekArray objectAtIndex:i];
            dayNameLabel.textColor = [UIColor blackColor];
            dayNameLabel.textAlignment = NSTextAlignmentCenter;
            
            [self addSubview:dayNameLabel];
            [_weekLabelArray addObject:dayNameLabel];
        }
    }
    return self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    float labelWidth = (self.frame.size.width-self.frame.size.width*0.04)/7;
    for (int i=0; i<_weekLabelArray.count; i++)
    {
        ((UILabel *)[_weekLabelArray objectAtIndex:i]).frame = CGRectMake((i*labelWidth+self.frame.size.width*0.02), 0, labelWidth, self.frame.size.height);
    }
    
}
@end
