//
//  HeartView.h
//  ChocChoc
//
//  Created by Sukwon Choi on 2014. 4. 23..
//  Copyright (c) 2014년 TPP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeartView : UIView{
    
}
@property (nonatomic, strong) IBOutlet UIImageView * heartImage;
@property (nonatomic, strong) IBOutlet UIImageView * smallHeart1;
@property (nonatomic, strong) IBOutlet UIImageView * smallHeart2;

@property (nonatomic, strong) IBOutlet UILabel * textLabel;
@property (nonatomic, strong) IBOutlet UILabel * textLabel2;
@property (nonatomic, strong) IBOutlet UILabel * textLabel3;

+ (id)heartView;
@end
