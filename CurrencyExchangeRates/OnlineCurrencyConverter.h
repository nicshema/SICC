//
//  NSObject+OnlineCurrencyConverter.h
//  CurrencyExchangeRates
//
//  Created by Nikolai on 15.07.17.
//  Copyright © 2017 Nikolai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CurrencyConverter.h"

@interface OnlineCurrencyConverter:NSObject<CurrencyConverter>
+(OnlineCurrencyConverter*) sharedInstance;
@end
