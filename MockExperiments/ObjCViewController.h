//
//  ObjCViewController.h
//  MockExperiments
//
//  Created by dasdom on 06.04.15.
//  Copyright (c) 2015 Dominik Hauser. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ObjCUser.h"

@interface ObjCViewController : UIViewController
@property (nonatomic, strong) id MySession;
@property (nonatomic, strong) ObjCUser *user;
@end
