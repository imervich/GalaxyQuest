//
//  ViewController.m
//  GalaxyQuest
//
//  Created by Iván Mervich on 8/14/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *myScrollView;

@property UIImageView *imageView;
@property NSArray *imageViews;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	CGFloat width = 0.0;

	//	self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"galaxy1.jpg"]];
	self.imageViews = @[[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"galaxy1.jpg"]],
						[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"galaxy2.jpg"]],
						[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"galaxy3.jpg"]]];

	for (UIImageView *imageView in self.imageViews) {
		[self.myScrollView addSubview:imageView];
		imageView.frame = CGRectMake(width, 0, self.view.frame.size.width, self.view.frame.size.height);
		imageView.contentMode = UIViewContentModeScaleAspectFit;
		width += imageView.frame.size.width;
	}

	self.myScrollView.contentSize = CGSizeMake(width, self.myScrollView.frame.size.height);
	self.myScrollView.minimumZoomScale = 1.0;
	self.myScrollView.maximumZoomScale = 6.0;
	self.myScrollView.delegate = self;
}

#pragma mark - UIScrollView Delegate

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
	return self.imageView;
}

@end
