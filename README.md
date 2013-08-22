UILineChartView
===============

趋势图
通过 PCLineChartView 进行个人优化


UILineChartView 使用方法
===============
    NSDictionary *dict=[[NSDictionary alloc]initWithObjectsAndKeys:
                        [NSArray arrayWithObjects:
                         [NSDictionary dictionaryWithObjectsAndKeys:
                                                   [NSArray arrayWithObjects:@100,@20,@30,@0,nil],
                                                   @"data",@"test",@"title", nil],
                         nil],
                        @"data",
                        [NSArray arrayWithObjects:@1,@2,@3,@4, nil],@"x_labels", nil];
  
    UILineChartView *view=[[UILineChartView alloc]initWithFrame:self.view.frame setContentSize:CGSizeMake(500, self.view.frame.size.height)];
    view.dictData=dict;
    view.interval=50;
    view.maxValue=100;
    view.minValue=-150;
    view.drawYAxis=NO;
    [self.view addSubview:view];
    

PCLineChartView 使用方法
===============
    PCLineChartView* lineChartView = [[PCLineChartView alloc] initWithFrame:self.view.frame];
    lineChartView.interval=50;
    lineChartView.minValue=-150;
    lineChartView.maxValue=100;
    [lineChartView setAutoresizingMask:UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight];
    [self.view addSubview:lineChartView];

    
    NSDictionary *dict=[[NSDictionary alloc]initWithObjectsAndKeys:
                        [NSArray arrayWithObjects:
                         [NSDictionary dictionaryWithObjectsAndKeys:
                                                   [NSArray arrayWithObjects:@100,@20,@30,@0,nil],
                                                   @"data",@"test",@"title", nil],
                         nil],
                        @"data",
                        [NSArray arrayWithObjects:@1,@2,@3,@4, nil],@"x_labels", nil];
    
    NSMutableArray *components = [NSMutableArray array];
    for (int i=0; i<[[dict objectForKey:@"data"] count]; i++)
    {
        NSDictionary *point = [[dict objectForKey:@"data"] objectAtIndex:i];
        PCLineChartViewComponent *component = [[PCLineChartViewComponent alloc] init];
        [component setTitle:[point objectForKey:@"title"]];
        [component setPoints:[point objectForKey:@"data"]];
        [component setShouldLabelValues:NO];
        
        if (i==0)
        {
            [component setColour:PCColorYellow];
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
            [component setColour:PCColorBlue];
        }
        
        [components addObject:component];
    }
    [lineChartView setComponents:components];
    [lineChartView setXLabels:[dict objectForKey:@"x_labels"]];
