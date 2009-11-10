//
//  MyApplicationData.h
//  SimpleKakeibo
//
//  Created by masashi on 09/11/03.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#define ITEMS_KEY @"items"
#define CATEGORIES_KEY @"categories"


#import <UIKit/UIKit.h>


@interface MyApplicationData : NSObject <NSCoding, NSCopying> {
	NSMutableArray* items;
	NSMutableArray* categories;
}

@property (nonatomic ,retain) NSMutableArray* items;
@property (nonatomic, retain) NSMutableArray* categories;


@end
