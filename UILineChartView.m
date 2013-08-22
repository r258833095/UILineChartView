//
//  UILineChartView.m
//  UIPlot
//
//  Created by 斌 on 13-8-21.
//  Copyright (c) 2013年 斌. All rights reserved.
//

#import "UILineChartView.h"
#import "PCLineChartView.h"
@implementation UILineChartView
@synthesize interval, minValue, maxValue;
@synthesize dictData;
@synthesize drawYAxis;
static CGSize contentSize;
- (id)initWithFrame:(CGRect)frame setContentSize:(CGSize)size
{
    self = [super initWithFrame:frame];
    if (self) {
        contentSize = size;
        self.backgroundColor=[UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    
    PCLineChartView* xlineChartView = [[PCLineChartView alloc] initWithFrame:CGRectMake(0,0,self.frame.size.width,self.frame.size.height)];
    if (interval) {
        xlineChartView.interval=interval;
    }
    if (minValue) {
        xlineChartView.minValue=minValue;
    }
    if (maxValue) {
        xlineChartView.maxValue=maxValue;
    }
    [xlineChartView setAutoresizingMask:UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight];
    [self addSubview:xlineChartView];
    
    UIScrollView *scrollView=[[UIScrollView alloc]initWithFrame:CGRectMake((drawYAxis?0:50), 0, self.frame.size.width-(drawYAxis?0:50), self.frame.size.height)];
    scrollView.contentSize = contentSize;
    [scrollView setBackgroundColor:[UIColor clearColor]];
    [self addSubview:scrollView];
    
    PCLineChartView* lineChartView = [[PCLineChartView alloc] initWithFrame:CGRectMake((drawYAxis?0:-50),0,contentSize.width+(drawYAxis?0:50),contentSize.height)];
    if (interval) {
        lineChartView.interval = interval;
    }
    if (minValue) {
        lineChartView.minValue = minValue;
    }
    if (maxValue) {
        lineChartView.maxValue = maxValue;
    }
    lineChartView.drawYAxis = drawYAxis;
    
    
    [lineChartView setAutoresizingMask:UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight];
    [scrollView addSubview:lineChartView];
    
    
    NSMutableArray *components = [NSMutableArray array];
    for (int i=0; i<[[dictData objectForKey:@"data"] count]; i++)
    {
        NSDictionary *point = [[dictData objectForKey:@"data"] objectAtIndex:i];
        PCLineChartViewComponent *component = [[PCLineChartViewComponent alloc] init];
        [component setTitle:[point objectForKey:@"title"]];
        [component setPoints:[point objectForKey:@"data"]];
        [component setShouldLabelValues:NO];
        
        if (i==0)
        {
            [component setColour:PCColorBlue];
        }
        else if (i==1)
        {
            [component setColour:PCColorGreen];
        }
        else if (i==2)
        {
            [component setColour:PCColorOrange];
        }
        else if (i==3)
        {
            [component setColour:PCColorRed];
        }
        else if (i==4)
        {
            [component setColour:PCColorYellow];
        }
        
        [components addObject:component];
    }
    [lineChartView setComponents:components];
    [lineChartView setXLabels:[dictData objectForKey:@"x_labels"]];
}
@end
