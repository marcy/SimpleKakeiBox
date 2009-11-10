//
//  CategoriesViewController.h
//  SimpleKakeibo
//
//  Created by masashi on 09/11/01.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "NodeViewController.h"

@interface CategoriesViewController : NodeViewController {

  IBOutlet UILabel* headerLabel;
  NSInteger year;
  NSInteger month;
  NSMutableArray* items;
}

@property NSInteger year;
@property NSInteger month;
@property (nonatomic, retain) NSMutableArray* items;


@end
