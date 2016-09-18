//
//  Profile.h
//  payment11
//
//  Created by Eric Yu on 18/9/2016.
//  Copyright © 2016 Eric Yu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Profile : NSObject

@property(nonatomic, copy) NSString *userID;
@property(nonatomic, copy) NSString *username;
@property(nonatomic, copy) NSString *profilePic;
@property(nonatomic, strong) NSNumber *accountBalance;
@property(nonatomic, strong) NSNumber *budgetUsed;
@property(nonatomic, strong) NSNumber *budgetLimit;

- (Profile*)initWithDict:(NSDictionary*)dict;
- (NSNumber*)usedBudgetPercent;
@end
