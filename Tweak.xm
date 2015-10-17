#define PLIST_PATH @"/var/mobile/Library/Preferences/@@PACKAGENAME@@.plist"
 
inline bool GetPrefBool(NSString *key) {
return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] boolValue];
}

%hook something
 
-(int)method {
if(GetPrefBool(@"key1")) {
return 9999999;
}
return %orig;
}

-(int)gems {       
if(GetPrefBool(@"key2")) {
return 9999999;
}
return %orig;
}

-(unsigned int)lives {
if(GetPrefBool(@"key3")) {
return 9999999;
}
return %orig;
}

%end

%hook SomethingElse

-(BOOL)SomeMethod {
if(GetPrefBool(@"key4")) {
return TRUE;
}
return %orig;
}

%end


/* Popup with a link 

Varieties of a UIAlertView Popup can be found here: http://iosgods.com/topic/13988-varieties-of-uialertview-types-to-use-in-your-tweaks-patchers/

*/


%hook AppDelegate // Change this with your Application's Delegate. AppController, UnityAppController, GameDelegate etc.

- (BOOL)application:(id)fp8 didFinishLaunchingWithOptions:(id)fp12 { // Popup only once at each launch of the app.
UIAlertView *igcredits = [[UIAlertView alloc] initWithTitle:@"@@PROJECTNAME@@ Cheats" 
                                                  message:@"\n@@PROJECTNAME@@ Cheats by @@USER@@ for iOSGods.com"
                                                 delegate:self 
										cancelButtonTitle:@"Thanks" 
										otherButtonTitles:@"Visit Us", nil]; 
[igcredits show];
[igcredits release]; 
%orig();
}
 
%new
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
 
NSString *button = [alertView buttonTitleAtIndex:buttonIndex];
 
	if([button isEqualToString:@"Visit Us"])
	{
		[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://iosgods.com/"]];                                                                                
	}
}
%end