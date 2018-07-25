//
//  VideoViewController.h
//  DrApp
//
//  Created by Nallasivakumar C on 19/05/18.
//  Copyright © 2018 Siva. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@import Firebase;
@interface VideoViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

{
    UITableView *tableView;
    NSMutableArray * videoArray;
}
@property (strong, nonatomic) FIRDatabaseReference *ref;
@end
