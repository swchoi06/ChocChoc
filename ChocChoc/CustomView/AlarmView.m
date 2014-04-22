//
//  AlarmView.m
//  ChocChoc
//
//  Created by Sukwon Choi on 2014. 4. 23..
//  Copyright (c) 2014년 TPP. All rights reserved.
//

#import "AlarmView.h"
#import "DataClass.h"

@implementation AlarmView

+ (id)alarmView
{
    AlarmView * alarmView = [[[NSBundle mainBundle] loadNibNamed:@"AlarmView" owner:nil options:nil] lastObject];
    
    // set view frame
    CGRect frame;
    frame = alarmView.frame;
    frame.size.height = [[UIScreen mainScreen]bounds].size.height - [DataClass getInstance].tabbarSize;
    alarmView.frame = frame;
    
    // make sure customView is not nil or the wrong class!
    if ([alarmView isKindOfClass:[AlarmView class]])
        return alarmView;
    else
        return nil;
}

@end
