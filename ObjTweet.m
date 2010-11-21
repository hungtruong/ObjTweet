//
//  ObjTweet.m
//
//  Created by Hung Truong on 11/11/10.
//  Copyright 2010 Hung Truong.
//  License: GPL

#import "ObjTweet.h"


@implementation ObjTweet

-(void)openTwitterWithStatus:(NSString *)status{
  NSString *tweetString = (NSString *)CFURLCreateStringByAddingPercentEscapes(
    NULL,
    (CFStringRef)status,
    NULL,
    (CFStringRef)@"!*'();:@&=+$,/?%#[]",
    kCFStringEncodingUTF8 );

  //try using tweetie (Twitter official app)
  NSString *stringURL = [NSString stringWithFormat:@"tweetie://post?message=%@", tweetString];
  NSURL *url = [NSURL URLWithString:stringURL];
  if ([self openUrlIfPossibleWithURL:url]) {
    return;
  }
  
  //try using twitterific
  stringURL = [NSString stringWithFormat:@"twitterrific:///post?message=%@", tweetString];
  url = [NSURL URLWithString:stringURL];
  if ([self openUrlIfPossibleWithURL:url]) {
    return;
  }
  
  //try using twinkle
  stringURL = [NSString stringWithFormat:@"twinkle://message=%@", tweetString];
  url = [NSURL URLWithString:stringURL];
  if ([self openUrlIfPossibleWithURL:url]) {
    return;
  }
  
  //try using seesmic
  stringURL = [NSString stringWithFormat:@"x-seesmic://update?status=%@", tweetString];
  url = [NSURL URLWithString:stringURL];
  if ([self openUrlIfPossibleWithURL:url]) {
    return;
  }
  
  //try using echofon
  stringURL = [NSString stringWithFormat:@"twitterfon:///message?%@", tweetString];
  url = [NSURL URLWithString:stringURL];
  if ([self openUrlIfPossibleWithURL:url]) {
    return;
  }
  
  //try using echofonpro
  stringURL = [NSString stringWithFormat:@"twitterfonpro:///message?%@", tweetString];
  url = [NSURL URLWithString:stringURL];
  if ([self openUrlIfPossibleWithURL:url]) {
    return;
  }
  //try using twittelator
  stringURL = [NSString stringWithFormat:@"twit:///post?message=%@", tweetString];
  url = [NSURL URLWithString:stringURL];
  if ([self openUrlIfPossibleWithURL:url]) {
    return;
  }
  
  //try using brizzly
  stringURL = [NSString stringWithFormat:@"x-brizzly://post?text=%@", tweetString];
  url = [NSURL URLWithString:stringURL];
  if ([self openUrlIfPossibleWithURL:url]) {
    return;
  }
  //just try to open up twitter in mobile safari
  stringURL = [NSString stringWithFormat:@"http://mobile.twitter.com/?status=%@", tweetString];
  url = [NSURL URLWithString:stringURL];
  if ([self openUrlIfPossibleWithURL:url]) {
    return;
  }
}

-(void)openUserInTwitter:(NSString *)user {
  //try using tweetie (Twitter official app)
  NSString *stringURL = [NSString stringWithFormat:@"tweetie://user?screen_name=%@", user];
  NSURL *url = [NSURL URLWithString:stringURL];
  if ([self openUrlIfPossibleWithURL:url]) {
    return;
  }
  
  
  //try using brizzly
  /*not working?
  stringURL = [NSString stringWithFormat:@"x-brizzly://user?screen_name=%@", user];
  url = [NSURL URLWithString:stringURL];
  if ([self openUrlIfPossibleWithURL:url]) {
    return;
  }
  */
  
  //try using seesmic
  stringURL = [NSString stringWithFormat:@"x-seesmic://twitter_profile?twitter_screen_name=%@", user];
  url = [NSURL URLWithString:stringURL];
  if ([self openUrlIfPossibleWithURL:url]) {
    return;
  }
  
  
  //try using twittelator
  stringURL = [NSString stringWithFormat:@"twit:///user?screen_name=%@", user];
  url = [NSURL URLWithString:stringURL];
  if ([self openUrlIfPossibleWithURL:url]) {
    return;
  }
  
  
  //try using echofon
  stringURL = [NSString stringWithFormat:@"twitterfon:///user_timeline?%@", user];
  url = [NSURL URLWithString:stringURL];
  if ([self openUrlIfPossibleWithURL:url]) {
    return;
  }
  
  //try using echofon
  stringURL = [NSString stringWithFormat:@"twitterfonpro:///user_timeline?%@", user];
  url = [NSURL URLWithString:stringURL];
  if ([self openUrlIfPossibleWithURL:url]) {
    return;
  }
  
  //just try to open up twitter in mobile safari
  stringURL = [NSString stringWithFormat:@"http://mobile.twitter.com/%@", user];
  url = [NSURL URLWithString:stringURL];
  if ([self openUrlIfPossibleWithURL:url]) {
    return;
  }
  
}

-(BOOL)openUrlIfPossibleWithURL:(NSURL *)url{
  if ([[UIApplication sharedApplication] canOpenURL:url]) {
    [[UIApplication sharedApplication] openURL:url];
    return TRUE;
  }
  return FALSE;
}

@end
