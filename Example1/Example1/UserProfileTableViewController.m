//
//  UserProfileTableViewController.m
//  Example1
//
//  Created by Drasko Vucenovic on 2014-12-23.
//  Copyright (c) 2014 Drasko Vucenovic. All rights reserved.
//

#import "UserProfileTableViewController.h"

@interface UserProfileTableViewController ()

@property NSMutableArray* detailValues;
@property NSArray* detailKeys;

@end

@implementation UserProfileTableViewController

@synthesize person;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.detailValues = [[NSMutableArray alloc]init];
    self.detailKeys = [[NSArray alloc]init];
    
    self.detailKeys = [NSArray arrayWithObjects:
                      @"Name",
                      @"Street Address",
                      @"City",
                      @"State",
                      @"ZIP",
                      @"Gender",
                      @"Date Of Birth",
                      @"Home Phone",
                      @"Cell Phone",
                      @"Email Address",
                      @"Username",
                      nil];
    
    NSString* fullName = [NSString stringWithFormat:@"%@ %@ %@", person.title, person.firstName, person.lastName];
    
    self.detailValues = [NSMutableArray arrayWithObjects:
                    fullName,
                    person.streetAddress,
                    person.city,
                    person.state,
                    person.zipCode,
                    person.gender,
                    person.dateOfBirth,
                    person.homePhone,
                    person.cellPhone,
                    person.emailAddress,
                    person.username,
                    nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.detailValues count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UserDetailPrototypeCell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    NSString* description = [self.detailKeys objectAtIndex:indexPath.row];
    NSString* value = [self.detailValues objectAtIndex:indexPath.row];
    
    cell.textLabel.text = description;
    cell.detailTextLabel.text = value;
    
    return cell;
}

@end
