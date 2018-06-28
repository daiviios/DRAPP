//
//  GalleryView.m
//  DrApp
//
//  Created by Nallasivakumar C on 28/06/18.
//  Copyright © 2018 Siva. All rights reserved.
//

#import "GalleryView.h"

@implementation GalleryView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


-(void)imageView :(UIImage *)img
{
 
    UIButton * closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    closeBtn.frame = CGRectMake(self.frame.size.width-50, 0, 50, 50);
    closeBtn.backgroundColor = [UIColor redColor];
    [closeBtn addTarget:self action:@selector(closeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:closeBtn];
    
    
    UIImageView * imgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 50, self.frame.size.width-20, self.frame.size.height - 100)];
    [imgView setImage:img];
    [self addSubview:imgView];

}

-(void)closeBtnClick
{
    [self removeFromSuperview];
}

@end
