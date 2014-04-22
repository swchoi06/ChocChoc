//
//  ViewController.h
//  ChocChoc
//
//  Created by Sukwon Choi on 2014. 4. 22..
//  Copyright (c) 2014년 TPP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    int currentTab;
}

// Views
@property (nonatomic, strong) UIView * heartView;
@property (nonatomic, strong) UIView * statisticView;
@property (nonatomic, strong) UIView * alarmView;
@property (nonatomic, strong) UIView * settingView;

// Tabbar Button
@property (nonatomic, strong) IBOutlet UIButton * heartButton;
@property (nonatomic, strong) IBOutlet UIButton * statisticButton;
@property (nonatomic, strong) IBOutlet UIButton * alarmButton;
@property (nonatomic, strong) IBOutlet UIButton * settingButton;

@property (nonatomic, strong) IBOutlet UIImageView * backgroundImageView;

- (void)uploadView;                     // Call this function if you want to upload/reload currentView
- (IBAction)buttonClicked:(id)sender;

@end
