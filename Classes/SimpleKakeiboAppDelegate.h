//
//  SimpleKakeiboAppDelegate.h
//  SimpleKakeibo
//
//  Created by masashi on 09/11/01.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#define APPNAME @"iSKakeibox"

@interface SimpleKakeiboAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    UINavigationController *navigationController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end

