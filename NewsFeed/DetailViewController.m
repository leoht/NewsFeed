//
//  DetailViewController.m
//  NewsFeed
//
//  Created by HETSCH Leonard on 28/03/14.
//  Copyright (c) 2014 Gobelins. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController () <UIWebViewDelegate>
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
- (void)configureView;
@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setArticleUrl:(NSString *)articleUrl {
    
    _articleUrl = articleUrl;
    [self configureView];
    
    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.
    
    NSLog(@"yeah");

    if (self.articleUrl) {
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.articleUrl]];
        [self.articleWebview loadRequest:request];
        NSLog(@"Webview loaded");
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // load homepage
    [self.articleWebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.lemonde.fr"]]];
    
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = @"Derniers articles";
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}

#pragma mark - WebView delegate

- (void)webViewDidStartLoad:(UIWebView *)webView {
    self.activityIndicator.hidden = NO;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    self.activityIndicator.hidden = YES;
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    NSLog(@"Erreur");
    self.activityIndicator.hidden = YES;
}

@end
