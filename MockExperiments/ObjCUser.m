//
//  ObjCUser.m
//  MockExperiments
//
//  Created by dasdom on 06.04.15.
//  Copyright (c) 2015 Dominik Hauser. All rights reserved.
//

#import "ObjCUser.h"

@implementation ObjCUser
- (instancetype)initWithUserName:(NSString*)username name:(NSString*)name userId:(NSString*)userId {
  if ((self = [super init])) {
    _username = username;
    _name = name;
    _userId = userId;
  }
  return self;
}
@end
