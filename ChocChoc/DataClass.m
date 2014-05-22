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
@synthesize recharge, discharge, percent, lastCharge, timeFromLastCharge, stringArray;

static DataClass * instance = nil;

- (void)encodeWithCoder:(NSCoder *)encoder {
    //Encode properties, other class variables, etc
    [encoder encodeDouble:self.tabbarSize forKey:@"tabbarSize"];
    [encoder encodeDouble:self.recharge forKey:@"recharge"];
    [encoder encodeDouble:self.discharge forKey:@"discharge"];
    [encoder encodeDouble:self.timeFromLastCharge forKey:@"timeFromLastCharge"];
    [encoder encodeObject:self.lastCharge forKey:@"lastCharge"];
    [encoder encodeObject:self.stringArray forKey:@"stringArray"];
}

- (id)initWithCoder:(NSCoder *)decoder {
    if((self = [super init])) {
        //decode properties, other class vars
        self.tabbarSize = [decoder decodeDoubleForKey:@"tabbarSize"];
        self.recharge = [decoder decodeDoubleForKey:@"recharge"];
        self.discharge = [decoder decodeDoubleForKey:@"discharge"];
        self.timeFromLastCharge = [decoder decodeDoubleForKey:@"timeFromLastCharge"];
        self.lastCharge = [decoder decodeObjectForKey:@"lastCharge"];
        self.stringArray = [decoder decodeObjectForKey:@"stringArray"];
    }
    return self;
}

+(void)saveCustomObject:(DataClass *)object key:(NSString *)key {
    NSData *encodedObject = [NSKeyedArchiver archivedDataWithRootObject:object];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:encodedObject forKey:key];
    [defaults synchronize];
}

+(DataClass *)loadCustomObjectWithKey:(NSString *)key {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *encodedObject = [defaults objectForKey:key];
    DataClass *object = [NSKeyedUnarchiver unarchiveObjectWithData:encodedObject];
    return object;
}

+(DataClass *)getInstance{
    @synchronized(self){
        if(instance == nil){
            instance = [DataClass loadCustomObjectWithKey:@"dataclass"];
            if(instance == nil){
                NSLog(@"asdfasdf");
                instance = [DataClass new];
                instance.tabbarSize = 85;
                instance.recharge = 4100;
                instance.discharge = -200;
                instance.percent = 0;
                instance.timeFromLastCharge = 0;
                instance.lastCharge = [NSDate date];
                instance.stringArray = [NSArray arrayWithObjects:@"끄아앙.. 살려주세요..ㅠㅠ", @"위험상황!! 스킨십이 필요해요~!!", @"미리 미리 채워주세요. 손 잡으러 Go Go!", @"손을 잡자 손을 잡자 촉촉촉~", @"스킨십이 풍부한 당신, 사랑합니다", @"충전 만땅!", nil];
            }
        }
    }
    return instance;
}

@end
