//
//  SettingView.m
//  ChocChoc
//
//  Created by Sukwon Choi on 2014. 4. 23..
//  Copyright (c) 2014년 TPP. All rights reserved.
//

#import "SettingView.h"
#import "DataClass.h"

@implementation SettingView

+ (id)settingView
{
    SettingView * settingView = [[[NSBundle mainBundle] loadNibNamed:@"SettingView" owner:nil options:nil] lastObject];
    
    // set view frame
    CGRect frame;
    frame = settingView.frame;
    frame.size.height = [[UIScreen mainScreen]bounds].size.height - [DataClass getInstance].tabbarSize;
    settingView.frame = frame;
    
    // make sure customView is not nil or the wrong class!
    if ([settingView isKindOfClass:[SettingView class]])
        return settingView;
    else
        return nil;
}

@end
