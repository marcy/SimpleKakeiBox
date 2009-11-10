//
//  MyApplicationData.m
//  SimpleKakeibo
//
//  Created by masashi on 09/11/03.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "MyApplicationData.h"


@implementation MyApplicationData

@synthesize items;
@synthesize categories;

#pragma mark NSCoding
- (void)encodeWithCoder:(NSCoder *)aCoder{
  [aCoder encodeObject:items forKey:ITEMS_KEY];
  [aCoder encodeObject:categories forKey:CATEGORIES_KEY];
}

-(id)initWithCoder:(NSCoder *)aDecoder{
  if(self = [super init]){
    self.items = [[aDecoder decodeObjectForKey:ITEMS_KEY] retain];
    self.categories = [[aDecoder decodeObjectForKey:CATEGORIES_KEY] retain];
  }
  return self;
}

#pragma mark -
#pragma mark NSCopying
-(id)copyWithZone:(NSZone *)zone{
  MyApplicationData* copy = [[[self class]allocWithZone:zone]init];
  items = [self.items copy];
  categories = [self.categories copy];
  return copy;
}

@end
