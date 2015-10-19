//
//  ViewController.m
//  Calculator
//
//  Created by Vijay on 9/29/15.
//  Copyright (c) 2015 Vijay. All rights reserved.
//

#import "ViewController.h"
#import "CalculationClass.h"

@interface ViewController ()

@property (nonatomic) CalculationClass *calculationClass;
- (IBAction)buttonPressed:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.calculationClass = [[CalculationClass alloc] init];
    // Do any additional setup after loading the view, typically from a nib.
    self.calculationClass.resultText = @"";
    self.calculationClass.secondString = @"";
}

#pragma Button action
//*********************************
// Action called from Calculation Class on Button Click
//*********************************
- (IBAction)buttonPressed:(id)sender
{
    NSString *str = [self.calculationClass buttonPressed:sender];
    self.calculatorDisplay.text = str;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
