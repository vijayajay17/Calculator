//
//  CalculationClass.h
//  Calculator
//
//  Created by Vijay on 10/1/15.
//  Copyright (c) 2015 Vijay. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    kButtonMC, // 0
    kButtonMPlus, // 1
    kButtonMMinus, // 2
    kButtonMR, // etc
    
    kButtonAC = 15,
    kButtonChangeSign,
    kButtonDivide = 14,
    kButtonMultiply = 13,
    
    kButtonSeven = 7,
    kButtonEight = 8,
    kButtonNine = 9,
    kButtonSubtract = 11,
    
    kButtonFour = 4,
    kButtonFive = 5,
    kButtonSix = 6,
    kButtonAdd = 12,
    
    kButtonOne = 1,
    kButtonTwo = 2,
    kButtonThree = 3,
    
    kButtonZero = 0,
    kButtonDot = 10,
    kButtonEqual = 17,
    kButtonpercentage = 16
} kButton;
@interface CalculationClass : NSObject
{
    NSNumber *leftOperator;
    kButton operation;
    BOOL deleteInput;
    double memory;

}
@property (nonatomic) NSString *secondString;
@property (nonatomic) NSString *resultText;
@property (nonatomic,assign) BOOL percentageClicked;
- (NSString *)buttonPressed:(id)sender;

@end
