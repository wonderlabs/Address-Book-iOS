//
//  Person.m
//  Example1
//
//  Created by Monica Brinkman on 2014-12-22.
//  Copyright (c) 2014 Monica Brinkman. All rights reserved.
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
    
    
    //Handel Picture
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



//{"results":[{"user":{"gender":"female","name":{"title":"mrs","first":"sherri","last":"king"},"location":{"street":"5129 hogan st","city":"addison","state":"mississippi","zip":"72940"},"email":"sherri.king89@example.com","username":"crazyelephant15","password":"bryan","salt":"PVXFMB4Z","md5":"4a4a3834e1d1c19a1a0e94cef7b564da","sha1":"8817d5f72756dca0fe31b3b2053b1a689c8b072d","sha256":"559b82b9100d383419908d91fb2bca1646649d246d225a08b05e867535e95834","registered":"1158686594","dob":"222514253","phone":"(645)-891-2651","cell":"(999)-791-6917","SSN":"526-38-6273","picture":{"large":"http://api.randomuser.me/portraits/women/21.jpg","medium":"http://api.randomuser.me/portraits/med/women/21.jpg","thumbnail":"http://api.randomuser.me/portraits/thumb/women/21.jpg"},"version":"0.4.1"},"seed":"b5d88d263f5b30bb"}]}

@end
