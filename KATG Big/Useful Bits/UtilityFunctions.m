//
//  UtilityFunctions.m
//  PartyCamera
//
//  Created by Doug Russell on 6/18/10.
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

#import "UtilityFunctions.h"

const double	kRadPerDeg	= 0.0174532925199433;	// pi / 180

double	ToRadians(double degrees)
{
	return (degrees * kRadPerDeg);
}

NSString * AppDirectoryCachePath()
{
	NSString *path = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 
														  NSUserDomainMask, 
														  YES) lastObject];
	return path;
}
NSString * AppDirectoryCachePathAppended(NSString * pathToAppend)
{
	return [AppDirectoryCachePath() stringByAppendingPathComponent:pathToAppend];
}
NSString * TempFileName()
{
	return [NSString stringWithFormat:@"%f.bin", CFAbsoluteTimeGetCurrent()];
}
NSString * TempFolderName()
{
	return [NSString stringWithFormat:@"%f", CFAbsoluteTimeGetCurrent()];
}
NSString * AppDirectoryDocumentsPath()
{
	NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, 
														  NSUserDomainMask, 
														  YES) lastObject];
	return path;
}
NSString * AppDirectoryDocumentsPathAppended(NSString * pathToAppend)
{
	return [AppDirectoryDocumentsPath() stringByAppendingPathComponent:pathToAppend];
}
NSString * AppDirectoryLibraryPath()
{
	NSString *path = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 
														  NSUserDomainMask, 
														  YES) lastObject];
	return path;
}
NSString * AppDirectoryLibraryPathAppended(NSString * pathToAppend)
{
	return [AppDirectoryDocumentsPath() stringByAppendingPathComponent:pathToAppend];
}