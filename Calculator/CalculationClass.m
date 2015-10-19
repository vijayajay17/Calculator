//
//  CalculationClass.m
//  Calculator
//
//  Created by Vijay on 10/1/15.
//  Copyright (c) 2015 Vijay. All rights reserved.
//

#import "CalculationClass.h"
#import <UIKit/UIKit.h>

@interface CalculationClass()

@property (nonatomic) BOOL typingNumber; //check if user is typing a number
@property (nonatomic) NSInteger firstNumber;
@property (nonatomic) NSInteger secondNumber;

@property (nonatomic, copy) NSString *operation; // plus or minus operation

@end

@implementation CalculationClass

#pragma mark utilities

// If you pass 0, it will use the previously saved operation
- (void)doOperation:(int)theOperation
{
    double result = 0.0;
    
    if (theOperation == 0)
        theOperation = operation;
    if(!self.percentageClicked)
    {
        switch (operation) {
            case kButtonMultiply:
                result = [leftOperator doubleValue] * [self.resultText doubleValue];
                break;
            case kButtonDivide:
                result = [leftOperator doubleValue] / [self.resultText doubleValue];
                break;
            case kButtonAdd:
                result = [leftOperator doubleValue] + [self.resultText doubleValue];
                break;
            case kButtonSubtract:
                result = [leftOperator doubleValue] - [self.resultText doubleValue];
                break;
        }
    }
    else
    {
        CGFloat firstNum = self.firstNumber/100.00;
        CGFloat percentage = firstNum * [self.secondString integerValue];
        result = percentage;
    }
    leftOperator = nil;
    self.percentageClicked = NO;
    self.resultText = [NSString stringWithFormat:@"%.2f",result];
    // reset the leftOperator
    
}



- (void)performOperation:(int)theOperation
{
    // if we have a right operator already, compute the existing value
    if (leftOperator) {
        [self doOperation:theOperation];
    } else {
        // save the existing operation for later
        operation = theOperation;
    }
    
    // assign the left operation for later use
    leftOperator = [NSNumber numberWithDouble:[self.resultText doubleValue]];
}

- (NSMutableString *)readableNumberFromString:(NSString *)aString
{
    // given 12.30000 we remove the trailing zeros
    NSMutableString *result = [NSMutableString stringWithString:aString];
    
    // check if it contains a . character.
    if ([result rangeOfString:@"."].location != NSNotFound) {
        
        // start from the end, and remove any 0 or . you find until you find a number greater than 0
        for (NSInteger i = [result length] - 1; i >= 0; i--) {
            // get the char
            unichar currentChar = [result characterAtIndex:i];
            
            if (currentChar == '0') {
                // remove it from the string
                [result replaceCharactersInRange:NSMakeRange(i, 1) withString:@""];
            } else if (currentChar == '.') {
                // remove it from the string
                [result replaceCharactersInRange:NSMakeRange(i, 1) withString:@""];
                break;
            }
            else {
                break;
            }
        }
    }
    
    // assign default value if needed
    if ([result isEqualToString:@""]) {
        [result appendString:@"0"];
    }
    
    // remove the initial 0 if present
    if ([result length] > 1 && [result characterAtIndex:0] == '0') {
        [result replaceCharactersInRange:NSMakeRange(0, 1) withString:@""];
    }
    
    return result;
}

#pragma mark actions

- (NSString *)buttonPressed:(id)sender
{
    // We sometimes need to delete the current text, but we never have to do so for the change sign button
    if (deleteInput && [sender tag] != kButtonChangeSign) {
        self.resultText = @"";
    }
    deleteInput = NO;
    self.operation = [sender currentTitle];
    // See which button the user pressed
    if(![self.operation isEqualToString:@"%"])
    {
        switch ([sender tag]) {
            case kButtonAC:
                self.resultText = @"0";
                self.secondString = @"";
                self.firstNumber = 0;
                self.secondNumber = 0;
                leftOperator = nil;
                break;
            case kButtonDivide:
                [self performOperation:kButtonDivide];
                deleteInput = YES;
                break;
            case kButtonMultiply:
                [self performOperation:kButtonMultiply];
                deleteInput = YES;
                break;
            case kButtonSeven:
                [self appendString:7];
                break;
            case kButtonEight:
                [self appendString:8];
                break;
            case kButtonNine:
                [self appendString:9];
                break;
            case kButtonSubtract:
                [self performOperation:kButtonSubtract];
                deleteInput = YES;
                break;
            case kButtonFour:
                [self appendString:4];
                break;
            case kButtonFive:
                [self appendString:5];
                break;
            case kButtonSix:
                [self appendString:6];
                break;
            case kButtonAdd:
                [self performOperation:kButtonAdd];
                deleteInput = YES;
                break;
            case kButtonOne:
                [self appendString:1];
                break;
            case kButtonTwo:
                [self appendString:2];
                break;
            case kButtonThree:
                [self appendString:3];
                break;
            case kButtonZero:
                [self appendString:0];
                break;
            case kButtonDot:
                break;
            case kButtonEqual:
                [self doOperation:0];
                deleteInput = YES;
                break;
        }
        
        self.resultText = [self readableNumberFromString:self.resultText];
        
        if ([sender tag] == kButtonDot) {
            self.resultText =  [self.resultText stringByAppendingString:@"."];
        }
    }
    else
    {
        if(self.resultText)
        {
            self.percentageClicked = YES;
            self.secondString = @"";
        }
    }
    return self.resultText;
}

-(void)appendString:(int)string
{
    if(self.percentageClicked)
    {
        self.secondString = [self.secondString stringByAppendingString:[NSString stringWithFormat:@"%d", string]];
        self.resultText = self.secondString;
    }
    else
    {
        self.resultText = [self.resultText stringByAppendingString:[NSString stringWithFormat:@"%d", string]];
        self.firstNumber = [self.resultText integerValue];
    }
}

@end
