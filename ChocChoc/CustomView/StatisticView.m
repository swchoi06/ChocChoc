//
//  StatisticView.m
//  ChocChoc
//
//  Created by Sukwon Choi on 2014. 4. 23..
//  Copyright (c) 2014년 TPP. All rights reserved.
//

#import "StatisticView.h"
#import "DataClass.h"
@implementation StatisticView

+ (id)statisticView
{
    StatisticView * statisticView = [[[NSBundle mainBundle] loadNibNamed:@"StatisticView" owner:nil options:nil] lastObject];
    
    // set view frame
    CGRect frame;
    frame = statisticView.frame;
    frame.size.height = [[UIScreen mainScreen]bounds].size.height - [DataClass getInstance].tabbarSize;
    statisticView.frame = frame;
    
    // make sure customView is not nil or the wrong class!
    if ([statisticView isKindOfClass:[StatisticView class]])
        return statisticView;
    else
        return nil;
}

@end
