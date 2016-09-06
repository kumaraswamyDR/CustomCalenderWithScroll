//
//  ViewController.m
//  CustomCalender
//
//  Created by Kumaraswamy D R on 01/09/16.
//  Copyright © 2016 TechLeraner. All rights reserved.
//

#import "ViewController.h"
#import "CalenderViewController.h"
#import "CalendarScrollView.h"
@interface ViewController ()
@property (nonatomic,strong) CalendarScrollView *calendarScrollView;
@end

@implementation ViewController

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
