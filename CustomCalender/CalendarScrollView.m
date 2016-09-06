//
//  CalendarScrollView.m
//  SarvintApp
//
//  Created by Kumaraswamy D R on 01/09/16.
//  Copyright © 2016 Sarvint. All rights reserved.
//

#import "CalendarScrollView.h"
#import "CalenderMainView.h"

@interface CalendarScrollView()<UIScrollViewDelegate>
@property (nonatomic,strong) CalenderMainView *calenderMainView;
@property (nonatomic,strong)  NSMutableArray *calenderMainViewArray,*calendarDateArray;

@end

@implementation CalendarScrollView
- (instancetype)init
{
    self = [super init];
    if (self)
    {
        _calenderMainViewArray = [[NSMutableArray alloc]init];
        _calendarDateArray = [[NSMutableArray alloc]init];
        self.delegate = self;
        self.bounces = NO;
        self.showsHorizontalScrollIndicator = NO;
        _calendarDateArray = [[self getCalendarDateArrayWithStartingDate:[self getPreviousYearDateFromCurrentDate]] mutableCopy];
        for(int i=0;i<13;i++)
        {
            _calenderMainView = [[CalenderMainView alloc]initWithDate:[_calendarDateArray objectAtIndex:i]];
            [self addSubview:_calenderMainView];
            [_calenderMainViewArray addObject:_calenderMainView];
        }
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    self.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    self.contentSize = CGSizeMake(_calenderMainViewArray.count*self.frame.size.width, self.frame.size.height);
    for(int i=0;i<_calenderMainViewArray.count;i++)
        ((CalenderMainView *)[_calenderMainViewArray objectAtIndex:i]).frame = CGRectMake(i*(self.frame.size.width), 0, self.frame.size.width, self.frame.size.height);
    
}
-(NSDate *)getPreviousYearDateFromCurrentDate
{
    NSDate *date = [NSDate date];
    NSDateFormatter *dataFormatter = [[NSDateFormatter alloc]init];
    [dataFormatter setDateFormat:@"dd"];
    NSString *myDayString = [dataFormatter stringFromDate:date];
    
    [dataFormatter setDateFormat:@"MM"];
    NSString* myMonthString = [dataFormatter stringFromDate:date];
    
    [dataFormatter setDateFormat:@"yyyy"];
    NSString* myYearString = [dataFormatter stringFromDate:date];
    
    
    NSLog(@"%@  - %@  - %@ ",myDayString,myMonthString,myYearString);
    
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    [comps setDay:1];
    [comps setMonth:[myMonthString intValue]];
    [comps setYear:[myYearString intValue]-1];
    NSDate *date1 = [[NSCalendar currentCalendar] dateFromComponents:comps];
    
    return date1;
}

-(NSArray *)getCalendarDateArrayWithStartingDate:(NSDate *)startDate
{
    NSMutableArray *calenderDatesArray = [[NSMutableArray alloc]init];
    NSDateFormatter *dataFormatter = [[NSDateFormatter alloc]init];
    [dataFormatter setDateFormat:@"dd"];
    NSString *myDayString = [dataFormatter stringFromDate:startDate];
    
    [dataFormatter setDateFormat:@"MM"];
    NSString* myMonthString = [dataFormatter stringFromDate:startDate];
    
    [dataFormatter setDateFormat:@"yyyy"];
    NSString* myYearString = [dataFormatter stringFromDate:startDate];
    
    int MonthCount = [myMonthString intValue];
    int MonthCountExcced =0;
    NSLog(@"%@  - %@  - %@ ",myDayString,myMonthString,myYearString);
    for (int i=0; i<13; i++)
    {
        NSDateComponents *comps = [[NSDateComponents alloc] init];
        [comps setDay:1];
        if(MonthCount<=12)
        [comps setMonth:MonthCount];
        else
        {
          [comps setMonth:MonthCount];
            MonthCountExcced++;
        }
        if(MonthCount<=12)
        [comps setYear:[myYearString intValue]];
        else
        [comps setYear:[myYearString intValue]];
        NSDate *date1 = [[NSCalendar currentCalendar] dateFromComponents:comps];
        [calenderDatesArray addObject:date1];
        MonthCount++;
    }
    return calenderDatesArray;
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self makePaginationWithContentX:scrollView.contentOffset.x];
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (!decelerate)
        [self makePaginationWithContentX:scrollView.contentOffset.x];
}

-(void)makePaginationWithContentX:(float)contentX
{
    int scrollPer = ((int)contentX) / ((int)(self.frame.size.width/2));
    if (scrollPer % 2 == 0)
        [self scrollRectToVisible:CGRectMake((scrollPer/2)*self.frame.size.width, self.frame.origin.y, self.frame.size.width, self.frame.size.height) animated:YES];
    else
        [self scrollRectToVisible:CGRectMake(((scrollPer/2)+1)*self.frame.size.width, self.frame.origin.y, self.frame.size.width, self.frame.size.height) animated:YES];
    
        NSLog(@"(scrollPer) : %d",scrollPer);
}

@end
