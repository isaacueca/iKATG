//
//  EventsDetailViewController.m
//  KATG Big
//
//  Created by Doug Russell on 5/5/10.
//  Copyright 2010 Doug Russell. All rights reserved.
//  
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//  
//  http://www.apache.org/licenses/LICENSE-2.0
//  
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//  

#import "EventsDetailViewController.h"
#import "ModalWebViewController.h"
#import "NSString+Regex.h"

@implementation EventsDetailViewController
@synthesize webView;
@synthesize titleLabel;
@synthesize dayLabel;
@synthesize dateLabel;
@synthesize timeLabel;
@synthesize event;

- (void)viewDidLoad 
{
    [super viewDidLoad];
	NSString *htmlHeader = @"<html><head><style>\nbody \n{\npadding: 0px;\nfont-family: Helvetica; \nfont-size: 18px;\nmargin: 0;\n}\n</style></head><body>";
	NSString *htmlFooter = @"</body></html>";
	NSString *htmlBody = [event objectForKey:@"Details"];
	NSString *regex = @"style=\"[^\"]*\"";
	htmlBody = [htmlBody stringByReplacingOccurencesOfRegularExpressions:regex 
															  withString:@""];
	htmlBody = [htmlBody stringByReplacingOccurrencesOfString:@"http://www.keithandthegirl.com/Live/HowToListen.aspx" 
												   withString:@""];
	htmlBody = [htmlBody stringByReplacingOccurrencesOfString:@"../Live/HowToListen.aspx" 
												   withString:@""];
	htmlBody = [htmlBody stringByReplacingOccurrencesOfString:@"Here's how  to listen:"
												   withString:@""];
	htmlBody = [htmlBody stringByReplacingOccurrencesOfString:@"Here's how to listen:"
												   withString:@""];
	NSString *htmlString = [NSString stringWithFormat:@"%@%@%@",
							htmlHeader,
							htmlBody,
							htmlFooter];
	webView.backgroundColor = [UIColor clearColor];
	[webView loadHTMLString:htmlString 
					baseURL:[NSURL URLWithString:@"http://www.keithandthegirl.com/"]];
	[titleLabel setText:[event objectForKey:@"Title"]];
	[dayLabel setText:[event objectForKey:@"Day"]];
	[dateLabel setText:[event objectForKey:@"Date"]];
	[timeLabel setText:[event objectForKey:@"Time"]];
}
- (void)didReceiveMemoryWarning 
{
	[super didReceiveMemoryWarning];
}
- (void)viewDidUnload 
{
	[super viewDidUnload];
}
- (void)dealloc 
{
	[webView release];
	[event release];
	[titleLabel release];
	[dayLabel release];
	[dateLabel release];
	[timeLabel release];
	[super dealloc];
}
- (BOOL)webView:(UIWebView *)webView 
shouldStartLoadWithRequest:(NSURLRequest *)request 
 navigationType:(UIWebViewNavigationType)navigationType 
{
	if (navigationType == UIWebViewNavigationTypeOther) 
	{
		return YES;
	} 
	else if (navigationType == UIWebViewNavigationTypeLinkClicked)
	{
		ModalWebViewController *modalWebViewController = 
		[[ModalWebViewController alloc] initWithNibName:@"ModalWebViewiPad" 
												 bundle:nil];
		[modalWebViewController setRequest:request];
		[modalWebViewController setModalPresentationStyle:UIModalPresentationFormSheet];
		[modalWebViewController setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
		[self presentModalViewController:modalWebViewController 
								animated:YES];
		[modalWebViewController release];
		return NO;
	}
	return YES;
}

@end