//
//  AppDelegate.m
//  GW2TestOSXApp
//
//  Created by Kevin Vitale on 5/22/13.
//
//

#import "AppDelegate.h"
#import <GW2Kit/GW2Kit.h>

@implementation AppDelegate

- init {
    self = [super init];
    if(self) {
        [GW2EventDaemon daemon];
        [GW2WvWDaemon daemon];
        [GW2ItemsDaemon daemon];
        [GW2GuildDaemon daemon];
    }
    return self;
}
- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    return;

}

@end
