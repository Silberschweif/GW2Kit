# GW2Kit

GW2Kit is a Objective-C framework for the Guild Wars 2 API. GW2Kit allows iOS and OS X applications to natively use the GW2 API. It relies on two frameworks:

## Overview

The Official Guild Wars 2 API was released on May 20th, posted by ArenaNet Lead Programmer [Cliff Spradlin](https://forum-en.guildwars2.com/forum/community/api/API-Documentation/first#post2028044). It provides third-party application the ability to query in-game data in real-time. 

- [The API documentation](https://forum-en.guildwars2.com/forum/community/api/API-Documentation/first#post2028044) (Guild Wars 2 Forums)
- [API wiki page](http://wiki.guildwars2.com/wiki/API) (wiki.guildwars2.com)

### Available Information

The following endpoints all assume `GET`. For full details, refer to the API's documentation.

#### Locations

- `v1/event_names.json`
- `v1/map_names.json`
- `v1/world_names.json`

#### Items

- `v1/items.json`
- `v1/item_details.json`

#### Recipes

- `v1/recipes.json`
- `v1/recipe_details.json`

#### Events

- `v1/events.json`

#### WvW

- `v1/wvw/matches.json`
- `v1/wvw/matche_details.json`

<hr/>

## Using GW2Kit

You can add the `GW2Kit` framework to your mobile and/or desktop Cocoa applications which meet these requirements:

- **OS X**: 10.7
- **iOS**: 5.0
- **Xcode.app**: 4.6

*Note: Is written using the ARC (automatic reference counting) memory model.*

### Getting the code ###

Open your **Terminal.app**  
  *Located: /Applications/Utilities/Terminal.app*

	$ cd /path/to/some_directory
	$ git clone git://github.com/KevinVitale/GW2Kit.git
	$ cd GW2Kit
	$ git submodule update --init --recursive
	$ open GW2Kit.xcworkspace
	
	
### Framework dependencies

You might notice that there are a lot of schemes in Xcode's scheme list. This will be fixed soon, but part of the reason is that `GW2Kit` relies on two other frameworks:

- [RestKit](https://github.com/RestKit/RestKit) - network communication and parsing
- [ReactiveCocoa](https://github.com/ReactiveCocoa/ReactiveCocoa) - functional extensions for Objective-C

### Running the iOS example

In Xcode's scheme picker, select **GW2KitTestiOSApp** Build & Run the app by pressing the giant play button or hitting **⌘+R**.

<hr/>

## SDK Examples

### Item detail

Looking up __The Hunter__:

	NSString *itemID = @"29175";
	[GW2 itemDetailForID:itemID
	          completion:^(NSError *error, GW2ItemDetail *itemDetail) {
	    printf("%s", [itemDetail description].UTF8String);
	}];

##### Output:

	----------------------------------------------------------------------------------------------------
	[#29175] The Hunter
	----------------------------------------------------------------------------------------------------
	| rarity                                  : Exotic
	| vendorValue                             : 396
	| gameTypes                               : (
	    Activity,
	    Dungeon,
	    Pve,
	    Wvw
	)
	| flags                                   : (
	    HideSuffix
	)
	| restrictions                            : (
	)
	| text                                    : <c=@flavor>This weapon is used to craft the legendary rifle The Predator</c>
	| type                                    : Weapon
	| itemID                                  : 29175
	| name                                    : The Hunter
	| info                                    : {
	    "damage_type" = Physical;
	    defense = 0;
	    "infix_upgrade" =     {
	        attributes =         (
	                        {
	                attribute = Power;
	                modifier = 179;
	            },
	                        {
	                attribute = Precision;
	                modifier = 128;
	            },
	                        {
	                attribute = CritDamage;
	                modifier = 9;
	            }
	        );
	        buff = "";
	    };
	    "infusion_slots" =     (
	    );
	    "max_power" = 1205;
	    "min_power" = 986;
	    "suffix_item_id" = 24561;
	    type = Rifle;
	}
	
### Polling Event States

Find event states in 'Kessex Hills' on 'Maguuma'

	[GW2 eventStatesWithParameters:@{@"world_id" : @"1005", @"map_id" : @"23"}
	                    completion:^(NSError *error, id states) {
	                        for(GW2EventStatus *status in states) {
	                            printf("%s", [status description].UTF8String);
	                        }
	                    }];
	
##### Output:

	mapID                                   : 23
	state                                   : Success
	eventID                                 : F090E0ED-AFC3-4AEE-A90C-91A57FB27F6D
	worldID                                 : 1005

	mapID                                   : 23
	state                                   : Warmup
	eventID                                 : 3CE76F6D-A926-4BB2-9124-D5AA85B1E68A
	worldID                                 : 1005

	mapID                                   : 23
	state                                   : Warmup
	eventID                                 : F5841085-D765-4CBF-8E22-EF3521C6813D
	worldID                                 : 1005

	mapID                                   : 23
	state                                   : Warmup
	eventID                                 : E7D9AD09-44CE-42E0-BB85-9E62D59928A6
	worldID                                 : 1005

	... *many, many more...*

<hr/>

## License

Copyright 2013 Kevin Vitale

	Licensed under the Apache License, Version 2.0 (the "License");
	you may not use this file except in compliance with the License.
	You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

	Unless required by applicable law or agreed to in writing, software
	distributed under the License is distributed on an "AS IS" BASIS,
	WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
	See the License for the specific language governing permissions and
	limitations under the License.

#### API Terms

These API’s are wholly owned by ArenaNet, LLC (“ArenaNet”). Any use of the API’s must comply with the Website Terms of Use and Content Terms of Use , however you may use the API’s to make commercial products so long as they are otherwise compliant and do not compete with ArenaNet. ArenaNet may revoke your right to use the API’s at any time. In addition, ArenaNet may create and/or amend any terms or conditions applicable to the API’s or their use at any time and from time to time. You understand and agree that ArenaNet is in the process of developing a full license agreement for these API’s and ArenaNet will publikitten when it is complete. Your continued use of the API’s constitutes acceptance of the full license agreement and any related terms or conditions when they are posted.

#### Credits

GW2Kit is brought to you by [Kevin Vitale](https://github.com/KevinVitale).