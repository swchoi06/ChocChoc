//
//  Data.h
//  ChocChoc
//
//  Created by Sukwon Choi on 2014. 4. 22..
//  Copyright (c) 2014년 TPP. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataClass : NSObject{
    double tabbarSize;  // 하단 텝바 사이즈
    double recharge;    // 완전 충전까지 걸리는 시간(분)
    double discharge;   // 완전 방전까지 걸리는 시간(분)
    double percent;     // 하트 충전 퍼센트
}
@property (nonatomic, assign) double tabbarSize;
@property (nonatomic, assign) double recharge;
@property (nonatomic, assign) double discharge;
@property (nonatomic, assign) double percent;

+ (DataClass *)getInstance;

@end
