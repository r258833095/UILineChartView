//
//  UILineChartView.h
//  UIPlot
//
//  Created by 斌 on 13-8-21.
//  Copyright (c) 2013年 斌. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILineChartView : UIView

- (id)initWithFrame:(CGRect)frame setContentSize:(CGSize)size;

@property (nonatomic, assign) float interval;

@property (nonatomic, assign) float minValue;

@property (nonatomic, assign) float maxValue;

@property (nonatomic, retain) NSDictionary *dictData;
/*
 dicData Format:
{
    @"data"=[
        {
            @"data"=[@100,@20,@30,@0],
            @"title"=@"test"
        }
    ],

    @"x_labels"=[@1,@2,@3,@4]
 }
 */

@end
