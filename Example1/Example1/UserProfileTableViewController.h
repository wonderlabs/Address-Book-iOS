//
//  UserProfileTableViewController.h
//  Example1
//
//  Created by Drasko Vucenovic on 2014-12-23.
//  Copyright (c) 2014 Drasko Vucenovic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"

@interface UserProfileTableViewController : UITableViewController

@property (nonatomic, strong) Person* person;

@end
