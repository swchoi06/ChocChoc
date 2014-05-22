//
//  ViewController.m
//  ChocChoc
//
//  Created by Sukwon Choi on 2014. 4. 22..
//  Copyright (c) 2014년 TPP. All rights reserved.
//

#import "ViewController.h"
#import "HeartView.h"
#import "StatisticView.h"
#import "AlarmView.h"
#import "SettingView.h"
#import "DataClass.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize heartView, statisticView, alarmView, settingView;
@synthesize heartButton, statisticButton, alarmButton, settingButton, backgroundImageView;

- (void)uploadView{
    // Update Dataclass here
    DataClass * instance = [DataClass getInstance];
    
    
    
    // 
    [self changeTab:currentTab];
    [DataClass saveCustomObject:instance key:@"dataclass"];
}

- (void)changeTab:(int)index{
    // Change button state
    for (UIView *view in heartButton.superview.subviews) {
        if ([view isKindOfClass:[UIButton class]]) {
            if(view.tag == index){
                [(UIButton *)view setSelected:YES];
            }else{
                [(UIButton *)view setSelected:NO];
            }
        }
    }
    
    // Change tab background
    [backgroundImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"icon_bar_0%d", index]]];
    
    // Remove current View
    switch (currentTab) {
        case 1:
            [heartView removeFromSuperview];
            break;
        case 2:
            [statisticView removeFromSuperview];
            break;
        case 3:
            [alarmView removeFromSuperview];
            break;
        case 4:
            [settingView removeFromSuperview];
            break;
            
        default:
            break;
    }
    
    // Add new View
    switch (index) {
        case 1:
            heartView = [HeartView heartView];
            [self.view addSubview:heartView];
            break;
        case 2:
            statisticView = [StatisticView statisticView];
            [self.view addSubview:statisticView];
            break;
        case 3:
            alarmView = [AlarmView alarmView];
            [self.view addSubview:alarmView];
            break;
        case 4:
            settingView = [SettingView settingView];
            [self.view addSubview:settingView];
            break;
            
        default:
            break;
    }
    
    // Update currentTab
    currentTab = index;
}
- (IBAction)buttonClicked:(id)sender{
    [self changeTab:[sender tag]];
}
- (void)initButtons{
    heartButton.tag = 1;
    statisticButton.tag = 2;
    alarmButton.tag = 3;
    settingButton.tag = 4;
    
    [heartButton setBackgroundImage:[UIImage imageNamed:@"icon_heart_up"] forState:UIControlStateNormal];
    [heartButton setBackgroundImage:[UIImage imageNamed:@"icon_heart_dn"] forState:UIControlStateSelected];
    [heartButton setBackgroundImage:[UIImage imageNamed:@"icon_heart_dn"] forState:UIControlStateHighlighted];
    
    [statisticButton setBackgroundImage:[UIImage imageNamed:@"icon_stats_up"] forState:UIControlStateNormal];
    [statisticButton setBackgroundImage:[UIImage imageNamed:@"icon_stats_dn"] forState:UIControlStateSelected];
    [statisticButton setBackgroundImage:[UIImage imageNamed:@"icon_stats_dn"] forState:UIControlStateHighlighted];
    
    [alarmButton setBackgroundImage:[UIImage imageNamed:@"icon_alarm_up"] forState:UIControlStateNormal];
    [alarmButton setBackgroundImage:[UIImage imageNamed:@"icon_alarm_dn"] forState:UIControlStateSelected];
    [alarmButton setBackgroundImage:[UIImage imageNamed:@"icon_alarm_dn"] forState:UIControlStateHighlighted];
    
    [settingButton setBackgroundImage:[UIImage imageNamed:@"icon_setting_up"] forState:UIControlStateNormal];
    [settingButton setBackgroundImage:[UIImage imageNamed:@"icon_setting_dn"] forState:UIControlStateSelected];
    [settingButton setBackgroundImage:[UIImage imageNamed:@"icon_setting_dn"] forState:UIControlStateHighlighted];
}
- (void)initViews{
    // Init mainView
    heartView = [HeartView heartView];
    
    // Init statisticView
    statisticView =  [StatisticView statisticView];
    
    // Init alarmView
    alarmView = [AlarmView alarmView];
    
    // Init settingView
    settingView = [SettingView settingView];
    
    // Init tags
    heartView.tag = 1;
    statisticView.tag = 2;
    alarmView.tag = 3;
    settingView.tag = 4;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Init Buttons
    [self initButtons];
    
    // Init Views
    [self initViews];
    
    currentTab = 1;
    [self changeTab:currentTab];
    

    // Set update function
    [self uploadView];
    [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(uploadView) userInfo:nil repeats:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
