//
//  ContactListTableViewController.m
//  Example1
//
//  Created by Monica Brinkman on 2014-12-18.
//  Copyright (c) 2014 Monica Brinkman. All rights reserved.
//

#import "ContactListTableViewController.h"
#import "UserProfileTableViewController.h"
#import "Person.h"


@interface ContactListTableViewController ()

@property NSMutableArray* toDoItems;
@property NSMutableArray* userProfiles;
@property NSInteger numResults;

@end

@implementation ContactListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.numResults = 100; //set number of desired results
    
    //self.toDoItems = [[NSMutableArray alloc ]init];
    self.userProfiles = [[NSMutableArray alloc]init];
    [self parseData];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void) parseData{
    NSString* url = [NSString stringWithFormat:@"http://api.randomuser.me/?results=%ld", self.numResults];
    NSURL* website = [NSURL URLWithString:url];
    NSData* json = [NSData dataWithContentsOfURL:website];
    
    if(json != nil)
    {
        NSError *error = nil;
        id jsonResult = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingMutableContainers error:&error];
        if (error == nil) {
            NSArray* rootObject = [jsonResult valueForKey:@"results"];
            [self updateUserProfiles:rootObject];
        }
    }
}

-(void)updateUserProfiles:(NSArray *)profiles {
   // [self.userProfiles removeAllObjects]; //clear all userProfiles
    
    for (int i = 0; i < [profiles count]; i++) {
        Person* person = [[Person alloc]init];
        [person initWithModel:profiles[i]];
        
        [self.userProfiles addObject:person];
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
    
    // Configure the cell...
//    ToDoItem* toDoItem = [self.toDoItems objectAtIndex:indexPath.row];
//    cell.textLabel.text = toDoItem.itemName;
//
//    if(toDoItem.completed){
//        cell.accessoryType = UITableViewCellAccessoryCheckmark;
//    }
//    else{
//        cell.accessoryType = UITableViewCellAccessoryNone;
//    }
    
    Person* person = [self.userProfiles objectAtIndex:indexPath.row];
    NSString* personFullName = [NSString stringWithFormat:@"%@ %@ %@", person.title, person.firstName, person.lastName];
    cell.textLabel.text = personFullName;
    
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


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"showContactDetails"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        UserProfileTableViewController* destinationViewController = segue.destinationViewController;
        
        //Person* thisPerson = [self.userProfiles objectAtIndex:indexPath.row];
       
        destinationViewController.person = [self.userProfiles objectAtIndex:indexPath.row];
    }

}


#pragma mark - Table View Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    [tableView deselectRowAtIndexPath:indexPath animated:NO];
//    ToDoItem *tappedItem = [self.toDoItems objectAtIndex:indexPath.row];
//    tappedItem.completed = !tappedItem.completed;
//    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];

}

@end
