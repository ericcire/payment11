//
//  PurchasedDetail.h
//  payment11
//
//  Created by Eric Yu on 18/9/2016.
//  Copyright © 2016 Eric Yu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PurchasedDetail : NSObject

@property (nonatomic, strong) NSArray *purchasedItems;
@property (nonatomic, copy) NSString *amount;
@property (nonatomic, copy) NSString *allowancePercent;
@property (nonatomic, copy) NSString *remain;

@end
