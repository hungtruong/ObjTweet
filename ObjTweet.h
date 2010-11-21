//
//  ObjTweet.m
//
//  Created by Hung Truong on 11/11/10.
//  Copyright 2010 Hung Truong.
//  License: GPL


#import <Foundation/Foundation.h>


@interface ObjTweet : NSObject {

}

-(void)openTwitterWithStatus:(NSString *)status;
-(BOOL)openUrlIfPossibleWithURL:(NSURL *)url;
-(void)openUserInTwitter:(NSString *)user;
@end
