//
//  ViewController.h
//  Calculator
//
//  Created by Vijay on 9/29/15.
//  Copyright (c) 2015 Vijay. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface ViewController : UIViewController
{
}
@property (nonatomic) IBOutlet UILabel *calculatorDisplay;
@property (nonatomic) NSString *resultText;
@property (nonatomic,assign) BOOL percentageClicked;
@end

