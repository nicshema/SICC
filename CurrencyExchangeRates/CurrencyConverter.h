//
//  CurrencyConverter.h
//  CurrencyExchangeRates
//
//  Created by Nikolai on 15.07.17.
//  Copyright © 2017 Nikolai. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CurrencyConverter <NSObject>
-(void) convertSum:(double) sum fromCurrency: (NSString*) from  toCurrency: (NSString*) to callOnComplete: (void (^)(double)) callback;
@end
