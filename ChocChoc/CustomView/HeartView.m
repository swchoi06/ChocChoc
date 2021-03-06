//
//  HeartView.m
//  ChocChoc
//
//  Created by Sukwon Choi on 2014. 4. 23..
//  Copyright (c) 2014년 TPP. All rights reserved.
//

#import "HeartView.h"
#import "DataClass.h"
#import "UIColor+COLORCategories.h"

@implementation HeartView
@synthesize heartImage, smallHeart1, smallHeart2;
@synthesize textLabel, textLabel2, textLabel3;

+ (id)heartView
{
    HeartView * heartView = [[[NSBundle mainBundle] loadNibNamed:@"HeartView" owner:nil options:nil] lastObject];
    
    // Hide small heart
    [[heartView smallHeart1] setHidden:YES];
    [[heartView smallHeart2] setHidden:YES];
    
    // set heart image
    DataClass * instance = [DataClass getInstance];
    int percent = instance.percent;
    if(percent == 0){
        [[heartView heartImage] setImage:[UIImage imageNamed:@"0"]];
    }else{
        percent = (percent/10) * 10 + 10;
        if(percent > 100){
            percent = 100;
        }
        [[heartView heartImage] setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d", percent]]];
        if(percent == 90){
            [[heartView smallHeart1] setHidden:NO];
        }else if(percent == 100){
            [[heartView smallHeart2] setHidden:NO];
        }
    }
    
    // set Text Label
    [[heartView textLabel] setFont:[UIFont fontWithName:@"Futura-CondensedMedium" size:26]];
    [[heartView textLabel] setTextColor:[UIColor colorWithRGBHex:0xF37F92]];
    [[heartView textLabel] setText:[NSString stringWithFormat:@"%d분 / %d분", (int)instance.recharge, (int)instance.discharge]];
    
    [[heartView textLabel2] setTextColor:[UIColor colorWithRGBHex:0x666666]];
    [[heartView textLabel2] setText:[NSString stringWithFormat:@"마지막 스킨십으로부터 %d분 지났습니다", (int)instance.timeFromLastCharge]];
    
    [[heartView textLabel3] setTextColor:[UIColor colorWithRGBHex:0x666666]];
    if(instance.percent == 0){
        [[heartView textLabel3]setText:instance.stringArray[0]];
    }else if(instance.percent <10){
        [[heartView textLabel3]setText:instance.stringArray[1]];
    }else if(instance.percent <50){
        [[heartView textLabel3]setText:instance.stringArray[2]];
    }else if(instance.percent <90){
        [[heartView textLabel3]setText:instance.stringArray[3]];
    }else if(instance.percent <100){
        [[heartView textLabel3]setText:instance.stringArray[4]];
    }else{
        [[heartView textLabel3]setText:instance.stringArray[5]];
    }
    
    // set view frame
    CGRect frame;
    frame = heartView.frame;
    frame.size.height = [[UIScreen mainScreen]bounds].size.height - [DataClass getInstance].tabbarSize;
    heartView.frame = frame;
    
    // make sure customView is not nil or the wrong class!
    if ([heartView isKindOfClass:[HeartView class]])
        return heartView;
    else
        return nil;
}
@end
