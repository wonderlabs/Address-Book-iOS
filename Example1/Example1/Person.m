//
//  Person.m
//  Example1
//
//  Created by Drasko Vucenovic on 2014-12-22.
//  Copyright (c) 2014 Drasko Vucenovic. All rights reserved.
//

#import "Person.h"

@implementation Person {
    NSDictionary* user;
    NSDictionary* name;
    
    //user contents
    NSString* _gender;
    
    NSString* _title;
    NSString* _firstName;
    NSString* _lastName;
    
    //location data
    NSDictionary* location;
    
    NSString* _streetAddress;
    NSString* _city;
    NSString* _state;
    NSString* _zipCode;
    
    NSString* _emailAddress;
    NSString* _username;
    NSString* _dateOfBirth;
    NSString* _homePhone;
    NSString* _cellPhone;
}

@synthesize gender = _gender;
@synthesize title = _title;
@synthesize firstName = _firstName;
@synthesize lastName = _lastName;
@synthesize streetAddress = _streetAddress;
@synthesize city = _city;
@synthesize state = _state;
@synthesize zipCode = _zipCode;
@synthesize emailAddress = _emailAddress;
@synthesize username = _username;
@synthesize dateOfBirth = _dateOfBirth;
@synthesize homePhone = _homePhone;
@synthesize cellPhone = _cellPhone;

-(void) initWithModel: (NSDictionary* )data{
    
    user = [data objectForKey:@"user"];
    name = [user objectForKey:@"name"];
    location = [user objectForKey:@"location"];
    
    _gender = [user objectForKey:@"gender"];
    _title = [name objectForKey:@"title"];
    _firstName = [name objectForKey:@"first"];
    _lastName = [name objectForKey:@"last"];
    
    _streetAddress = [location objectForKey:@"street"];
    _city = [location objectForKey:@"city"];
    _state = [location objectForKey:@"state"];
    _zipCode = [location objectForKey:@"zip"];
    _emailAddress = [user objectForKey:@"email"];
    _username = [user objectForKey:@"username"];
    _dateOfBirth = [user objectForKey:@"dob"];
    _homePhone = [user objectForKey:@"phone"];
    _cellPhone = [user objectForKey:@"cell"];
}

@end
