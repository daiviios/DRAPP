//
//  ContactViewController.m
//  DrApp
//
//  Created by Nallasivakumar C on 19/05/18.
//  Copyright © 2018 Siva. All rights reserved.
//

#import "ContactViewController.h"
#import "AppDelegate.h"
@interface ContactViewController ()

@end

@implementation ContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.view = [[UIView alloc] initWithFrame:CGRectMake(0,0,self.view.frame.size.width,self.view.frame.size.height-60)];
    self.view.backgroundColor=[UIColor whiteColor];
    
    // Scroll View
    
    scroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 50.0f, self.view.frame.size.width, self.view.frame.size.height)];
    scroll.backgroundColor=[UIColor clearColor];
    scroll.delegate=self;
    scroll.scrollEnabled = YES;
    scroll.pagingEnabled = YES;
    scroll.bounces = NO;
    scroll.showsHorizontalScrollIndicator = NO;
    scroll.showsVerticalScrollIndicator = NO;
    scroll.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [scroll setContentSize:CGSizeMake(scroll.frame.size.width*3, scroll.frame.size.height-20.0f)];
    
    // page control
    pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-36, self.view.frame.size.width, 36)];
    pageControl.backgroundColor=[UIColor clearColor];
    pageControl.numberOfPages=3;
    [pageControl addTarget:self action:@selector(pageChanged) forControlEvents:UIControlEventValueChanged];
    
    CGFloat x=0;
    for(int i=1;i<4;i++)
    {

        PagingView = [[UIView alloc] initWithFrame:CGRectMake(x+0, 0, scroll.frame.size.width, scroll.frame.size.height)];
        PagingView.tag = i;
        PagingView.backgroundColor = [UIColor whiteColor];
        [scroll addSubview:PagingView];
        
        contactView = [[UIView alloc] initWithFrame:CGRectMake(15.0f, 20.0f, PagingView.frame.size.width-30.0f, PagingView.frame.size.height - 90.0f)];
        contactView.backgroundColor = [UIColor colorWithRed:((float)(rand()%255))/255 green:((float)(rand()%255))/255 blue:((float)(rand()%255))/255 alpha:1.];
        contactView.layer.cornerRadius = 25.0f;
        contactView.tag = i;
        [PagingView addSubview:contactView];
        
         CGFloat yAxis = 0;
        
        UIView * addressView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 10.0f, contactView.frame.size.width, 150.0f)];
        addressView.backgroundColor = [UIColor yellowColor];
        [contactView addSubview:addressView];
        yAxis = addressView.frame.origin.y+addressView.frame.size.height;
        
        UIButton * timeBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        timeBtn.frame = CGRectMake(0.0f, yAxis+5.0f, 150.0f, 60.0f);
        timeBtn.backgroundColor = [UIColor redColor];
        timeBtn.tag = i;
        [timeBtn addTarget:self action:@selector(timeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [contactView addSubview:timeBtn];
        
        UIButton * callBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        callBtn.frame = CGRectMake(timeBtn.frame.origin.x+timeBtn.frame.size.width, yAxis+5.0f, 150.0f, 60.0f);
        callBtn.backgroundColor = [UIColor blueColor];
        callBtn.tag = i;
        [callBtn addTarget:self action:@selector(callBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [contactView addSubview:callBtn];
        
        additionalView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, yAxis+65.0f, contactView.frame.size.width, 400.0f)];
        additionalView.tag = 102;
        [contactView addSubview:additionalView];
        
        x = x + scroll.frame.size.width ;

    }
    [self.view addSubview:scroll];
    
    [self.view addSubview:pageControl];

    
}

-(void)timeBtnClick:(UIButton *)sender
{
 
}

-(void)callBtnClick:(UIButton *)sender
{

}

- (void)scrollViewDidScroll:(UIScrollView *)_scrollView{
    
    CGFloat viewWidth = _scrollView.frame.size.width;
    // content offset - tells by how much the scroll view has scrolled.
    
    int pageNumber = floor((_scrollView.contentOffset.x - viewWidth/50) / viewWidth) +1;
    
    pageControl.currentPage=pageNumber;
    
}

- (void)pageChanged {
    
    int pageNumber = (int)pageControl.currentPage;
    
    CGRect frame = scroll.frame;
    frame.origin.x = frame.size.width*pageNumber;
    frame.origin.y=50.0f;
    
    [scroll scrollRectToVisible:frame animated:YES];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [(AppDelegate*)[[UIApplication sharedApplication] delegate] setSelectedId:0];

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

@end
