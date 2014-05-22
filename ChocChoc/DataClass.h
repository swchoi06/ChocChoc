//
//  Data.h
//  ChocChoc
//
//  Created by Sukwon Choi on 2014. 4. 22..
//  Copyright (c) 2014년 TPP. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataClass : NSObject{
    double tabbarSize;          // 하단 텝바 사이즈
    double recharge;            // 완전 충전까지 걸리는 시간(분)
    double discharge;           // 완전 방전까지 걸리는 시간(분)
    double percent;             // 하트 충전 퍼센트
    double timeFromLastCharge;  // 마지막 충전으로부터 지난 시간(분)
    NSDate * lastCharge;        // 마지막 충전된 시간
    NSArray * stringArray;      // 하트 퍼센트에 따른 텍스트 문구
}
@property (nonatomic, assign) double tabbarSize;
@property (nonatomic, assign) double recharge;
@property (nonatomic, assign) double discharge;
@property (nonatomic, assign) double percent;
@property (nonatomic, assign) double timeFromLastCharge;
@property (nonatomic, strong) NSDate * lastCharge;
@property (nonatomic, strong) NSArray * stringArray;

+ (DataClass *)getInstance;

+(void)saveCustomObject:(DataClass *)object key:(NSString *)key;
+(DataClass *)loadCustomObjectWithKey:(NSString *)key;

@end
