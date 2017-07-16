//
//  NSObject+CurrencyDataSource.m
//  CurrencyExchangeRates
//
//  Created by Nikolai on 15.07.17.
//  Copyright © 2017 Nikolai. All rights reserved.
//

#import "CurrencyPickerHelper.h"

@interface CurrencyPickerHelper ()
@property (strong, nonatomic) void(^callback)(NSString*);
@property NSArray<NSString*>* currencies;
@end
@implementation CurrencyPickerHelper
-(id) initWithcallback:(void (^)(NSString*))callback {
    self = [super init];
    if (self) {
        self.callback = callback;
        self.currencies = @[@"EUR", @"RUB", @"USD"];
    }
    return self;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return _currencies.count;
}
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return _currencies[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    self.callback(_currencies[row]);
}
@end
