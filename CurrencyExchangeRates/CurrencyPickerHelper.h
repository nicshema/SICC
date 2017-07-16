//
//  NSObject+CurrencyDataSource.h
//  CurrencyExchangeRates
//
//  Created by Nikolai on 15.07.17.
//  Copyright © 2017 Nikolai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface CurrencyPickerHelper:NSObject<UIPickerViewDataSource,UIPickerViewDelegate>
- (id) initWithcallback: (void(^)(NSString*)) callback;
@end
