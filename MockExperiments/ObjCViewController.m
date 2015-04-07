//
//  ObjCViewController.m
//  MockExperiments
//
//  Created by dasdom on 06.04.15.
//  Copyright (c) 2015 Dominik Hauser. All rights reserved.
//

#import "ObjCViewController.h"

@interface ObjCViewController ()

@end

@implementation ObjCViewController

- (instancetype)initWithSessionClass:(Class)sessionClass {
  if ((self = [super init])) {
    _MySession = sessionClass;
  }
  return self;
}

- (instancetype)init {
  return [self initWithSessionClass:[NSURLSession class]];
}

- (void)loadUser {
  NSURL *url = [NSURL URLWithString:@"https://api.app.net/users/@dasdom"];
  NSURLSession *session = [self.MySession sharedSession];
  NSURLSessionTask *task = [session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
    
    NSDictionary *dataDict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    NSDictionary *userDict = dataDict[@"data"];
    
    NSLog(@"userDict: %@", userDict);
    
  }];
  [task resume];
  
}

@end
