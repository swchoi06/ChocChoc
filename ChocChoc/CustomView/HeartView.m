//
//  HeartView.m
//  ChocChoc
//
//  Created by Sukwon Choi on 2014. 4. 23..
//  Copyright (c) 2014년 TPP. All rights reserved.
//

#import "HeartView.h"
#import "DataClass.h"

@implementation HeartView
@synthesize heartImage;

+ (id)heartView
{
    HeartView * heartView = [[[NSBundle mainBundle] loadNibNamed:@"HeartView" owner:nil options:nil] lastObject];
    
    // set heart image
    DataClass * instance = [DataClass getInstance];
    int percent = instance.percent;
    percent = (percent/10) * 10;
    [[heartView heartImage] setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d", percent]]];
    
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
