//
//  NewsViewController.h
//  DrApp
//
//  Created by Nallasivakumar C on 19/05/18.
//  Copyright © 2018 Siva. All rights reserved.
//

#import <UIKit/UIKit.h>
@import Firebase;
@interface NewsViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *newstableView;
}
@end
