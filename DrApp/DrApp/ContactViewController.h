//
//  ContactViewController.h
//  DrApp
//
//  Created by Nallasivakumar C on 19/05/18.
//  Copyright © 2018 Siva. All rights reserved.
//

#import <UIKit/UIKit.h>
@import Firebase;
@interface ContactViewController : UIViewController<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>

{
    UIView * PagingView ;
    UIView * contactView ;
    UITableView * contactTblView;
    UIPageControl *pageControl;
    UIScrollView *scroll;
    
    NSString * timingStr;
    
    UISegmentedControl * segmentedControl;
    
    FIRDatabaseReference *ref , *detailsRef;
    
      NSMutableArray * arrdetails;
    NSMutableArray * innerArray;

    NSDictionary * dictdetails;
 }
@end
