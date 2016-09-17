//
//  Profile.m
//  payment11
//
//  Created by Eric Yu on 18/9/2016.
//  Copyright © 2016 Eric Yu. All rights reserved.
//

#import "Profile.h"

@implementation Profile

- (Profile*)initWithDict:(NSDictionary*)dict
{
    self.userID = dict[@"user_id"];
    self.username = dict[@"username"];
    self.accountBalance = dict[@"account_balance"];
    self.budgetUsed = [NSNumber numberWithFloat:[dict[@"budget_used"] floatValue]];
    self.budgetLimit = [NSNumber numberWithFloat:[dict[@"budget_limit"] floatValue]];
    
    return self;
}

- (NSNumber*)usedBudgetPercent
{
    return [NSNumber numberWithFloat:(self.budgetUsed.floatValue/self.budgetLimit.floatValue)*100];
}

@end
