//
//  ImageGalleryViewViewController.m
//  ScrollView Image Galleries
//
//  Created by Carlo Namoca on 2017-10-16.
//  Copyright © 2017 Carlo Namoca. All rights reserved.
//

#import "ImageGalleryViewViewController.h"
#import "ViewController.h"

@interface ImageGalleryViewViewController () <UIScrollViewDelegate>
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) UIImageView *imageView1;
@property (strong, nonatomic) UIImageView *imageView2;
@property (strong, nonatomic) UIImageView *imageView3;
@property (strong, nonatomic) UIPageControl *pageControl;
@property (strong, nonatomic) ViewController *viewController;


@end

@implementation ImageGalleryViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.scrollView.delegate = self;
    self.scrollView.pagingEnabled = YES;
    [self createImageViews];
    [self setupLayout];
    [self createPageControl];
    
    UITapGestureRecognizer *tapGesture1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imageTapped:)];
    UITapGestureRecognizer *tapGesture2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imageTapped:)];
    UITapGestureRecognizer *tapGesture3 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imageTapped:)];
    
    self.imageView1.userInteractionEnabled = YES;
    self.imageView2.userInteractionEnabled = YES;
    self.imageView3.userInteractionEnabled = YES;
    
    [self.imageView1 addGestureRecognizer:tapGesture1];
    [self.imageView2 addGestureRecognizer:tapGesture2];
    [self.imageView3 addGestureRecognizer:tapGesture3];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UITapGestureRecognizer *)sender
{
    self.viewController = segue.destinationViewController;
    UIImageView *tempImageView = (UIImageView *) sender.view;
    self.viewController.myImage = tempImageView.image;
}


-(void)imageTapped:(UITapGestureRecognizer *)sender
{
    [self performSegueWithIdentifier:@"detailedView" sender:sender];
}

- (void)viewDidLayoutSubviews
{
    self.scrollView.frame = self.view.frame;
}

-(void)createImageViews
{
    self.imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Lighthouse-in-Field"]];
    self.imageView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Lighthouse-night"]];
    self.imageView3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Lighthouse-zoomed"]];
    [self.scrollView addSubview:self.imageView1];
    [self.scrollView addSubview:self.imageView2];
    [self.scrollView addSubview:self.imageView3];
    self.imageView1.contentMode = UIViewContentModeScaleAspectFit;
    self.imageView2.contentMode = UIViewContentModeScaleAspectFit;
    self.imageView3.contentMode = UIViewContentModeScaleAspectFit;
    self.imageView1.clipsToBounds = YES;
    self.imageView2.clipsToBounds = YES;
    self.imageView3.clipsToBounds = YES;
}

- (void)setupLayout
{
    self.imageView1.translatesAutoresizingMaskIntoConstraints = NO;
    self.imageView2.translatesAutoresizingMaskIntoConstraints = NO;
    self.imageView3.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.imageView1.topAnchor constraintEqualToAnchor:self.scrollView.topAnchor].active = YES;
    [self.imageView1.bottomAnchor constraintEqualToAnchor:self.scrollView.bottomAnchor].active = YES;
    [self.imageView2.topAnchor constraintEqualToAnchor:self.scrollView.topAnchor].active = YES;
    [self.imageView2.bottomAnchor constraintEqualToAnchor:self.scrollView.bottomAnchor].active = YES;
    [self.imageView3.topAnchor constraintEqualToAnchor:self.scrollView.topAnchor].active = YES;
    [self.imageView3.bottomAnchor constraintEqualToAnchor:self.scrollView.bottomAnchor].active = YES;
    
    [self.imageView1.leadingAnchor constraintEqualToAnchor:self.scrollView.leadingAnchor].active = YES;
    [self.imageView1.trailingAnchor constraintEqualToAnchor:self.imageView2.leadingAnchor].active = YES;
    
    [self.imageView2.trailingAnchor constraintEqualToAnchor:self.imageView3.leadingAnchor].active = YES;
    [self.imageView3.trailingAnchor constraintEqualToAnchor:self.scrollView.trailingAnchor].active = YES;
    
    
    // width and height
    [self.imageView1.heightAnchor constraintEqualToAnchor:self.view.heightAnchor].active = YES;
    [self.imageView2.heightAnchor constraintEqualToAnchor:self.view.heightAnchor].active = YES;
    [self.imageView3.heightAnchor constraintEqualToAnchor:self.view.heightAnchor].active = YES;

    
    [self.imageView1.widthAnchor constraintEqualToAnchor:self.view.widthAnchor].active = YES;
    [self.imageView2.widthAnchor constraintEqualToAnchor:self.view.widthAnchor].active = YES;
    [self.imageView3.widthAnchor constraintEqualToAnchor:self.view.widthAnchor].active = YES;
    
}

static const CGFloat pageControlHeight = 20.0f;

- (void)createPageControl
{
    CGRect frame = CGRectMake(0.0, self.view.frame.size.height - pageControlHeight, self.view.frame.size.width, pageControlHeight);
    self.pageControl = [[UIPageControl alloc] initWithFrame:frame];
    [self.view addSubview:self.pageControl];
    self.pageControl.layer.zPosition = 2;
    self.pageControl.numberOfPages = 3;
    self.pageControl.backgroundColor = [UIColor blackColor];
    self.pageControl.alpha = 0.5;
    [self.pageControl addTarget:self
                         action:@selector(pageTapped:)
               forControlEvents:UIControlEventTouchUpInside];
}

- (void)pageTapped:(UIPageControl *)sender
{
    
}

#pragma mark - ScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self updatePageControl];
}

- (void)updatePageControl
{
    CGFloat width = self.scrollView.frame.size.width;
    CGFloat xOffset = self.scrollView.contentOffset.x;
    NSInteger pageNumber = xOffset / width;
    self.pageControl.currentPage = pageNumber;
}
@end
