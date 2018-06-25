//
//  StudentsZoneViewController.h
//  DrApp
//
//  Created by Straxis Red on 25/06/18.
//  Copyright © 2018 Siva. All rights reserved.
//

#import <UIKit/UIKit.h>
@import Firebase;

@interface StudentsZoneViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *studentsList;
    NSMutableArray *studentsListArray;
}
@property (strong, nonatomic) FIRDatabaseReference *ref;

@end
