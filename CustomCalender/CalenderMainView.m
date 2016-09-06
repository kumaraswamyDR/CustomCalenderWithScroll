//
//  CalenderMainView.m
//  SarvintApp
//
//  Created by Kumaraswamy D R on 31/08/16.
//  Copyright © 2016 Sarvint. All rights reserved.
//

#import "CalenderMainView.h"
#import "CalenderCollectionView.h"
#import "CalendarHeaderView.h"

//Days
#define MONDAY1                          @"M"
#define TUESDAY1                         @"T"
#define WEDNESDAY1                       @"W"
#define THURSDAY1                        @"T"
#define FRIDAY1                          @"F"
#define SATUARDAY1                       @"S"
#define SUNDAY1                          @"S"
@interface CalenderMainView()

@property (nonatomic,strong) CalenderCollectionView *calenderCollectionView;
@property (nonatomic,strong) NSMutableArray *weekDaysStringArray;
@property (nonatomic,strong) CalendarHeaderView *calendarHeaderView;
@property (nonatomic,strong) UILabel *currentMonthLabel;
@property (nonatomic,strong) UIButton *previousMonthButton,*nextMonthButton;
@end

@implementation CalenderMainView

- (instancetype)initWithDate:(NSDate *)calenderDate
{
    self = [super init];
    if (self)
    {
        self.layer.cornerRadius = self.frame.size.height*0.2;
        self.layer.borderWidth = 1;
        self.layer.borderColor = [UIColor blackColor].CGColor;
        
        NSDateFormatter *dataFormatter = [[NSDateFormatter alloc]init];
        [dataFormatter setDateFormat:@"MMMM"];
        NSString *currentMonthString = [dataFormatter stringFromDate:calenderDate];
        
        NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
        [offsetComponents setMonth:-1]; // note that I'm setting it to -1
        NSDate *previousMonth = [gregorian dateByAddingComponents:offsetComponents toDate:calenderDate options:0];

        [dataFormatter setDateFormat:@"MMMM"];
        NSString *previousMonthString = [dataFormatter stringFromDate:previousMonth];
        
        [offsetComponents setMonth:+1]; // note that I'm setting it to +1
        NSDate *nextMonth = [gregorian dateByAddingComponents:offsetComponents toDate:calenderDate options:0];
        
        [dataFormatter setDateFormat:@"MMMM"];
        NSString *nextMonthString = [dataFormatter stringFromDate:nextMonth];
        
        _currentMonthLabel = [[UILabel alloc]init];
        _currentMonthLabel.text =currentMonthString;
        _currentMonthLabel.textAlignment = NSTextAlignmentCenter;
        _currentMonthLabel.textColor = [UIColor blackColor];
        [self addSubview:_currentMonthLabel];
        
        _previousMonthButton = [[UIButton alloc]init];
        _previousMonthButton.backgroundColor = [UIColor redColor];
        [_previousMonthButton setTitle:previousMonthString forState:UIControlStateNormal];
        _previousMonthButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        [_previousMonthButton addTarget:self action:@selector(previousButtonClicked) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_previousMonthButton];
        
        _nextMonthButton = [[UIButton alloc]init];
        _nextMonthButton.backgroundColor = [UIColor redColor];
        [_nextMonthButton setTitle:nextMonthString forState:UIControlStateNormal];
         _nextMonthButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        [_nextMonthButton addTarget:self action:@selector(previousButtonClicked) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_nextMonthButton];
        
        _weekDaysStringArray = [[NSMutableArray alloc]initWithObjects:SUNDAY1,MONDAY1,TUESDAY1,WEDNESDAY1,THURSDAY1,FRIDAY1,SATUARDAY1,nil];
        _calenderCollectionView = [[CalenderCollectionView alloc]initWithCalendarDate:calenderDate];
        [self addSubview:_calenderCollectionView];
        _calendarHeaderView = [[CalendarHeaderView alloc]initWithWeekArray:_weekDaysStringArray];
        [self addSubview:_calendarHeaderView];
        

    }
    return self;
}
-(void)previousButtonClicked
{
    
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    _calendarHeaderView.frame = CGRectMake(0, 0, self.frame.size.width,self.frame.size.height*0.08);
    _currentMonthLabel.frame = CGRectMake(0, 0, self.frame.size.width*0.4, self.frame.size.height*0.12);
    _currentMonthLabel.center = CGPointMake(self.frame.size.width/2,_calendarHeaderView.frame.size.height+_currentMonthLabel.frame.size.height/2);
    _previousMonthButton.frame = CGRectMake(0, _calendarHeaderView.frame.size.height, self.frame.size.width*0.3, self.frame.size.height*0.12);
    _nextMonthButton.frame = CGRectMake(self.frame.size.width*0.7, _calendarHeaderView.frame.size.height, self.frame.size.width*0.3, self.frame.size.height*0.12);
     _calenderCollectionView.frame = CGRectMake(self.frame.size.width*0.05, _previousMonthButton.frame.origin.y+_previousMonthButton.frame.size.height*1.2, self.frame.size.width*0.9, self.frame.size.height*0.84);
   
    
}
@end
