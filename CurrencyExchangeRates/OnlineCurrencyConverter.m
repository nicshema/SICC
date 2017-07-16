//
//  NSObject+OnlineCurrencyConverter.m
//  CurrencyExchangeRates
//
//  Created by Nikolai on 15.07.17.
//  Copyright © 2017 Nikolai. All rights reserved.
//
#import "OnlineCurrencyConverter.h"

@implementation OnlineCurrencyConverter

- (void) convertSum:(double)sum fromCurrency:(NSString *)from toCurrency:(NSString *)to callOnComplete:(void (^)(double))callback {
    NSURLSession *session = [NSURLSession sharedSession];
    NSURL *url = [NSURL URLWithString: [NSString stringWithFormat:@"http://api.fixer.io/latest?base=%@&symbols=%@", from, to]];
    NSURLSessionDataTask *task = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSError *localErr;
        NSDictionary *responseDict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&localErr];
        NSString *rate = [(NSDictionary *)[responseDict objectForKey:@"rates"] objectForKey:to];
        double result = sum * rate.doubleValue;
        callback(result);
    }];
    [task resume];
}
+ (OnlineCurrencyConverter*) sharedInstance {
    static OnlineCurrencyConverter *_sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[OnlineCurrencyConverter alloc] init];
    });
    return _sharedInstance;
}
@end
