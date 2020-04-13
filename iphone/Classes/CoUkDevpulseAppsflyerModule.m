/**
 * AppsFlyer
 *
 * Created by Your Name
 * Copyright (c) 2017 Your Company. All rights reserved.
 */

#import "CoUkDevpulseAppsflyerModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"
#import "AppsFlyerTracker.h"

@implementation CoUkDevpulseAppsflyerModule

#pragma mark Internal

// this is generated for your module, please do not change it
-(id)moduleGUID
{
	return @"13eb3c42-b132-46eb-a560-bfbe2298307e";
}

// this is generated for your module, please do not change it
-(NSString*)moduleId
{
	return @"co.uk.devpulse.appsflyer";
}

#pragma mark Lifecycle

-(void)startup
{
	// this method is called when the module is first loaded
	// you *must* call the superclass
	[super startup];

	NSLog(@"[INFO] %@ loaded",self);
}

-(void)shutdown:(id)sender
{
	// this method is called when the module is being unloaded
	// typically this is during shutdown. make sure you don't do too
	// much processing here or the app will be quit forceably

	// you *must* call the superclass
	[super shutdown:sender];
}

#pragma mark Cleanup

-(void)dealloc
{
	// release any resources that have been retained by the module
	[super dealloc];
}

#pragma mark Internal Memory Management

-(void)didReceiveMemoryWarning:(NSNotification*)notification
{
	// optionally release any resources that can be dynamically
	// reloaded once memory is available - such as caches
	[super didReceiveMemoryWarning:notification];
}

#pragma mark Listener Notifications

-(void)_listenerAdded:(NSString *)type count:(int)count
{
	if (count == 1 && [type isEqualToString:@"my_event"])
	{
		// the first (of potentially many) listener is being added
		// for event named 'my_event'
	}
}

-(void)_listenerRemoved:(NSString *)type count:(int)count
{
	if (count == 0 && [type isEqualToString:@"my_event"])
	{
		// the last listener called for event named 'my_event' has
		// been removed, we can optionally clean up any resources
		// since no body is listening at this point for that event
	}
}

#pragma Public APIs

-(id)example:(id)args
{
	// example method
	return @"hello world";
}

-(id)exampleProp
{
	// example property getter
	return @"hello world";
}

-(void)setExampleProp:(id)value
{
	// example property setter
}

-(void)log:(NSString *)text {
    NSLog(@"%@ %@", self, text);
}

-(void)initialise:(id)args
{
    [self log:@"Initialising tracker."];
    ENSURE_SINGLE_ARG(args, NSDictionary)

    id appsFlyerDevKey = [args objectForKey:@"appsFlyerDevKey"];
    id appleAppID = [args objectForKey:@"appleAppID"];
    id isDebug = [TiUtils boolValue:[args objectForKey:@"isDebug"] def:NO];

    ENSURE_STRING(appsFlyerDevKey)
    ENSURE_STRING(appleAppID)

    [AppsFlyerTracker sharedTracker].appsFlyerDevKey = appsFlyerDevKey;
    [AppsFlyerTracker sharedTracker].appleAppID = appleAppID;
    [AppsFlyerTracker sharedTracker].isDebug = isDebug;
}


//get conversion data and deep linking

-(void)onConversionDataSuccess:(NSDictionary*) installData {
  //Handle Conversion Data (Deferred Deep Link)
    id status = [installData objectForKey:@"af_status"];
    if([status isEqualToString:@"Non-organic"]) {
        id sourceID = [installData objectForKey:@"media_source"];
        id campaign = [installData objectForKey:@"campaign"];
        NSLog(@"This is a none organic install. Media source: %@  Campaign: %@",sourceID,campaign);
    } else if([status isEqualToString:@"Organic"]) {
        NSLog(@"This is an organic install.");
    }

}

-(void)onConversionDataFail:(NSError *) error {

  NSLog(@"%@",error);
}


- (void) onAppOpenAttribution:(NSDictionary*) attributionData {

  //Handle Deep Link
  NSLog(@"%@",attributionData);
}

- (void) onAppOpenAttributionFailure:(NSError *)error {
  NSLog(@"%@",error);
}

-(void)trackAppLaunch:(id)value
{
    [self log:@"Tracking app launch."];

    // track installs, updates & sessions (app opens)
    [[AppsFlyerTracker sharedTracker] trackAppLaunch];
}

-(void)trackEvent:(id)args
{
    [self log:@"Tracking Event."];
    ENSURE_SINGLE_ARG(args, NSDictionary)

    id name = [args objectForKey:@"name"];
    id data = [args objectForKey:@"data"];

    ENSURE_STRING(name)
    ENSURE_TYPE_OR_NIL(data, NSDictionary)

    [[AppsFlyerTracker sharedTracker] trackEvent:name withValues:data];
}

-(void)continueUserActivity:(id)args
{
    [self log:@"Inside continueUserActivity."];
    ENSURE_SINGLE_ARG(args, NSDictionary);

    // got the object keys from here: https://github.com/appcelerator/titanium_mobile/pull/6937/files
    id activityType = [args objectForKey:@"activityType"];
    id activityTitle = [args objectForKey:@"title"];
    id activityWebpageURL = [args objectForKey:@"webpageURL"];
    id activityUserInfo = [args objectForKey:@"userInfo"];

    ENSURE_STRING(activityType)
    ENSURE_TYPE_OR_NIL(activityTitle, NSString)
    ENSURE_TYPE_OR_NIL(activityWebpageURL, NSString)
    ENSURE_TYPE_OR_NIL(activityUserInfo, NSDictionary)

    NSUserActivity *activity = [[NSUserActivity alloc]initWithActivityType:activityType];
    [self log:[NSString stringWithFormat:@"Activity type: %@", activityType]];

    if (activityTitle != nil) {
        activity.title = activityTitle;
    }

    if (activityWebpageURL != nil) {
        activity.webpageURL = [NSURL URLWithString:activityWebpageURL];
    }

    if (activityUserInfo != nil) {
        activity.userInfo = activityUserInfo;
    }

    [[AppsFlyerTracker sharedTracker] continueUserActivity:activity restorationHandler:nil];
    [self log:@"Finished tracking continueUserActivity."];
}

-(void)handleOpenUrl:(id)args
{
    [self log:@"Inside handleOpenUrl."];
    ENSURE_SINGLE_ARG(args, NSDictionary);

    id urlString = [args objectForKey:@"url"];
    ENSURE_STRING(urlString)
    NSURL *url = [NSURL URLWithString:urlString];

    [self log:[NSString stringWithFormat:@"URL for handleOpenUrl: %@", urlString]];

    NSMutableDictionary *options = [NSMutableDictionary dictionaryWithDictionary:args];
    [options removeObjectForKey:@"url"];

    [[AppsFlyerTracker sharedTracker] handleOpenUrl:url options:options];
    [self log:@"Finished tracking handleOpenUrl."];
}

@end
