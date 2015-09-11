#define PLIST_PATH @"/var/mobile/Library/Preferences/@@PACKAGENAME@@.plist"
 
inline bool GetPrefBool(NSString *key) {
return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] boolValue];
}

%hook something
 
-(int)method {
if(GetPrefBool(@"kKey")) {
return 9999999;
}
return %orig;
}

-(int)gems {       
if(GetPrefBool(@"kGems")) {
return 9999999;
}
return %orig;
}

-(unsigned int)lives {
if(GetPrefBool(@"kLives")) {
return 9999999;
}
return %orig;
}

%end

%hook SomethingElse

-(BOOL)SomeMethod {
if(GetPrefBool(@"kKEY5")) {
return TRUE;
}
return %orig;
}

-(BOOL)SomeMethod2 {
if(GetPrefBool(@"kKEY6")) {
return FALSE;
}
return %orig;
}

%end