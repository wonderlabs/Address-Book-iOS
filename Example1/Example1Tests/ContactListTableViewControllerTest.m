//
//  ContactListTableViewControllerTest.m
//  Example1
//
//  Created by Drasko Vucenovic on 2014-12-30.
//  Copyright (c) 2014 Drasko Vucenovic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "ContactListTableViewController.h"

@interface ContactListTableViewControllerTest : XCTestCase

@end

@implementation ContactListTableViewControllerTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
  //  id mockController = [ContactListTableViewController class];
    
}

//Test that when the internet is cut, the parseData method throws an excpetion.
-(void) testNoInternetDataCollection{
    id mockController = [ContactListTableViewController class];
    XCTAssertThrowsSpecific([mockController parseData:10], NSException, @"Should throw internet exception.");
    
}


- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
