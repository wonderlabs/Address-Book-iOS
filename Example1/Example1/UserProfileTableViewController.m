//
//  UserProfileTableViewController.m
//  Example1
//
//  Created by Monica Brinkman on 2014-12-23.
//  Copyright (c) 2014 Monica Brinkman. All rights reserved.
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
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
