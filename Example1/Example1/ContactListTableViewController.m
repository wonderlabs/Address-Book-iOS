//
//  ContactListTableViewController.m
//  Example1
//
//  Created by Drasko Vucenovic on 2014-12-18.
//  Copyright (c) 2014 Drasko Vucenovic. All rights reserved.
//

#import "ContactListTableViewController.h"
#import "UserProfileTableViewController.h"
#import "Person.h"


@interface ContactListTableViewController ()

@property NSMutableArray* userProfiles;

@end

@implementation ContactListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSInteger numResults = 100; //set number of desired results
    
    self.userProfiles = [[NSMutableArray alloc]init];
    [self parseData: numResults];
}

- (void) parseData: (NSInteger) results {
    NSString* url = [NSString stringWithFormat:@"http://api.randomuser.me/?results=%ld", results];
    NSURL* website = [NSURL URLWithString:url];
    NSData* json = [NSData dataWithContentsOfURL:website];
    
    if(json != nil)
    {
        NSError *error = nil;
        id jsonResult = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingMutableContainers error:&error];
        if (error == nil) {
            NSArray* rootObject = [jsonResult valueForKey:@"results"];
            [self updateUserProfiles:rootObject];
        }else {
            [NSException raise:@"Json Error" format:@"%@", error];
        }
    }
    else{
        [NSException raise:@"Error" format:@"Could not retrieve data from url. Please check internet connection and try again."];
    }
}

-(void)updateUserProfiles:(NSArray *)profiles {
   // [self.userProfiles removeAllObjects]; //clear all userProfiles
    
    for (int i = 0; i < [profiles count]; i++) {
        Person* person = [[Person alloc]init];
        [person initWithModel:profiles[i]];
        [self.userProfiles addObject:person]; //add each person in profiles array to the global private userProfiles variable.
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    //The number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.userProfiles count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListPrototypeCell" forIndexPath:indexPath];
    //Configure the cell..
    Person* person = [self.userProfiles objectAtIndex:indexPath.row];
    NSString* personFullName = [NSString stringWithFormat:@"%@ %@ %@", person.title, person.firstName, person.lastName];
    cell.textLabel.text = personFullName;
    
    return cell;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"showContactDetails"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        UserProfileTableViewController* destinationViewController = segue.destinationViewController;
        destinationViewController.person = [self.userProfiles objectAtIndex:indexPath.row]; //send selected person's profile inormation to the destination view controller (User Profile view controller).
    } else {
        [NSException raise:@"Error" format:@"Could not find segue 'showContactDetails'."];
    }
}

@end
