/**
 * Copyright (c) 2015-present, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 */

#import "AppDelegate.h"

#import <React/RCTBundleURLProvider.h>
#import <React/RCTRootView.h>
#import <OneSignal/OneSignal.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  // Replace '11111111-2222-3333-4444-0123456789ab' with your OneSignal App ID.
  [OneSignal initWithLaunchOptions:launchOptions
                             appId:@"ff7cda9e-6192-4ffa-a36b-e48428a53ace"
          handleNotificationAction:nil
                          settings:@{kOSSettingsKeyAutoPrompt: @false}];
  OneSignal.inFocusDisplayType = OSNotificationDisplayTypeNotification;
  
  // Recommend moving the below line to prompt for push after informing the user about
  //   how your app will use them.
  [OneSignal promptForPushNotificationsWithUserResponse:^(BOOL accepted) {
    NSLog(@"User accepted notifications: %d", accepted);
  }];
  
  // Call syncHashedEmail anywhere in your iOS app if you have the user's email.
  // This improves the effectiveness of OneSignal's "best-time" notification scheduling feature.
  // [OneSignal syncHashedEmail:userEmail];
  
  NSURL *jsCodeLocation;

  jsCodeLocation = [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index" fallbackResource:nil];

  RCTRootView *rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation
                                                      moduleName:@"webrtc_test"
                                               initialProperties:nil
                                                   launchOptions:launchOptions];
  rootView.backgroundColor = [[UIColor alloc] initWithRed:1.0f green:1.0f blue:1.0f alpha:1];

  self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
  UIViewController *rootViewController = [UIViewController new];
  rootViewController.view = rootView;
  self.window.rootViewController = rootViewController;
  [self.window makeKeyAndVisible];
  return YES;
}

@end
