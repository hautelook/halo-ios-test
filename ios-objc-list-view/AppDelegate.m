//
//  AppDelegate.m
//  ios-objc-list-view
//
//  Created by Bill Wetter on 3/5/17.
//  Copyright © 2017 HauteLook. All rights reserved.
//

#import "AppDelegate.h"
#import <OHHTTPStubs/OHHTTPStubs.h>
#import <OHHTTPStubs/OHPathHelpers.h>
#import "CompaniesViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self createJsonStub];
    [self createImageStub];
    
    _window = [[UIWindow alloc] initWithFrame: [[UIScreen mainScreen] bounds]];
    [_window makeKeyAndVisible];
    _window.backgroundColor = [UIColor whiteColor];
    
    UIViewController *vc1 = [[CompaniesViewController alloc] init];
    [_window setRootViewController:vc1];

    return YES;
}

- (void)createJsonStub {
    [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
        return [request.URL.pathExtension isEqualToString:@"json"];
    } withStubResponse:^OHHTTPStubsResponse*(NSURLRequest *request) {
        NSString *filePath = OHPathForFile([NSString stringWithFormat:@"Mocks/%@", request.URL.lastPathComponent],self.class);
        return [[OHHTTPStubsResponse responseWithFileAtPath:filePath
                                                 statusCode:200
                                                    headers:@{@"Content-Type":@"application/json"}]
                responseTime:OHHTTPStubsDownloadSpeedWifi];
    }];

}

- (void)createImageStub {
    [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
        return [request.URL.pathExtension isEqualToString:@"jpg"];
    } withStubResponse:^OHHTTPStubsResponse *(NSURLRequest *request) {
        NSString *filePath = OHPathForFile([NSString stringWithFormat:@"Mocks/%@", request.URL.lastPathComponent],self.class);
        return [[OHHTTPStubsResponse responseWithFileAtPath:filePath
                                                 statusCode:200
                                                    headers:@{@"Content-Type":@"image/jpeg"}]
                responseTime:OHHTTPStubsDownloadSpeedWifi];
    }];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
