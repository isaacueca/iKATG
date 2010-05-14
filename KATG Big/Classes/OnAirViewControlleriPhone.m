//
//  OnAirViewControlleriPhone.m
//  KATG Big
//
//  Created by Doug Russell on 5/10/10.
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

#import "OnAirViewControlleriPhone.h"

@implementation OnAirViewControlleriPhone

- (BOOL)textView:(UITextView *)textView 
shouldChangeTextInRange:(NSRange)range 
 replacementText:(NSString *)text
{
	if ([text isEqualToString:@"\n"])
	{
		[textView resignFirstResponder];;
		return NO;
	}
	return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	[textField resignFirstResponder];
	return NO;
}

- (void)events:(NSArray *)events
{
	[super events:events];
	if ([NSThread isMainThread])
	{
		if (events && events.count > 0)
		{
			
		}
	}
	else
	{
		[self performSelectorOnMainThread:@selector(events:) 
							   withObject:events 
							waitUntilDone:NO];
	}
}

@end
