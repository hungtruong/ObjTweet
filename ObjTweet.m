//
//  ObjTweet.m
//
/*The MIT License

Copyright (c) 2010 Hung Truong http://www.hung-truong.com

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
*/

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
