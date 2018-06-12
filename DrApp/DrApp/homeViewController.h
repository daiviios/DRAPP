//
//  homeViewController.h
//  DrApp
//
//  Created by Nallasivakumar C on 18/05/18.
//  Copyright © 2018 Siva. All rights reserved.
//

#import <UIKit/UIKit.h>
@import Firebase;

@interface homeViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UITextFieldDelegate>
{
    UICollectionView *_collectionView;
    
    NSMutableArray * arrModules;
}
@property (nonatomic, readonly) NSInteger totalItemsInSection;
@property (nonatomic, readonly) UIEdgeInsets contentInsets;

// 4
@property (nonatomic, assign) NSInteger totalColumns;
@property (nonatomic, assign) CGFloat interItemsSpacing;

@property (strong, nonatomic) FIRDatabaseReference *ref;
@end

