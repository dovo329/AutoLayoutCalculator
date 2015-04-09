//
//  CalculatorViewController.m
//  Calculator
//
//  Created by Douglas Voss on 3/28/15.
//  Copyright (c) 2015 Doug. All rights reserved.
//

#import "CalculatorViewController.h"

@interface CalculatorViewController ()

@property (weak, nonatomic) IBOutlet UILabel *calcDisplay;

@property (nonatomic) long double arg;
@property (nonatomic) long double accum;
@property (nonatomic) NSInteger lastOpcode;
@property (nonatomic) bool lastEval;

@end

@implementation CalculatorViewController


- (IBAction)handleButtonOne:(id)sender
{
    if (self.lastEval) {
        [self doClear];
    }
    self.arg *= 10;
    self.arg += 1;

    self.lastEval = false;
    self.calcDisplay.text = [NSString stringWithFormat:@"%.8Lg", self.arg];
}

- (IBAction)handleButtonTwo:(id)sender
{
    if (self.lastEval) {
        [self doClear];
    }
    self.arg *= 10;
    self.arg += 2;
    
    self.lastEval = false;
    self.calcDisplay.text = [NSString stringWithFormat:@"%.8Lg", self.arg];
}

- (IBAction)handleButtonThree:(id)sender
{
    if (self.lastEval) {
        [self doClear];
    }
    self.arg *= 10;
    self.arg += 3;

    self.lastEval = false;
    self.calcDisplay.text = [NSString stringWithFormat:@"%.8Lg", self.arg];
}

- (IBAction)handleButtonFour:(id)sender
{
    if (self.lastEval) {
        [self doClear];
    }
    self.arg *= 10;
    self.arg += 4;

    self.lastEval = false;
    self.calcDisplay.text = [NSString stringWithFormat:@"%.8Lg", self.arg];
}

- (IBAction)handleButtonFive:(id)sender
{
    if (self.lastEval) {
        [self doClear];
    }
    self.arg *= 10;
    self.arg += 5;

    self.lastEval = false;
    self.calcDisplay.text = [NSString stringWithFormat:@"%.8Lg", self.arg];
}

- (IBAction)handleButtonSix:(id)sender
{
    if (self.lastEval) {
        [self doClear];
    }
    self.arg *= 10;
    self.arg += 6;

    self.lastEval = false;
    self.calcDisplay.text = [NSString stringWithFormat:@"%.8Lg", self.arg];
}

- (IBAction)handleButtonSeven:(id)sender
{
    if (self.lastEval) {
        [self doClear];
    }
    self.arg *= 10;
    self.arg += 7;

    self.lastEval = false;
    self.calcDisplay.text = [NSString stringWithFormat:@"%.8Lg", self.arg];
}

- (IBAction)handleButtonEight:(id)sender
{
    if (self.lastEval) {
        [self doClear];
    }
    self.arg *= 10;
    self.arg += 8;

    self.lastEval = false;
    self.calcDisplay.text = [NSString stringWithFormat:@"%.8Lg", self.arg];
}

- (IBAction)handleButtonNine:(id)sender
{
    if (self.lastEval) {
        [self doClear];
    }
    self.arg *= 10;
    self.arg += 9;
    
    self.lastEval = false;
    self.calcDisplay.text = [NSString stringWithFormat:@"%.8Lg", self.arg];
}

- (IBAction)handleButtonZero:(id)sender
{
    if (self.lastEval) {
        [self doClear];
    }
    self.arg *= 10;
    self.arg += 0;

    self.lastEval = false;
    self.calcDisplay.text = [NSString stringWithFormat:@"%.8Lg", self.arg];
}

- (IBAction)handleButtonClear:(id)sender
{
    [self doClear];
    self.calcDisplay.text = [NSString stringWithFormat:@"%.8Lg", self.arg];

}

- (void)doClear
{
    self.arg = 0;
    self.accum = 0;
    self.lastOpcode = 0;
    self.lastEval = false;
}


- (IBAction)handleButtonEval:(id)sender
{
    [self doEval];
}


- (void) doEval
{
    switch (self.lastOpcode) {
        case 0: // clear entry
            self.accum = self.arg;
            self.arg = 0;
            break;
            
        case 1: // add
            self.accum += self.arg;
            break;
            
        case 2: // subtract
            self.accum -= self.arg;
            break;
            
        case 3: // multiply
            self.accum *= self.arg;
            break;
            
        case 4: // divide
            self.accum /= self.arg;
            break;
            
        default:
            NSLog(@"Invalid lastOpcode!");
            break;
    }
    self.calcDisplay.text = [NSString stringWithFormat:@"%.8Lg", self.accum];
    self.lastEval = true;
}


- (IBAction)handleButtonPlus:(id)sender
{
    if (self.lastOpcode==0) {
        self.accum = self.arg;
    } else if (!self.lastEval) {
        [self doEval];
    }
    self.arg = 0;
    self.calcDisplay.text = [NSString stringWithFormat:@"%.8Lg", self.accum];
    self.lastOpcode = 1;
    self.lastEval = false;
}

- (IBAction)handleButtonMinus:(id)sender
{
    if (self.lastOpcode==0) {
        self.accum = self.arg;
    } else if (!self.lastEval) {
        [self doEval];
    }
    self.arg = 0;
    self.calcDisplay.text = [NSString stringWithFormat:@"%.8Lg", self.accum];
    self.lastOpcode = 2;
    self.lastEval = false;
}

- (IBAction)handleButtonMultiply:(id)sender
{
    if (self.lastOpcode==0) {
        self.accum = self.arg;
    } else if (!self.lastEval) {
        [self doEval];
    }
    self.arg = 0;
    self.calcDisplay.text = [NSString stringWithFormat:@"%.8Lg", self.accum];
    self.lastOpcode = 3;
    self.lastEval = false;
}

- (IBAction)handleButtonDivide:(id)sender
{
    if (self.lastOpcode==0) {
        self.accum = self.arg;
    } else if (!self.lastEval) {
        [self doEval];
    }
    self.arg = 0;
    self.calcDisplay.text = [NSString stringWithFormat:@"%.8Lg", self.accum];
    self.lastOpcode = 4;
    self.lastEval = false;
}

- (IBAction)handleButtonTip:(id)sender
{
    if (self.lastOpcode==0) {
        self.arg = 0.15*self.arg;
        self.calcDisplay.text = [NSString stringWithFormat:@"%.8Lg", self.arg];
    } else {
        self.accum = 0.15*self.accum;
        self.calcDisplay.text = [NSString stringWithFormat:@"%.8Lg", self.accum];
    }
}

- (IBAction)handleButtonPolarity:(id)sender
{
    if (self.lastOpcode==0) {
        self.arg = -1.0*self.arg;
        self.calcDisplay.text = [NSString stringWithFormat:@"%.8Lg", self.arg];
    } else {
        self.accum = -1.0*self.accum;
        self.calcDisplay.text = [NSString stringWithFormat:@"%.8Lg", self.accum];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (instancetype)initWithNibName:(NSString *)nibNameOrNil
                         bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        self.calcDisplay.text=@"Initial";
    }
    return self;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
