//
//  ContactListTableViewController.h
//  Example1
//
//  Created by Drasko Vucenovic on 2014-12-18.
//  Copyright (c) 2014 Drasko Vucenovic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContactListTableViewController : UITableViewController

- (void) parseData: (NSInteger) results; //parseData was made public only for the purpose of Unit Testing, otherwise I would keep this method private as well.

@end
