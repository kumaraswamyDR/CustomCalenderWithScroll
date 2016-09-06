//
//  CalenderViewController.m
//  SarvintApp
//
//  Created by Kumaraswamy D R on 31/08/16.
//  Copyright © 2016 Sarvint. All rights reserved.
//

#import "CalenderViewController.h"
#import "CalendarScrollView.h"

@interface CalenderViewController ( )
@property (nonatomic,strong) CalendarScrollView *calendarScrollView;
@end

@implementation CalenderViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _calendarScrollView = [[CalendarScrollView alloc]init];
    [self.view addSubview:_calendarScrollView];
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
-(void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    _calendarScrollView.frame = CGRectMake(0, self.view.frame.size.height*0.1, self.view.frame.size.width, self.view.frame.size.height*0.54);
}


@end
