//
//  ViewController.m
//  ScrollView Image Galleries
//
//  Created by Carlo Namoca on 2017-10-16.
//  Copyright © 2017 Carlo Namoca. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageView.translatesAutoresizingMaskIntoConstraints = NO;
    self.imageView.image = self.myImage;
    self.scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    self.scrollView.delegate = self;
    self.scrollView.minimumZoomScale = 0.50;
    self.scrollView.maximumZoomScale = 3.0;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidLayoutSubviews
{
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"In scrollViewDidScroll");
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"In scrollViewDidEndDecelerating");
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    NSLog(@"In scrollViewWillBeginDragging");
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView
                     withVelocity:(CGPoint)velocity
              targetContentOffset:(inout CGPoint *)targetContentOffset
{
    NSLog(@"In scrollViewWillEndDragging");
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageView;
}

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView
                       withView:(UIView *)view
                        atScale:(CGFloat)scale
{
    NSLog(@"In scrollViewDidEndZooming");
}

@end
