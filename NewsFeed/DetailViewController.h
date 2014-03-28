//
//  DetailViewController.h
//  NewsFeed
//
//  Created by HETSCH Leonard on 28/03/14.
//  Copyright (c) 2014 Gobelins. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) NSString *articleUrl;
@property (weak, nonatomic) IBOutlet UIWebView *articleWebview;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end
