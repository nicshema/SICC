//
//  ViewController.m
//  CurrencyExchangeRates
//
//  Created by Nikolai on 12.07.17.
//  Copyright © 2017 Nikolai. All rights reserved.
//

#import "ViewController.h"
#import "CurrencyPickerHelper.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *srcCurrencyInput;
@property (weak, nonatomic) IBOutlet UITextField *trgCurrencyInput;
@property (weak, nonatomic) IBOutlet UITextField *srcValueInput;
@property (weak, nonatomic) IBOutlet UITextView *resultTextView;
@end

@implementation ViewController {
    UITextField *_activeCurrencyInput;
    //strong reference to pickerHelper
    CurrencyPickerHelper *_pickerHelper;
}
- (void)viewDidLoad {
    [super viewDidLoad];
     _pickerHelper = [[CurrencyPickerHelper alloc] initWithcallback:^(NSString *result) {
        _activeCurrencyInput.text = result;
        [_activeCurrencyInput endEditing:YES];
    }];
    //set pickers for currency inputs
    NSArray<UITextField *> * currInputs = @[_srcCurrencyInput, _trgCurrencyInput];
    for (int i = 0; i < currInputs.count; i++) {
        UIPickerView *curPicker = [[UIPickerView alloc]init];
        curPicker.dataSource = _pickerHelper;
        curPicker.delegate = _pickerHelper;
        currInputs[i].inputView = curPicker;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/* begin of textField delegate methods*/
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    if (textField == _srcCurrencyInput || textField == _trgCurrencyInput) {
        _activeCurrencyInput = textField;
    }
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    //hide keyboard on enter
    if (textField == _srcValueInput) {
        [textField resignFirstResponder];
    }
    return YES;
}
/*end of textField delegate methods*/

/*button handler method*/
- (IBAction)onCalculatePressed:(UIButton *)sender {
    double sourceValue = _srcValueInput.text.doubleValue;
    NSString *srcCur = _srcCurrencyInput.text;
    NSString *trgCur = _trgCurrencyInput.text;
    OnlineCurrencyConverter *converter = [OnlineCurrencyConverter sharedInstance];
    [converter convertSum:sourceValue fromCurrency:srcCur toCurrency:trgCur callOnComplete:^(double result) {
        dispatch_async(dispatch_get_main_queue(), ^{
            _resultTextView.text = [NSString stringWithFormat:@"%.2f", result];
        });
    }];
}


@end
