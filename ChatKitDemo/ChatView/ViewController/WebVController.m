//
//  WebVController.m
//  ChatKitDemo
//
//  Created by 余强 on 16/3/31.

//

#import "WebVController.h"

@interface WebVController ()<UIWebViewDelegate>

@property(nonatomic,strong) UIActivityIndicatorView *activityView;

@end

@implementation WebVController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIWebView *web = [[UIWebView alloc]initWithFrame:self.view.bounds];
    web.delegate = self;
    
    [web loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.url]]];
    [self.view addSubview:web];
    
    
    
    self.activityView = [[UIActivityIndicatorView alloc]init];
    
    self.activityView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    [self.activityView startAnimating];
    self.activityView.center = CGPointMake(CGRectGetWidth(self.view.frame)/2, CGRectGetHeight(self.view.frame)/2);
    [self.view addSubview:self.activityView];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self.activityView stopAnimating];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [self.activityView stopAnimating];
}

@end
