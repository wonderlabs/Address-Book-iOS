//
//  Person.h
//  Example1
//
//  Created by Monica Brinkman on 2014-12-22.
//  Copyright (c) 2014 Monica Brinkman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (readonly) NSString* gender;
@property (readonly) NSString* title;
@property (readonly) NSString* firstName;
@property (readonly) NSString* lastName;
@property (readonly) NSString* streetAddress;
@property (readonly) NSString* city;
@property (readonly) NSString* state;
@property (readonly) NSString* zipCode;
@property (readonly) NSString* emailAddress;
@property (readonly) NSString* username;
@property (readonly) NSString* dateOfBirth;
@property (readonly) NSString* homePhone;
@property (readonly) NSString* cellPhone;

-(void) initWithModel: (NSDictionary* )data;

@end



