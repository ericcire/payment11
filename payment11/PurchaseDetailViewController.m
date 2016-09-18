//
//  PurchaseDetailViewController.m
//  payment11
//
//  Created by Eric Yu on 18/9/2016.
//  Copyright © 2016 Eric Yu. All rights reserved.
//

#import "PurchaseDetailViewController.h"
#import "PurchaseListHeaderView.h"
#import "PurchasedItemTableViewCell.h"
#import "PurchasingSummaryTableViewCell.h"
#import "PurchasedItem.h"

@interface PurchaseDetailViewController ()

@end

@implementation PurchaseDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)setupViews
{
    self.tableView.backgroundColor = [UIColor clearColor];
}

- (void)setupTableView
{
    [self.tableView registerClass:[PurchasedItemTableViewCell class] forCellReuseIdentifier:@"PurchasedItemCell"];
    
    [self.tableView registerClass:[PurchasingSummaryTableViewCell class] forCellReuseIdentifier:@"PurchasingSummaryTableViewCell"];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(section == 0) {
        return self.purchaseDetail.purchasedItems.count;
    }
    
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSUInteger section = indexPath.section;
    UITableViewCell *cell;
    
    switch (section) {
        case 0:
        {
            static NSString *CellIdentifier = @"PurchasedItemCell";
            cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            if (cell == nil) {
                cell = [[PurchasedItemTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                   reuseIdentifier:CellIdentifier];
            }
            
            PurchasedItemTableViewCell *concreteCell = (PurchasedItemTableViewCell*)cell;
            PurchasedItem *item = self.purchaseDetail.purchasedItems[indexPath.row];
            concreteCell.name.text = item.name;
            concreteCell.qty.text = item.qty;
            concreteCell.price.text = item.price;
            
            break;
        }
        case 1:
        {
            static NSString *CellIdentifier = @"PurchasingSummaryTableViewCell";
            cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            if (cell == nil) {
                cell = [[PurchasingSummaryTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                   reuseIdentifier:CellIdentifier];
            }
            
            PurchasingSummaryTableViewCell *concreteCell = (PurchasingSummaryTableViewCell*)cell;
            if (indexPath.row == 0) {
                concreteCell.summaryDescription.text = @"it is going to charge".uppercaseString;
                concreteCell.amountLabel.text = [NSString stringWithFormat:@"$ %@", self.purchaseDetail.amount];
            }
            
            if (indexPath.row == 1) {
                concreteCell.summaryDescription.text = @"% of weekly allowance".uppercaseString;
                concreteCell.amountLabel.text = self.purchaseDetail.allowancePercent;
            }
            
            if (indexPath.row == 2) {
                concreteCell.summaryDescription.text = @"this week will then remain".uppercaseString;
                concreteCell.amountLabel.text = self.purchaseDetail.amount;
            }
            
            break;
        }
        default:
            break;
    }
    
    cell.contentView.backgroundColor = [UIColor clearColor];
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    PurchaseListHeaderView *sectionHeaderView = nil;
    if (section == 0) {
        sectionHeaderView = [[[NSBundle mainBundle] loadNibNamed:@"PurchaseListHeaderView" owner:self options:nil] lastObject];
    }

    return sectionHeaderView;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
//    static NSString *CellIdentifier = @"history_cell";
//
//    HistoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    if (cell == nil) {
//        cell = [[HistoryTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
//                                           reuseIdentifier:CellIdentifier];
//    }
//
//    cell.contentView.backgroundColor = [UIColor clearColor];
//    return cell;
    return [UIView new];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return  44;
    } else if (indexPath.section == 1) {
        return  72;
    }

    return 44;
}

@end
