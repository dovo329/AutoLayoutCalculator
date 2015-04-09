//
//  CalculatorViewController.m
//  Calculator
//
//  Created by Douglas Voss on 3/28/15.
//  Copyright (c) 2015 Doug. All rights reserved.
//

#import "CalculatorViewController.h"
#import "math.h"

@interface CalculatorViewController ()

@property (weak, nonatomic) IBOutlet UILabel *calcDisplay;

@property (nonatomic) long double leftArg;
@property (nonatomic) long double rightArg;
@property (nonatomic) int rightArgPower;
@property (nonatomic) long double accum;
@property (nonatomic) NSInteger lastOpcode;
@property (nonatomic) bool lastEval;
@property (nonatomic) bool newNum;
@property (nonatomic) bool argDirection;
@property (nonatomic) bool pointTrig;

@end

@implementation CalculatorViewController

- (long double)arg
{
    return (self.leftArg + self.rightArg);
}

- (void)clearArg
{
    self.argDirection = true;
    self.pointTrig = false;
    self.leftArg = 0.0;
    self.rightArg = 0.0;
    self.rightArgPower = -1.0;
}

- (void)setArg:(long double)setToThis
{
    float sign = setToThis >= 0.0 ? 1.0 : -1.0;
    self.leftArg = sign*floor(fabsl(setToThis));
    self.rightArg = fmodf(setToThis, 1.0);
}

- (IBAction)handleButtonPoint:(id)sender
{
    self.argDirection = false;
    self.pointTrig = true;
}

- (void)doButtonNum:(int)buttonNum
{
    if (self.lastEval) {
        [self doClear];
    }
    if (self.pointTrig) {
        self.rightArg = 0.0;
        self.pointTrig = false;
    }
    
    if (self.argDirection) {
        self.leftArg *= 10;
        self.leftArg += buttonNum;
    } else {
        self.rightArg += buttonNum * powf(10.0, self.rightArgPower);
        self.rightArgPower--;
    }
    
    self.lastEval = false;
    self.newNum = true;
    self.calcDisplay.text = [NSString stringWithFormat:@"%.8Lg", [self arg]];
}

- (IBAction)handleButtonZero:(id)sender
{
    [self doButtonNum:0];
}

- (IBAction)handleButtonOne:(id)sender
{
    [self doButtonNum:1];
}

- (IBAction)handleButtonTwo:(id)sender
{
    [self doButtonNum:2];
}

- (IBAction)handleButtonThree:(id)sender
{
    [self doButtonNum:3];
}

- (IBAction)handleButtonFour:(id)sender
{
    [self doButtonNum:4];
}

- (IBAction)handleButtonFive:(id)sender
{
    [self doButtonNum:5];
}

- (IBAction)handleButtonSix:(id)sender
{
    [self doButtonNum:6];
}

- (IBAction)handleButtonSeven:(id)sender
{
    [self doButtonNum:7];
}

- (IBAction)handleButtonEight:(id)sender
{
    [self doButtonNum:8];
}

- (IBAction)handleButtonNine:(id)sender
{
    [self doButtonNum:9];
}

- (IBAction)handleButtonClear:(id)sender
{
    [self doClear];
    self.calcDisplay.text = [NSString stringWithFormat:@"%.8Lg", self.arg];

}

- (void)doClear
{
    [self clearArg];
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
            self.accum = [self arg];
            [self clearArg];
            break;
            
        case 1: // add
            self.accum += [self arg];
            break;
            
        case 2: // subtract
            self.accum -= [self arg];
            break;
            
        case 3: // multiply
            self.accum *= [self arg];
            break;
            
        case 4: // divide
            self.accum /= [self arg];
            break;
            
        default:
            NSLog(@"Invalid lastOpcode!");
            break;
    }
    self.calcDisplay.text = [NSString stringWithFormat:@"%.8Lg", self.accum];
    self.lastEval = true;
    self.argDirection = true;
    self.pointTrig = false;
    self.newNum = false;
}


- (IBAction)handleButtonPlus:(id)sender
{
    if (self.lastOpcode==0) {
        self.accum = [self arg];
    } else if (!self.lastEval) {
        [self doEval];
    }
    [self clearArg];
    self.calcDisplay.text = [NSString stringWithFormat:@"%.8Lg", self.accum];
    self.lastOpcode = 1;
    self.lastEval = false;
    self.newNum = false;
}

- (IBAction)handleButtonMinus:(id)sender
{
    if (self.lastOpcode==0) {
        self.accum = [self arg];
    } else if (!self.lastEval) {
        [self doEval];
    }
    [self clearArg];
    self.calcDisplay.text = [NSString stringWithFormat:@"%.8Lg", self.accum];
    self.lastOpcode = 2;
    self.lastEval = false;
    self.newNum = false;
}

- (IBAction)handleButtonMultiply:(id)sender
{
    if (self.lastOpcode==0) {
        self.accum = [self arg];
    } else if (!self.lastEval) {
        [self doEval];
    }
    [self clearArg];
    self.calcDisplay.text = [NSString stringWithFormat:@"%.8Lg", self.accum];
    self.lastOpcode = 3;
    self.lastEval = false;
    self.newNum = false;
}

- (IBAction)handleButtonDivide:(id)sender
{
    if (self.lastOpcode==0) {
        self.accum = [self arg];
    } else if (!self.lastEval) {
        [self doEval];
    }
    [self clearArg];
    self.calcDisplay.text = [NSString stringWithFormat:@"%.8Lg", self.accum];
    self.lastOpcode = 4;
    self.lastEval = false;
    self.newNum = false;
}

- (IBAction)handleButtonTip:(id)sender
{
    if (self.lastOpcode==0) {
        [self setArg:(0.15*[self arg])];
        self.calcDisplay.text = [NSString stringWithFormat:@"%.8Lg", [self arg]];
    } else {
        self.accum = 0.15*self.accum;
        self.calcDisplay.text = [NSString stringWithFormat:@"%.8Lg", self.accum];
    }
    self.newNum = false;
}

- (IBAction)handleButtonPolarity:(id)sender
{
    if (self.newNum || self.lastOpcode==0) {
        [self setArg:(-1.0*[self arg])];
        self.calcDisplay.text = [NSString stringWithFormat:@"%.8Lg", self.arg];
    } else {
        self.accum = -1.0*self.accum;
        self.calcDisplay.text = [NSString stringWithFormat:@"%.8Lg", self.accum];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _argDirection = true;
    _leftArg = 0.0;
    _rightArg = 0.0;
    _rightArgPower = -1;
    _accum = 0.0;
    _lastEval = true;
    _lastOpcode = 0;
    _pointTrig = false;
    _newNum = false;
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
