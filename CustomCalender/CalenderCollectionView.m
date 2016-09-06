//
//  CalenderCollectionView.m
//  SarvintApp
//
//  Created by Kumaraswamy D R on 31/08/16.
//  Copyright © 2016 Sarvint. All rights reserved.
//

#import "CalenderCollectionView.h"
#import "CalenderViewCell.h"
#import "CalenderCollectionViewLayout.h"

#define MONDAY_STRING                          @"Monday"
#define TUESDAY_STRING                         @"Tuesday"
#define WEDNESDAY_STRING                       @"Wednesday"
#define THURSDAY_STRING                        @"Thursday"
#define FRIDAY_STRING                          @"Friday"
#define SATUARDAY_STRING                       @"Saturday"
#define SUNDAY_STRING                          @"Sunday"

@interface CalenderCollectionView()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic) int startPosition,numberOfDaysInCurrentMonth,dateCount;
@property (nonatomic,strong) NSIndexPath *prevIndexpth;
@end

@implementation CalenderCollectionView

- (instancetype)initWithCalendarDate:(NSDate *)calendarDate
{
    self = [super init];
    if (self)
    {
//        NSDateComponents *comps = [[NSDateComponents alloc] init];
//        [comps setDay:1];
//        [comps setMonth:8];
//        [comps setYear:2015];
//        NSDate *date = [[NSCalendar currentCalendar] dateFromComponents:comps];
        
        
        
        NSDate *date = calendarDate;
        
        
        NSDateFormatter *dataFormatter = [[NSDateFormatter alloc]init];
        [dataFormatter setDateFormat:@"dd"];
        NSString *myDayString = [dataFormatter stringFromDate:date];
        
        [dataFormatter setDateFormat:@"MMM"];
        NSString* myMonthString = [dataFormatter stringFromDate:date];
        
        [dataFormatter setDateFormat:@"yyyy"];
        NSString* myYearString = [dataFormatter stringFromDate:date];
        
        
        NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        NSDateComponents *comp = [gregorian components:(NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear) fromDate:date];
        [comp setDay:1];
        NSDate *firstDayOfMonthDate = [gregorian dateFromComponents:comp];
       
        
       
        [dataFormatter setFormatterBehavior:NSDateFormatterBehavior10_4];
        [dataFormatter setDateFormat:@"EEEE"];
        NSString *weekDay =  [dataFormatter stringFromDate:firstDayOfMonthDate];
        
        
        NSDate *today = date; //Get a date object for today's date
        NSCalendar *c = [NSCalendar currentCalendar];
        NSRange days = [c rangeOfUnit:NSCalendarUnitDay
                               inUnit:NSCalendarUnitMonth
                              forDate:today];
        
        _numberOfDaysInCurrentMonth =(int) days.length;
    
        
        if ([weekDay isEqualToString:MONDAY_STRING])
            _startPosition=1;
        else if ([weekDay isEqualToString:TUESDAY_STRING])
                _startPosition=2;
        else if ([weekDay isEqualToString:WEDNESDAY_STRING])
                    _startPosition=3;
        else if ([weekDay isEqualToString:THURSDAY_STRING])
            _startPosition=4;
        else if ([weekDay isEqualToString:FRIDAY_STRING])
            _startPosition=5;
        else if ([weekDay isEqualToString:SATUARDAY_STRING])
            _startPosition=6;
        else if ([weekDay isEqualToString:SUNDAY_STRING])
            _startPosition=0;

        
         NSLog(@"%@  - %@  - %@  %@",myDayString,myMonthString,myYearString,weekDay);
        
        
        _dateCount = 1;   //Date count to show date on calender
        
        
        CalenderCollectionViewLayout *flowLayout=[[CalenderCollectionViewLayout alloc] init];
        _collectionView=[[UICollectionView alloc]initWithFrame:self.frame collectionViewLayout:flowLayout];
        [_collectionView setDataSource:self];
        [_collectionView setDelegate:self];
        [_collectionView setBackgroundColor:[UIColor whiteColor]];
        _collectionView.bounces= NO;
        [self addSubview:_collectionView];
        [_collectionView registerClass:[CalenderViewCell class] forCellWithReuseIdentifier:@"cellIdent"];
    }
    return self;
}


// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CalenderViewCell *cell = (CalenderViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdent" forIndexPath:indexPath];
    cell.dateLabel.text = [NSString stringWithFormat:@"%d",_dateCount];
    cell.dateLabel.textAlignment = NSTextAlignmentCenter;
    if(indexPath.row <_startPosition)
    {
        cell.circleView.hidden = YES;
        cell.dateLabel.hidden = YES;
    }
    else
        _dateCount++;
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if(_prevIndexpth!=nil)
    {
        CalenderViewCell *cell = (CalenderViewCell *)[_collectionView cellForItemAtIndexPath:_prevIndexpth];
        cell.circleView.backgroundColor= [UIColor clearColor];
        
    }
        _prevIndexpth = indexPath;
    CalenderViewCell *cell = (CalenderViewCell *)[_collectionView cellForItemAtIndexPath:indexPath];
    cell.circleView.backgroundColor= [UIColor yellowColor];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    _collectionView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return  1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _numberOfDaysInCurrentMonth+_startPosition;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.frame.size.width*0.1,self.frame.size.width*0.1);
}

@end
