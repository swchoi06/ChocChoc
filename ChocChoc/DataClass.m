//
//  Data.m
//  ChocChoc
//
//  Created by Sukwon Choi on 2014. 4. 22..
//  Copyright (c) 2014년 TPP. All rights reserved.
//

#import "DataClass.h"

@implementation DataClass
@synthesize tabbarSize;
@synthesize recharge, discharge, percent;

static DataClass * instance = nil;

+(DataClass *)getInstance{
    @synchronized(self){
        if(instance == nil){
            instance = [DataClass new];
            instance.tabbarSize = 85;
            instance.recharge = 100;
            instance.discharge = 500;
            instance.percent = 0;
        }
    }
    return instance;
}

@end
