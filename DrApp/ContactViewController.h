//
//  ContactViewController.h
//  DrApp
//
//  Created by Nallasivakumar C on 19/05/18.
//  Copyright © 2018 Siva. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContactViewController : UIViewController<UIScrollViewDelegate>

{
    UIView * PagingView ;
    UIView * contactView ;
    UIView * additionalView;
    UIPageControl *pageControl;
    UIScrollView *scroll;
}
@end
