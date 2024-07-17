local FNFF_CE = PLUGIN

FNFF_CE.name = "Combat Entities"
FNFF_CE.description = ""
FNFF_CE.author = ""

FNFF_CE.mainPlugin = FNFF_CE.mainPlugin or {}
FNFF_CE.skillPlugin = FNFF_CE.skillPlugin or {}
FNFF_CE.actions = FNFF_CE.actions or {}

ix.util.Include("cl_observer.lua")
ix.util.Include("sh_centcommands.lua")
ix.util.Include("sh_centchat.lua")
ix.util.Include("sh_centproperties.lua")
ix.util.Include("sv_plugin.lua")

PLUGIN.savedEnts = PLUGIN.savedEnts or {}

CAMI.RegisterPrivilege({Name = "Helix - Manage CEnts", MinAccess = "superadmin"})

function math.ToMeters(num) return num * 0.01905 end

function math.ToSU(num) return num * 52.49 end

if (CLIENT) then
    function PLUGIN:GetCharacterName(speaker, chatType)
        if speaker.combatEntity then return speaker:Name() end
    end
end

PLUGIN.firstnamesnormal = {
    "Zynoviy", "Abagor", "Abamon", "Abataly", "Abelyar", "Abid", "Abily",
    "Abnody", "Abram", "Aburom", "Adam", "Adrick", "Agapion", "Agapit", "Agapy",
    "Agat", "Agav", "Agavva", "Ahren", "Akim", "Albert", "Aldouryen", "Alek",
    "Aleks", "Aleksandr", "Aleksei", "Aleksey", "Alex", "Alexander", "Alexei",
    "Alexey", "Alexi", "Alik", "Alosha", "Alyosha", "Amvrosy", "Anastas",
    "Anatolii", "Anatoliy", "Anatoly", "Andrei", "Andrey", "Andriy", "Andru",
    "Andrusha", "Arkasha", "Arkhip", "Arnold", "Artyom", "Avda", "Avdakt",
    "Avdelay", "Avdey", "Avdifaks", "Avdiky", "Avdiyes", "Avdon", "Avel",
    "Avenir", "Aventin", "Averky", "Avgar", "Avgury", "Avgust", "Avgustin",
    "Avian", "Avim", "Avimelekh", "Avip", "Avit", "Aviv", "Avksenty", "Avksily",
    "Avksivy", "Avkt", "Avram", "Avrelian", "Avrely", "Avrey", "Avros", "Avsey",
    "Blake", "Bodashka", "Bodya", "Bogdan", "Boggi", "Bohdan", "Bohdanko",
    "Boris", "Borka", "Borya", "Boryan", "Borys", "Borysko", "Boryslav",
    "Bravas", "Budimir", "Cody", "Danya", "Danylets", "Danylko", "Danylo",
    "David", "Demid", "Demitri", "Denis", "Dennis", "Denys", "Dima", "Dimitri",
    "Dimka", "Dimon", "Dimuha", "Dimukha", "Dmitri", "Dmitriy", "Dmitro",
    "Dmitry", "Dmytro", "Dmytrus", "Dominik", "Duke", "Dzon", "Edik", "Eduard",
    "Efim", "Fabi", "Faddey", "Fadeyka", "Fadeyushka", "Falko", "Feddei",
    "Fedir", "Fedka", "Fedor", "Fedot", "Fedya", "Feliks", "Felka", "Feodor",
    "Feofan", "Ferapont", "Filip", "Filka", "Filya", "Fima", "Fimka", "Foma",
    "Fredek", "George", "Georgiy", "Georgy", "Gerasim", "German", "Gleb",
    "Glib", "Gosha", "Greg", "Griesha", "Grigoriy", "Grigory", "Grischa",
    "Grisha", "Grishka", "Igor", "Igorek", "Igoryok", "Ilari", "Ilarion",
    "Ilia", "Illarion", "Illya", "Ilya", "Ilyuha", "Ilyukha", "Immanuil",
    "Innokentiy", "Ioakim", "Ioann", "Ion", "Iosif", "Iov", "Isay", "Ivan",
    "Iven", "Jardani", "Jaroslav", "Jascha", "Kazimir", "Keesa", "Kenin",
    "Kervyn", "Kesha", "Kir", "Kirill", "Kiryukha", "Klim", "Kliment", "Kodi",
    "Kodiak", "Kolia", "Kolya", "Kolyan", "Konnar", "Konstantin", "Konstantyn",
    "Kostik", "Kostya", "Kostyan", "Krystiyan", "Kuryakin", "Kuzma", "Kyrylo",
    "Lavrentiy", "Lazar", "Lekha", "Lenin", "Lenka", "Yakiv", "Yakov", "Yara",
    "Yaremka", "Yarik", "Yaroslav", "Yasha", "Yashka", "Yefim", "Yegor",
    "Yelisey", "Yeltsin", "Yerik", "Yermolai", "Yermolay", "Yeva", "Yevgeni",
    "Yevgeny", "Yevhen", "Yevheniy", "Yevstafiy", "Yobany", "Yulian", "Yuma",
    "Yura", "Yuras", "Yure", "Yuri", "Yurian", "Yurik", "Yuriy", "Yurka",
    "Yurko", "Yurochka", "Yury", "Zach", "Zaika", "Zakhar", "Zamat", "Zaraya",
    "Zaroff", "Zavoy", "Zeal", "Zeno", "Zheka", "Zhenechka", "Zhenia", "Zhenka",
    "Zhenya", "Zhivago", "Zhora", "Zhorka", "Zigfrids", "Zigor", "Zinovy",
    "Zivon", "Zory"
}

PLUGIN.lastnamesnormal = {
    "Citrus", "Abject", "Absolute", "Accordion", "Accountant", "Ace", "Alert",
    "Armorer", "Artist", "Athlete", "Attorney", "Aviator", "Babbler", "Bargain",
    "Backbone", "Bagel", "Baldy", "Banana", "Banks", "Barabashka", "Bard",
    "Barmaley", "Baron", "Barrel", "Batty", "Baton", "Beans", "Beard", "Beast",
    "Beacon", "Bedbug", "Beekeeper", "Bacon", "Belly", "Bigtime", "Biscuit",
    "Bismarck", "Black", "Bless", "Blighter", "Blimp", "Block", "Boost",
    "Banned", "Bolt", "Bonaparte", "Bony", "Boot", "Booze", "Bore", "Boss",
    "Bosun", "Boulder", "Bourbon", "Bourgeois", "Bowlegged", "Break", "Breech",
    "Brick", "Brigand", "Brownie", "Bruise", "Buddy", "Buffy", "Buffer",
    "Buffoon", "Bug", "Bulkin", "Bum", "Bummer", "Bumper", "Bundle",
    "Bureaucrat", "Burr", "Bushwhacker", "Buster", "Busybody", "Butt",
    "Butterfingers", "Butters", "Cabbage", "Cabby", "Cadet", "Caesar", "Canary",
    "Cap", "Capital", "Carbide", "Cardan", "Carpenter", "Carrier", "Cartridge",
    "Casanova", "Catch", "Caveman", "Champ", "Chance", "Chapaev", "Chapai",
    "Chapay", "Chapayev", "Chauffeur", "Chebur", "Cheburashka", "Chest",
    "Chief", "Chilli", "Chill", "Chilly", "Chimneysweep", "Chingachgook",
    "Chingachuk", "Chipper", "Cheer", "Chronic", "Chuck", "Cider", "Claw",
    "Cognac", "Collar", "Colonel", "Comanche", "Comb", "Common", "Connoisseur",
    "Contact", "Cook", "Corner", "Cossack", "Cottager", "Counselor", "Count",
    "Courier", "Cracker", "Cranky", "Crest", "Cripple", "Cradle", "Crony",
    "Cross", "Cross-eyed", "Crosstie", "Crucian", "Crybaby", "Cursor", "Cynic",
    "Daddy", "Dancer", "Dandy", "Bread", "Deals", "Debater", "Defunct",
    "Degree", "Deputy", "Despot", "Dexter", "Diver", "Doc", "Docile", "Dock",
    "Doctor", "Dogman", "Dolittle", "Damp", "Dork", "Doughboy", "Doughnut",
    "Drink", "Drill", "Drip", "Driver", "Drum", "Drummer", "Dry", "Dude",
    "Duke", "Dummy", "Dumpling", "Duremar", "Dynamite", "Eagle-eyed", "Eared",
    "Ears", "Elder", "Electrician", "Ender", "Engine", "Epaulet", "Ethnic",
    "Explorer", "Factor", "Fable", "Fan", "Fang", "Fantasist", "Fat", "Fatso",
    "Fatty", "Favorite", "Freeze", "Fighter", "Fireball", "Firefighter",
    "Fireman", "Fist", "Five", "Flamen", "Flecked", "Flint", "Flop", "Fog",
    "Footballer", "Forester", "Formidable", "Fortunate", "Fragged", "Frame",
    "Frantic", "Friday", "Fubar", "Gadfly", "Gaffer", "Gagster", "Garlic",
    "Genghis", "Gentle", "Gigolo", "Gioconda", "Gladiator", "Glider", "Glitch",
    "Globe", "Gloomy", "Glue", "Glutton", "Gnat", "Godfrey", "Goofy", "Goodman",
    "Gorynich", "Grabber", "Grad", "Gramps", "Grandpa", "Graph", "Grater",
    "Gray", "Green", "Grenade", "Great", "Grice", "Grill", "Grinder", "Haggler",
    "Handicapped", "Hangman", "Hardware", "Hardy", "Hatrack", "Hawkins", "Head",
    "Heartthrob", "Hedge", "Herdsman", "Hero", "Highlander", "Hipster",
    "Hireling", "Hoary", "Hobo", "Holey", "Homeboy", "Homebrew", "Hunchback",
    "Icarus", "Ice", "Important", "Indian", "Ink", "Iron", "Ironstone",
    "Iroquois", "Jack", "Jupiter", "Jackstraw", "Jammy", "Janitor", "Jerboa",
    "Jester", "Jiggers", "Jogger", "Joint", "Jumper", "June", "Junk", "Kagor",
    "Karma", "Kaschey", "Key", "Khan", "Kicker", "King", "Knot", "Kolobok",
    "Koschei", "Kutuzov", "Lame", "Lamer", "Lamp", "Lantern", "Law", "Lax",
    "Leary", "Leech", "Legal", "Legalist", "Lemming", "Leshiy", "Lifeguard",
    "Lifesaver", "Little Man", "Loader", "Loaf", "Local", "Lock", "Locksmith",
    "Log Splitter", "Long", "Long John", "Loony", "Loser", "Loudmouth", "Loyal",
    "Luckster", "Lucky", "Machine", "Machinist", "Madera", "Magnate", "Major",
    "Morei", "Manipulator", "Manul", "Marmot", "Martian", "Mason", "Matador",
    "Meany", "Mechanic", "Merchant", "Messenger", "Met", "Milkman",
    "Minepicker", "Miner", "Minesweeper", "Minnow", "Miser", "Moderator",
    "Mohawk", "Monocle", "Moor", "Moody", "Mop", "Moped", "Morel", "Motor",
    "Mountaineer", "Mummer", "Muscleman", "Musket", "Nail", "Napoleon",
    "Nelson", "Neptune", "Nerve", "Nickel", "Ninja", "Noodle", "Nothing",
    "Oscar", "Owner", "Pacemaker", "Pacifist", "Paddle", "Padishah", "Pagan",
    "Painter", "Panadol", "Papa", "Parachute", "Paranoia", "Pariah", "Partisan",
    "Pastor", "Pathfinder", "Patron", "Patsyuk", "Patty", "Pebble", "Peddler",
    "Peewee", "Pepper", "Percher", "Perp", "Pert", "Pietist", "Pigmy", "Pilot",
    "Ruse", "Round", "Roundboy", "Runner", "Rusty", "Ryazansky", "Saber",
    "Salesman", "Samurai", "Sawn-off", "Scoop", "Screw", "Scrub", "Scythian",
    "Secretary", "Shaggy", "Shah", "Sham", "Sharp", "Sharp-sighted",
    "Sharptoothed", "Shaved", "Shaven", "Sheep Herder", "Shell", "Shepherd",
    "Shifter", "Shipboy", "Chivalry", "Shortstop", "Shotgun", "Shovel", "Shill",
    "Shrink", "Sieve", "Simpleton", "Simulator", "Siniy", "Skew", "Skiff",
    "Skinny", "Slipper", "Slouch", "Smart Aleck", "Smartass", "Smoker",
    "Sniper", "Sock", "Softy", "Sophomore", "Space", "Spade", "Spaghetti",
    "Spam", "Sparks", "Spank", "Spill", "Spine", "Spinner", "Spliff",
    "Sportsman", "Spy", "Squint", "Squint-eyed", "Squire", "Stagnant",
    "Stamina", "Stern", "Stiff", "Stooped", "Storyteller", "Stout", "Strap",
    "Stud", "Stunt", "Sturdy", "Sultan", "Susanin", "Swank", "Sweeper",
    "Swifty", "Tadpole", "Tail", "Tails", "Tambourine", "Tanker", "Tar",
    "Thrush", "Tie", "Tightwad", "Tin Man", "Tiranas", "Toadstool", "Tobacco",
    "Torn", "Toupee", "Tourist", "Trailblazer", "Tramp", "Transporter", "Trap",
    "Traveler", "Trick", "Trombone", "Trooper", "Truculent", "Tuner", "Turd",
    "Turkey", "Tycoon", "Uncle", "Vacuum", "Vagabond", "Ventilator", "Verbal",
    "Viking", "Visitor", "Voland", "Voldemort", "Virtue", "Whiner", "Whip",
    "Whirlpool", "Whiskey", "Whist", "Whistle", "White", "Whiz", "Wind",
    "Witcher", "Woodchuck", "Woodpecker", "Workhorse", "Worker", "Wrangler",
    "Wrinkled", "Yakker", "Zinger", "Zmur", "Zucchini", "Roamer", "Seeker",
    "Umbra", "Venus", "Wake", "Xander", "Year", "Zone", "Solenya", "Bastion",
    "Ember", "Empty", "Exit", "Mischief", "Asylum", "Star", "Xavier", "Xaraia",
    "Voldo", "Sanguine", "Oblivion", "Raikonen", "Harrari", "Blast", "Poe",
    "Valley", "Boomer", "Northland", "Southerland", "Quazar", "Quade",
    "Quagmire", "Unsullied", "Ulcer", "Unique", "Unify", "Union", "Ugly",
    "User", "Xylotol", "X", "Yesterday", "Yale", "Yippy", "Ambrosia", "Lotus",
    "Blackmoon", "Harmony", "Cable", "Carver", "Talent", "Squiggle", "Beerman",
    "Scout", "Watchman", "Tower", "Fieldman", "Wanderer", "Wimp", "Hopper",
    "Tolkien", "Jabber", "Sticky", "Light", "Breeki", "Cheeky", "Discord",
    "Vampire", "Brood", "Colony", "Griswold", "Reader", "Ironsmith", "Basket",
    "Riggs", "Sail", "Northlane", "Southway", "Flick", "Otto", "Kransky",
    "Jurich", "Child", "Severance", "Heater", "Gant", "Casper", "Switch",
    "Crunk", "Diddy", "Sable", "Pod", "Popper", "Flask", "Rubix", "Collider",
    "Xray", "Kip", "Karage", "Donda", "Ramsey", "Forks", "Sponge", "Mill",
    "Flax", "Caught", "Crossfire", "Trix", "Grease", "Lender", "Looty",
    "Hamachi", "Vinny", "Yoyo", "Reacher", "Dopamine", "Tinnitus", "Flapjack",
    "Saddle", "Whiplash", "Careful", "Opaque", "Glaze", "Glugger", "Dipstick",
    "Frothy", "Woosh", "Balance", "Tactile", "Feedback", "Hone", "Stopper",
    "Ready", "Present", "Initiator", "Truth", "Seen", "Dumptruck", "Rally",
    "Wheels", "Witty", "Osiris", "Thoth", "Gringo", "Groper", "Vaseline",
    "Vale", "Vigor", "Drain", "Xen", "Zit", "Queen", "Quake", "Dear", "Fence",
    "Servitude", "Feline", "Nimbus", "Cause", "Effect"
}

PLUGIN.femalenamesfirst = {
    "Belinda", "Tanya", "Tara", "Imojen", "Tatiana", "Julie", "Vera", "Maria",
    "Olka", "Olga", "Olina", "Julia", "Michelle", "Vasilisa", "Les", "Zina",
    "Zinka", "Lena", "Lenka", "Saraya", "Svetlana", "Janka", "Marinka",
    "Anzhelka", "Ira", "Alice", "Lyssa", "Oksana", "Xenia", "Ivanka", "Zara",
    "Inna", "Inca", "Olesya", "Kara", "Daria", "Gordana", "Aliza", "Alana",
    "Alyonushka", "Kate", "Katka", "Katyusha", "Katya", "Verka", "Cass",
    "Natalia", "Barbara", "Jade", "Lola", "Selena", "Lara", "Diana", "Andrea",
    "Odessa", "Anita", "Martha", "Karina", "Nicki", "Kira", "Clera", "Cleo",
    "Jeanne", "Zhanka", "Freja", "Leah", "Marina", "Mariana", "Jessi", "Zarina",
    "Tamara", "Tamarka", "Nina", "Elena", "Marta"
}

PLUGIN.femalenameslast = {
    "Zombabe", "Lala", "Feminist", "Huntress", "Esmerelda", "Harlequin",
    "Cleopatra", "Bad Mare", "Lucille", "Lass", "Countess", "Dollface",
    "Double-D", "Lipstick", "Dainty", "Makeup", "Empress", "Blondie",
    "Boss Bitch", "Lady Luck", "Princess", "Ink Girl", "Warmaiden", "Diva",
    "Dudette", "Vixen", "Zelda", "Gabriella", "Moonie", "Black Widow",
    "Angel Eyes", "Dick-Snapper", "Ball-Buster", "Scarlett", "Crimson Queen",
    "Xena", "Maddame", "Shakira", "Foxy", "Hot Mess", "The Dame", "Damsel",
    "Mermaid", "Powerpuff", "Hooters", "Birth Controller", "Chicka", "Lady",
    "Dutchess", "Dreadbabe", "Judge Judy", "Giantess", "Tiara", "The Babe",
    "Amazoness", "No Boys", "Bella", "Wolf Queen", "Maid", "Lovenote",
    "Death Kiss", "Heart-Shaped", "Daisy Duke", "Trixy", "Warwoman", "Whoracle",
    "Wonder Woman", "Lassie", "Prettyface", "Man Killer", "Maneater",
    "Tatt Babe", "Lassassin", "Babycakes", "Joan of Arc"
}

PLUGIN.banditnameslast = {
    "Thrash", "Scavenger", "Thief", "Vile", "Flayer", "Villain", "Bully",
    "Rubbish", "Scum", "Scumbag", "Filth", "Rotten", "Desperate", "Nasty",
    "Mean", "Heinous", "Hound", "Scalper", "Skullsmash", "Ripper", "Clot",
    "Thrasher", "Daredevil", "Squid", "Sleaze", "Poker", "Addict", "Meth",
    "Cigar", "Slayer", "Skid", "Smear", "Pain", "Ratbag", "Pig", "Avarice",
    "Mistake", "Roadrash", "Smasher", "Gasher", "Opportunist", "Ruse", "Snide",
    "Sly", "Faceoff", "Bloodshot", "Hallows", "Gallows", "Danger", "Rustbucket",
    "Artery", "Bruiser", "Basher", "Trainwreck", "Guts", "Violence", "Vicious",
    "Arrogance", "Blister", "Wart", "Sick", "Raider", "Carver", "Underdog",
    "Goon", "Ashtray", "Alcoholic", "Disease", "Plague", "Anthrax", "Cinder",
    "Stoker", "Guilty", "Stealer", "Badman", "Destruction", "Trapper", "Liar",
    "Limp", "Orifice", "Wound", "Devildust", "Vamp", "Blood", "Uneasy",
    "Deadswitch", "Redblade", "Dagger", "Blackheart", "Blackbeard",
    "Silvertongue", "Coppermouth", "Diamondeye", "Strange", "Hopeless",
    "Roadkill", "Slender", "Gawker", "Puke", "Putrid", "Banished", "Blackfire",
    "Killsalot", "Squeal", "Twistknife", "Vengeance", "Redwood", "Rash",
    "Rabies", "Trickster", "Eyegauge", "Stalk", "Deaddrop", "Pale", "Wrong",
    "Stupid", "Kneebone", "Shudder", "Faker", "Deadeye", "Slitter", "Sadistic",
    "Miserable", "Nimrod", "Pillager", "Plunder", "Convict", "Offender",
    "Tracks", "Dustbowl", "Graveyard", "Tombstone", "Freak", "Tamper", "Fraud",
    "Manic", "Desolate", "Forger", "Breaker", "Bossy", "Hostile", "Arsonist",
    "Atrocious", "Axe", "Barbarian", "Syndicate", "Butcher", "Brown Nose",
    "Cheat", "Choker", "Chopper", "Coffin", "Coma", "Comatose", "Conman",
    "Crazy", "Crooked", "Crowbar", "Cutter", "Deadbeat", "Gangster", "Thug",
    "Goblin", "Grinch", "Gouge", "Gremlin", "Grudge", "Guerilla", "Harsh",
    "Hook", "Joker", "Kamikaze", "Knuckles", "Lucky Bastard", "Maggots",
    "Maniac", "Moonshine", "Narc", "Necro", "Paranoid", "Pirate", "Prick",
    "Psycho", "Punk", "Raker", "Scoundrel", "Slasher", "Slime", "Snot", "Spike",
    "Strangler", "Toad", "Vandal", "Gangrene", "Germ", "Buster", "Outlaw",
    "Lawless", "Criminal", "Underworld", "Exploit", "Abuser", "Anarchy",
    "Bloodrain", "Illness", "Cough", "Grub", "Skillsplitter", "OG", "Rebel",
    "Extinction", "Purge", "Faceless", "Scream", "Gutter", "Drainpipe",
    "Scallywag", "Rotwood", "Poison", "Acidbath", "Traitor", "Betrayer",
    "Cottonmouth", "One-ear", "One-eye", "Hotrod", "Flea", "Tick", "Tripper",
    "Druggie", "Gross", "Unclean", "Stink", "Menace", "Trouble", "Forsworn",
    "Bentnose", "Crooked-eye", "Bloodbeard", "Vomit", "Roughneck", "Murk",
    "Anubis", "Bane", "Freakout", "Slippery", "Slug", "Decay", "Bandaid",
    "Bulldozer", "Deserter", "Executioner", "Gravemaker", "Gravedigger",
    "Hatchet", "Hitman", "Judge", "Mayhem", "Monster", "Outcast", "Savage",
    "Scythe", "Terminator", "Trasher", "Trigger", "Tyrant", "Undertaker",
    "The End", "Anguish", "Suffering", "Harrow", "Tragedy", "Torment", "Misery",
    "Affliction", "Rogue", "Shredder", "Jury", "Molten", "Leadhead", "Reaper",
    "Grim", "Grunge", "Grime", "Sabotage", "Mauler", "Chomp", "Deathroll",
    "Fury", "Hurt", "Agony", "Wraith", "Banshee", "Pentagram", "Insidious",
    "Inside-Out", "Diablo", "Lucifer", "Omen", "Saul", "Hacksaw", "Chainsaw",
    "Achilles", "Terrible", "Awful", "Scourge", "Blight", "Medusa", "Headshot",
    "Mangler", "Noose", "Splinter", "Fragger", "Blackmail", "Bribe",
    "Doubletap", "Entrapment", "Jailbreak", "Shank", "Shiv", "Bucktooth",
    "Nofear", "Regiment", "Seclude", "Infiltrate", "Net", "Drag", "Staller",
    "Excuse", "Elusive", "Eyeroll", "Banban", "Doom", "Dangle", "Jugular",
    "Juggernaut", "Cannibal", "Hannibal", "Bleach", "Toxin", "Harm", "Bad-day",
    "Monday", "Grey", "Blackhand", "Recluse", "Trapdoor", "Funnelweb", "Prion",
    "Deathjab", "Harlot", "Knockout", "Fear", "Sorrow", "Facemask", "Topple",
    "Papercut", "Hairless", "Hairy", "Loophole", "Curse", "Witch", "Spooker",
    "Prankster", "Dissect", "Dice", "Twinblade", "Bloodlust", "Terrorist",
    "Ghoul", "Gambino", "Blackjack", "Casino", "Roulette", "Draco", "Slither",
    "Husk", "Jeepers", "Creeper", "Lucky-shot", "Eight-ball", "Postal",
    "Half-hand", "Pinkie", "Thumbless", "Limbo", "Purgatory", "Rugged", "Loot",
    "Diehard", "Missing", "Kidnap", "Godfather", "Crabs", "Swordfish",
    "Boltcutter", "Lockpick", "Scatter", "Trip", "Commie", "Sickle", "Abortion",
    "Conflict", "Crosswire", "Barbed", "Razorwire", "Sockmouth", "Nethead",
    "Brainfry", "Tourniquet", "Tweezers", "Dropper", "Lopper", "Lips",
    "Cheekbone", "Dropjaw", "Deepfry", "Burp", "Fart", "Hag", "Haggler",
    "Harass", "Pressure", "Stigma", "Fluke", "Objection", "Tarmac", "Skinner",
    "Fane", "Collector", "Loanshark", "Cap'n", "Arsehat", "Bellows", "Shanty",
    "Barnacle", "Freeloader", "Hitch", "Snagged", "Snapper"
}

PLUGIN.realnameslast = {
    "Zynchuk", "Abdurakhmanov", "Abdurhmanov", "Altynnik", "Andreychuk",
    "Andruschenko", "Aniseyev", "Anisiev", "Bashakov", "Bashmakov", "Baul",
    "Beshevliy", "Beshevly", "Binoev", "Binoyev", "Blinov", "Bobrov",
    "Bogdanov", "Boichenko", "Boiko", "Boldeskul", "Boldskul", "Bondarev",
    "Dotsenko", "Dovgalyuk", "Drozdush", "Dubenchuk", "Dudorov", "Duka",
    "Dumko", "Dunaev", "Dunayev", "Dyklov", "Efremov", "Erofeev", "Erofeyev",
    "Futzin", "Galkin", "Ganzyuk", "Garkovenko", "Garkusha", "Gatsula",
    "Gatzula", "Georgov", "Glebovsky", "Gnatyuk", "Goncharenko", "Gordienko",
    "Gordiyenko", "Gorlevoy", "Gorohin", "Gorokhin", "Goryunov", "Gray",
    "Grebenko", "Grebenyuk", "Grischuk", "Grishachev", "Gritsay", "Gritsayenko",
    "Gritsenko", "Gritzaenko", "Gritzay", "Gritzenkov", "Ischuk", "Kapuka",
    "Kapustyanko", "Katz", "Kazakov", "Kovalchuk", "Koyev", "Kozlov",
    "Kravchenko", "Krivda", "Krivohatsky", "Krivokhatsky", "Kryga", "Kucheruk",
    "Kulchitsky", "Kuntsev", "Kurvits", "Kurvitz", "Kushnarev", "Kushnaryov",
    "Kuzmich", "Kuznetsov", "Kuzyakin", "Lavrik", "Lavrov", "Merzlayev",
    "Merzlyayev", "Milchenko", "Mironyuk", "Mohrer", "Morer", "Morozov",
    "Mostovoi", "Mostovoy", "Muhamedov", "Mukhamedov", "Muntyan", "Myskov",
    "Navrotsky", "Nepritsky", "Nikanorov", "Nikeshin", "Nikulin", "Nordiev",
    "Nordiyev", "Nosan", "Opolev", "Orlevich", "Orlov", "Petkevich", "Petrenko",
    "Petrov", "Plohenko", "Plokhenko", "Podyachev", "Polyanin", "Poplavsky",
    "Popov", "Portnyh", "Portnykh", "Rezun", "Rodnyansky", "Rogoza", "Rotan",
    "Rublev", "Rudik", "Rusanov", "Rychagirsky", "Sabchenko", "Sagitov",
    "Savchenko", "Savchuk", "Scherbin", "Sedyh", "Sedykh", "Sereda",
    "Sidorenko", "Sidorov", "Sinitsyn", "Sinitzyn", "Siniy", "Skameika",
    "Skameyka", "Slutsky", "Smelov", "Smoliy", "Smoly", "Sviridov", "Sykula",
    "Tarnavsky", "Tatarchuk", "Timchuk", "Valentinov", "Vasiliev", "Veselov",
    "Vinogradov", "Zabyagoda", "Zagorodnyuk", "Zaharin", "Zakharin",
    "Zamosenchuk", "Zarubin", "Zhabenko", "Zhmiyev", "Zhmyev", "Zhurakovsky",
    "Zinoviev", "Zolotar", "Zonovyev", "Zozo", "Zubarev", "Zubkov",
    "Zvonnitsky", "Abramova", "Adamenko", "Afanasev", "Alekseev", "Alekseeva",
    "Andreev", "Andreeva", "Andrienko", "Andriychuk", "Androschuk",
    "Androshchuk", "Andrushchenko", "Andryenko", "Andryichuk", "Andryuschenko",
    "Andryushchenko", "Antonenko", "Antonov", "Antonova", "Antonyuk",
    "Artemenko", "Artyukh", "Avramenko", "Babak", "Babenko", "Babiy", "Babych",
    "Belik", "Beliy", "Belous", "Belousov", "Belousova", "Belov", "Belova",
    "Belyaev", "Belyaeva", "Belyi", "Belyk", "Bereza", "Berezhnaia",
    "Berezhnaya", "Berezhnoi", "Berezhnoy", "Berezovskaia", "Berezovskaya",
    "Berezovsky", "Berezovskyi", "Berezyuk", "Bigun", "Bikov", "Bikova",
    "Golovko", "Golub", "Golubenko", "Gonchar", "Goncharov", "Goncharova",
    "Goncharuk", "Gontar", "Gorbach", "Gorban", "Gorbatyuk", "Gorbenko",
    "Gorbunova", "Gordiychuk", "Gorobets", "Gumenyuk", "Gura", "Gurin", "Gusak",
    "Gusev", "Guseva", "Guz", "Haidai", "Haiduk", "Halchenko", "Halushka",
    "Halushko", "Hanzha", "Harbuz", "Harkusha", "Harmash", "Havrylenko",
    "Havrylov", "Havrylova", "Havrylyuk", "Havrysh", "Herashchenko", "Hlushko",
    "Hnatenko", "Horbenko", "Horbunova", "Hordyenko", "Hordyichuk", "Horobets",
    "Hrebenyuk", "Hryb", "Hryhorchuk", "Hryhorenko", "Hryhorev", "Hryhoreva",
    "Hryn", "Hrynchenko", "Hrynchuk", "Hrynenko", "Hrynko", "Huk", "Humenyuk",
    "Hunko", "Hura", "Huryn", "Husak", "Husev", "Huseva", "Huz", "Iakovenko",
    "Ilchenko", "Ilchuk", "Ilin", "Ilina", "Ilnitskaya", "Isaeva", "Ischenko",
    "Ivanchenko", "Ivanchuk", "Ivanenko", "Ivanitskaya", "Ivanova",
    "Kalashnikova", "Kalashnyk", "Kalashnykova", "Kalinichenko", "Kalinin",
    "Kalinina", "Kalynychenko", "Kalynyn", "Kalynyna", "Kalyuzhnaia",
    "Kalyuzhnaya", "Kalyuzhniy", "Kalyuzhnyi", "Kaminska", "Kaminsky",
    "Kamynska", "Kamynskyi", "Kardash", "Karnaukh", "Karpenko", "Karpov",
    "Karpova", "Karpyuk", "Kasian", "Kasianenko", "Kasyan", "Kasyanenko",
    "Kharchenko", "Khimich", "Khizhnyak", "Khmel", "Kiyashko", "Klimchuk",
    "Klimov", "Klimova", "Klochko", "Klymchuk", "Klymenko", "Klymov", "Klymova",
    "Knish", "Knysh", "Kobets", "Kobzar", "Kogut", "Kolesnykova", "Koliada",
    "Kolisnichenko", "Kolisnik", "Kolodiy", "Kolodyi", "Kolomiets", "Kolomoets",
    "Kolomyets", "Kolyada", "Kolysnychenko", "Kolysnyk", "Komar", "Komarov",
    "Komarova", "Korniychuk", "Kornyenko", "Kornyichuk", "Korobka", "Korol",
    "Korolev", "Koroleva", "Korsun", "Korzh", "Kosenko", "Kostenko", "Kostik",
    "Kostina", "Kostiv", "Kostyk", "Kostyna", "Kostyuchenko", "Kostyuk",
    "Kostyv", "Kot", "Kotenko", "Kotik", "Kotliar", "Kotlyar", "Kotov",
    "Kotova", "Kotsyuba", "Kotyk", "Kovach", "Koval", "Kovalenko", "Kovalev",
    "Kovaleva", "Kovalskaia", "Kovalskaya", "Kovalskiy", "Kovalskyi", "Kovtun",
    "Kozachek", "Kozachenko", "Kozachuk", "Kozak", "Kozel", "Kozir", "Kozlenko",
    "Kozlova", "Kozlovskaia", "Kozlovskaya", "Kozlovskiy", "Krivenko",
    "Krivonos", "Kucher", "Kucherenko", "Kuchma", "Kuzyk", "Kvasha", "Kyiashko",
    "Kyrychenko", "Kyryenko", "Kyrylenko", "Kyrylyuk", "Kyselev", "Kyseleva",
    "Kysyl", "Kyt", "Lavrenyuk", "Lavrinenko", "Lavryk", "Lavrynenko",
    "Lazarenko", "Lazareva", "Lebed", "Lebedev", "Lebedeva", "Leonov",
    "Leonova", "Leschenko", "Leshchenko", "Lesik", "Lesyk", "Levchenko",
    "Levchuk", "Levitskaya", "Levitskiy", "Levytskaia", "Levytskyi", "Liakh",
    "Liashenko", "Liashko", "Limar", "Linnik", "Lisak", "Lischuk", "Lisenko",
    "Lisovaya", "Lisyuk", "Litovchenko", "Litvinchuk", "Litvinenko", "Lynnyk",
    "Lysak", "Lysenko", "Lyshchuk", "Lysovaia", "Lysyuk", "Lytovchenko",
    "Lytvyn", "Lytvynchuk", "Lytvynenko", "Lytvynov", "Lytvynova", "Lyubchenko",
    "Maiboroda", "Maistrenko", "Makarchuk", "Makarov", "Maksymchuk",
    "Maksymenko", "Maksymov", "Maksymova", "Malaia", "Malaya", "Malik",
    "Malinovskaya", "Maliy", "Maltseva", "Malyi", "Malyk", "Malynovskaia",
    "Manko", "Marchenko", "Marchuk", "Markevich", "Markevych", "Markov",
    "Markova", "Martinenko", "Martinov", "Martinova", "Martinyuk", "Martsenyuk",
    "Martynenko", "Martynov", "Martynova", "Martynyuk", "Maruschak",
    "Marushchak", "Maslov", "Maslova", "Matsyuk", "Matveev", "Matveeva",
    "Matvienko", "Matviychuk", "Matvyenko", "Matvyichuk", "Mayboroda",
    "Maystrenko", "Mazur", "Mazurenko", "Medved", "Medvedev", "Medvedeva",
    "Melnichenko", "Melnichuk", "Melnik", "Melnikov", "Melnikova",
    "Melnychenko", "Melnychuk", "Melnyk", "Melnykov", "Melnykova", "Mikhalchuk",
    "Mikhaylenko", "Mikhaylichenko", "Mikhaylov", "Mikhaylova", "Mikhaylyuk",
    "Mikitenko", "Mikityuk", "Mironchuk", "Mironenko", "Mironov", "Mironova",
    "Miroshnichenko", "Miroshnik", "Mischenko", "Mischuk", "Misyura",
    "Moiseenko", "Molchanova", "Momot", "Morgun", "Morhun", "Moroz", "Morozova",
    "Mosiychuk", "Moskalenko", "Moskalyuk", "Mosyichuk", "Movchan", "Moyseenko",
    "Mukha", "Muntian", "Musienko", "Musyenko", "Muzichenko", "Muzika",
    "Muzychenko", "Muzyka", "Mykhailenko", "Mykhailov", "Mykhailova",
    "Mykhailychenko", "Mykhailyuk", "Mykhalchuk", "Mykytenko", "Mykytyuk",
    "Myronchuk", "Myronenko", "Myronov", "Myronova", "Myronyuk",
    "Myroshnychenko", "Myroshnyk", "Myshchenko", "Myshchuk", "Mysyura",
    "Nagornaya", "Nagorniy", "Nahornaia", "Naumova", "Nazarchuk", "Nazarenko",
    "Nazarov", "Nazarova", "Nechai", "Nechay", "Nechiporenko", "Nechiporuk",
    "Nechyporenko", "Nechyporuk", "Nesterenko", "Novak", "Novik", "Novikov",
    "Novikova", "Novitskaya", "Novitskiy", "Novosad", "Novyk", "Novykov",
    "Novykova", "Novytskaia", "Novytskyi", "Nykolaenko", "Nykolaev",
    "Nykolaeva", "Nykolaichuk", "Nykolenko", "Nykytenko", "Nykytyn", "Nykytyna",
    "Nykytyuk", "Nyzhnyk", "Ogorodnik", "Ohorodnyk", "Okhrimenko", "Okhrymenko",
    "Oleinyk", "Oleksyuk", "Oleynik", "Oliynik", "Olyinyk", "Omelchenko",
    "Omelchuk", "Onischenko", "Onischuk", "Onoprienko", "Onopryenko",
    "Onyshchenko", "Onyshchuk", "Opanasenko", "Orel", "Orlova", "Osadcha",
    "Osadchiy", "Osadchuk", "Osadchyi", "Osipchuk", "Osipenko", "Osipov",
    "Osipova", "Ostapchuk", "Ostapenko", "Ostrovskaia", "Ostrovskaya",
    "Ostrovsky", "Ostrovskyi", "Osypchuk", "Osypenko", "Panasyuk", "Panchenko",
    "Panchuk", "Pankiv", "Pankyv", "Parkhomenko", "Paschenko", "Pasechnik",
    "Pasechnyk", "Pashchenko", "Pasko", "Pastukh", "Pastushenko", "Pavlenko",
    "Pavlik", "Pavlov", "Pavlova", "Pavlovskaia", "Pavlovskaya", "Pavlovsky",
    "Pavlovskyi", "Pavlyk", "Pavlyuchenko", "Pavlyuk", "Pelikh", "Pelykh",
    "Perepelitsa", "Perepelytsa", "Petrichenko", "Petrik", "Petrishin",
    "Petriv", "Petrova", "Petrovskaia", "Petrovskaya", "Petrovskiy",
    "Petrovskyi", "Petruk", "Petrychenko", "Petryk", "Petryshyn", "Petryv",
    "Pilipchuk", "Pilipenko", "Pinchuk", "Pisarenko", "Piskun", "Piven",
    "Pivovar", "Pogrebnyak", "Pohrebniak", "Poliakov", "Popovych", "Potapenko",
    "Potapova", "Priadko", "Prikhodko", "Primak", "Prischepa", "Prisyazhnyuk",
    "Pritula", "Priymak", "Prodan", "Prokhorenko", "Prokopchuk", "Pryadko",
    "Pryimak", "Prykhodko", "Prymak", "Pryshchepa", "Pysarenko", "Pyskun",
    "Pyven", "Pyvovar", "Radchenko", "Rak", "Redko", "Reshetniak", "Reshetnyak",
    "Reva", "Reznichenko", "Reznik", "Reznychenko", "Reznyk", "Riabchenko",
    "Riabokon", "Ribak", "Ribalchenko", "Ribalka", "Ribalko", "Roman",
    "Romanchenko", "Romanchuk", "Romanenko", "Romaniv", "Romanov", "Romanova",
    "Romanyuk", "Romanyv", "Rozhko", "Ruban", "Rud", "Rudaia", "Rudaya",
    "Rudenko", "Rudyk", "Rusin", "Rusnak", "Rusyn", "Ryabchenko", "Ryabokon",
    "Rybak", "Rybalchenko", "Rybalka", "Rybalko", "Saenko", "Sakhno", "Salo",
    "Samoilenko", "Samoilova", "Samoylenko", "Samoylova", "Savenko",
    "Savitskaya", "Savitskiy", "Savka", "Savytskaia", "Savytskyi", "Scherbak",
    "Scherbakov", "Scherbakova", "Scherban", "Scherbina", "Schur", "Sobko",
    "Sobol", "Solohub", "Solovei", "Solovev", "Soloveva", "Solovey", "Solyanik",
    "Soroka", "Sorokina", "Sorokyn", "Sorokyna", "Sova", "Spivak", "Spyvak",
    "Stadnik", "Stadnyk", "Stasyuk", "Stelmakh", "Stepanenko", "Stepanov",
    "Stepanova", "Stepanyuk", "Stetsenko", "Stetsyuk", "Stoliar", "Stolyar",
    "Storozhenko", "Storozhuk", "Strelets", "Struk", "Stupak", "Sulima",
    "Sulyma", "Suprun", "Sushko", "Sviridenko", "Svistun", "Svyrydenko",
    "Svystun", "Sych", "Sydor", "Sydorchuk", "Sydorenko", "Sydorov", "Sydorova",
    "Sydoruk", "Symonenko", "Synytsa", "Syrenko", "Syrota", "Syryk", "Sytnyk",
    "Syvak", "Taran", "Taranenko", "Tarasenko", "Tarasov", "Tarasova",
    "Tarasyuk", "Tereschenko", "Tereschuk", "Tereshchenko", "Tereshchuk",
    "Teslenko", "Tikhonova", "Timchenko", "Timofeev", "Timofeeva", "Timoschuk",
    "Timoshenko", "Tischenko", "Titarenko", "Titov", "Titova", "Tkach",
    "Tkachenko", "Tkachev", "Tkacheva", "Tkachuk", "Tokar", "Tokareva",
    "Topchiy", "Topchyi", "Trachuk", "Tretiak", "Tretyak", "Trigub",
    "Trofimchuk", "Trofimenko", "Trofymchuk", "Trofymenko", "Troian",
    "Trotsenko", "Troyan", "Trush", "Tryhub", "Tsarenko", "Tsiganok", "Tsimbal",
    "Tsimbalyuk", "Tsurkan", "Tsyhanok", "Tsymbal", "Tsymbalyuk", "Turchin",
    "Turchyn", "Tverdokhleb", "Tykhonova", "Tymchenko", "Tymchuk", "Tymofeev",
    "Tymofeeva", "Tymoshchuk", "Tymoshenko", "Tyshchenko", "Tytarenko", "Tytov",
    "Tytova", "Tyutyunnik", "Tyutyunnyk", "Udovichenko", "Udovychenko",
    "Ukrainets", "Ukraynets", "Usenko", "Ushakova", "Usik", "Ustimenko",
    "Ustymenko", "Usyk", "Vakulenko", "Vaschenko", "Vaschuk", "Yanchuk",
    "Yarema", "Yaremchuk", "Yaremenko", "Yarmolenko", "Yarosh", "Yaroshenko",
    "Yvanov", "Yvanova", "Yvanytskaia", "Yvanyuk", "Yvashchenko", "Yvasyuk",
    "Yvchenko", "Zabolotniy", "Zabolotnyi", "Zadorozhnaia", "Zadorozhnaya",
    "Zadorozhniy", "Zadorozhnyi", "Zaets", "Zagoruyko", "Zahoruiko", "Zaiats",
    "Zaichenko", "Zaika", "Zaitsev", "Zaitseva", "Zakharchenko", "Zakharchuk",
    "Zakharov", "Zakharova", "Zaporozhets", "Zavgorodnyaya", "Zavhorodniaia",
    "Zayats", "Zaychenko", "Zayka", "Zaytsev", "Zaytseva", "Zelenskaia",
    "Zelenskaya", "Zelinskaya", "Zelynskaia", "Zhelezniak", "Zheleznyak",
    "Zhuk", "Zhukov", "Zhukova", "Zhuravel", "Zhuravlev", "Zhuravleva",
    "Zhurba", "Zinchenko", "Zinchuk", "Zozulia", "Zozulya", "Zub", "Zubenko",
    "Zubko", "Zvarich", "Zvarych", "Zynchenko"
}

PLUGIN.mercnamesfirst = {
    "Wild", "Cunning", "Amber", "Rabid", "Crawling", "Assault", "Gray",
    "Liquid", "Raging", "Prowling", "Ashen", "Gray", "Charging", "Growling",
    "Bitter", "Mad", "Flaming", "Black", "Howling", "Master", "Flying",
    "Bastard", "Razor", "Spitting", "Sadistic", "Stone", "Strange", "Revolver",
    "Running", "Scowling", "Praying", "Tactical", "Brass", "Dire", "Armored",
    "Biting", "Dizzy", "Stalking", "Vengeful", "Lost", "Panzer", "Vampire",
    "Phantom", "Laughing", "Northern", "Spying", "Seething", "Lonely", "Old",
    "Shadow", "Raving", "Frantic", "Hulking", "Bloody", "Poison", "Pouncing",
    "Eastern", "Ranger", "Thunder", "Machinegun", "Southern", "Western",
    "Decoy", "Smoking", "Hunting", "Vile", "Frigid", "Master", "Hungry",
    "Sadistic", "Devil", "Nuclear", "Solid", "Greedy", "Intelligent", "Crystal",
    "Iron", "Pouncing", "Fat", "Solidus", "Broken", "White", "Punching",
    "Naked", "Copper", "Creeping", "Psycho", "Sniper", "Diamond", "Brutal",
    "Crimson", "Silent", "Hissing", "Venom", "Poisonous", "Rogue", "Stubborn",
    "Metal", "Growling", "Sly", "Sinister", "Golden", "Sad", "Happy", "Frozen",
    "Maroon", "Blue", "Green", "Violet", "Rainbow", "Radiant", "Dark", "Evil",
    "Curious", "Savage", "Massive", "Tiny", "Little", "Big", "Thorned",
    "Unknown", "Crouching", "Weak", "Strong", "Swift", "Sharp", "Shiny", "Rare",
    "Unwanted", "Cross-eyed", "Glitter", "Ghost", "Molten", "Glacial",
    "Galvanized", "Unbreakable", "Stressed", "Limping", "Spirit", "Resurrected",
    "Dead", "Bone", "Silver", "Bronze", "Amethyst", "Water", "Fire", "Grassy",
    "Bright", "Dull", "Skinny", "Obese", "Toxic", "Rampaging", "Ancient",
    "Mystical", "Extinct", "The Last", "The First", "Wounded", "Lone", "Carbon",
    "Paper", "Wooden", "Peaceful", "Fearless", "Heroic", "Brave", "Brawny",
    "Charcoal", "Cobalt", "Fierce", "Beaten", "Berserk", "Blind", "Mossy",
    "Killer", "Lethal", "Robotic", "Skeletal", "Hidden", "Stone", "Ethereal",
    "Mechanized", "Rubber", "Glass", "Digital", "Pale", "Double-Headed", "Sand",
    "Gravel", "Snow", "Ice", "Mutated", "Kevlar", "Frenzied", "Turqoise",
    "Cyan", "Faceless", "Black-eyed", "Blue-eyed", "Menacing", "Zombified",
    "Red-eyed", "Posessed", "Shimmering", "Scaly", "Spiky", "Blazing",
    "Awakened", "Sleepy", "Noisy", "Playful", "Radioactive", "Contaminated",
    "Cruel", "Ascended", "Microscopic", "Plushie", "Legendary", "Mythical",
    "Translucent", "Opaque", "Transparent", "Apparitional", "Imaginary"
}

PLUGIN.mercnameslast = {
    "Moth", "Cobra", "Hog", "Jaguar", "Dingo", "Iguana", "Octopus", "Turtle",
    "Scorpion", "Husky", "Falcon", "Rat", "Mongoose", "Mosquito", "Markhor",
    "Moose", "Gorilla", "Ox", "Duck", "Ram", "Rabbit", "Jackal", "Eel", "Pig",
    "Orca", "Centipede", "Hedgehog", "Camel", "Quokka", "Elk", "Bison", "Roach",
    "Dugong", "Squirrel", "Koala", "Panda", "Osprey", "Baboon", "Whale",
    "Shark", "Heron", "Armadillo", "Frog", "Worm", "Horse", "Salamander",
    "Rhino", "Hippo", "Wasp", "Mastiff", "Tuna", "Eagle", "Hyena", "Goat",
    "Chicken", "Piranha", "Leopard", "Gibbon", "Vulture", "Jellyfish",
    "Lobster", "Butterfly", "Tiger", "Dolphin", "Harrier", "Crocodile", "Gecko",
    "Hippo", "Bluebird", "Tortoise", "Crane", "Cat", "Stallion", "Firefly",
    "Chameleon", "Platypus", "Tarantula", "Bee", "Peccay", "Ocelot", "Monkey",
    "Badger", "Bat", "Fly", "Mammoth", "Fox", "Slug", "Crow", "Toad", "Panther",
    "Bear", "Seal", "Agama", "Emu", "Tengu", "Sloth", "Cougar", "Raptor",
    "Mantis", "Spider", "Anaconda", "Swan", "Canine", "Axolotl", "Buffalo",
    "Ape", "Raven", "Buzzard", "Gull", "Lion", "Dragon", "Phantom", "Wolf",
    "Mustang", "Coyote", "Parrot", "Doberman", "Aardvark", "Snake", "Bull",
    "Hornet", "Basilisk", "Python", "Swallow", "Beetle", "Ant", "Elephant",
    "Ray", "Rooster", "Giraffe", "Viper", "Pigeon", "Hawk", "Llama", "Kangaroo",
    "Barracuda", "Gazelle", "Capybara", "Werewolf", "Owl", "Wallaby", "Crab",
    "Deer", "Boa", "Zebra", "Marlin", "Hound", "Lynx", "Swine", "Lizard",
    "Shepherd", "Alligator", "Antelope", "Beaver", "Boar", "Dog", "Commodore",
    "Dinosaur", "Ferret", "Gopher", "Grasshopper", "Hamster", "Hare", "Shrimp",
    "Sparrow", "Stag", "Fish", "Bulldog", "Carp", "Yak", "Wombat", "Wildebeast",
    "Weasel", "Walrus", "Termite", "Tapir", "Starfish", "Squid", "Sheep",
    "Quail", "Porcupine", "Penguin", "Mouse", "Owl", "Meerkat", "Sabertooth",
    "Locust", "Impala", "Bobcat", "Hydra", "Unicorn", "Chimera", "Griffin",
    "Centaur", "Yeti", "Imp", "Troll", "Manticore", "Ogre", "Cyclops"
}

PLUGIN.econameslast = {
    "Gamma", "Fusion", "Greenthumb", "Gatherer", "Energy", "Natural",
    "Sunshine", "Summer", "Winter", "Autumn", "Spring", "Seasons", "Sanctuary",
    "Solitude", "Humble", "Offspring", "Sentient", "Signal", "Towerman",
    "Radio", "Swampass", "Nutrition", "Cloudy", "Weatherman", "Generator",
    "Rejuvenate", "Lifebloom", "Blossom", "Harp", "Essence", "Technician",
    "Leafy", "Grassman", "Greenfield", "Treetrunk", "Swampy", "Mudblood",
    "Balance", "Lush", "Mountain", "Hillman", "Fertilizer", "Oxygen",
    "Emission", "Brightly", "Saviour", "Pines", "Rain", "Future", "Teacher",
    "Universe", "Health", "Heart", "Crisp", "Tinker", "Brains", "Process",
    "Cycle", "Flute", "Dream", "Sugarcane", "Planter", "Forest", "Wilderman",
    "Wetboots", "Marshmellow", "Wave", "Neuro", "Synapse", "Palm", "Willow",
    "Venture", "Amnesty", "Gulf", "Orion", "Galaxy", "Milkyway", "Wisp",
    "Firefly", "Nightwatch", "Nightingale", "Seeds", "Potter", "Cactus", "Bio",
    "Marine", "Camper", "Tentacle", "Earwig", "Animal", "Safe", "Lumen",
    "Light", "Reagent", "Alchemy", "Wanderlust", "Moss", "Fielder", "Source",
    "Sector", "Pearl", "Bark", "Branch", "Day", "Coast", "Arctic", "Island",
    "Meadow", "Country", "Bird", "Song", "Fishy", "Shrubs", "Fungus", "Snow",
    "Ice", "Eco", "Greeny", "Grain", "Indigo", "Cyan", "Love", "Rose", "Sand",
    "Vitamin", "Foodie", "Insect", "Sesame", "Breath", "Calm", "Beginner",
    "Easy", "Chillax", "Relax", "Peace", "Purity", "Whole", "Helper", "Heals",
    "Support", "Union", "Goodguy", "Warmth", "Harvest", "Yellow", "Orange",
    "Pink", "Wood", "Stick", "Aurora", "Aura", "Ambassador", "Avalanche",
    "Brainiac", "Breeder", "Bubble", "Bush", "Chemist", "Coder", "Cosmos",
    "Diplomat", "Feather", "Geologist", "Grass", "Halo", "Healer", "Honest",
    "Hybrid", "Isotope", "Microbe", "Moss", "Muddy", "Native", "Oxygen",
    "Seed", "Sapling", "Reign", "Desert", "Beach", "Instinct", "Radiance",
    "Illuminate", "Luminance", "Darkwood", "Osmosis", "Propagate", "Schumann",
    "Resonance", "Vivid", "Bloom", "Dense", "Budding", "Arid", "Breeze",
    "Hedge", "Herb", "Bamboo", "Fern", "Reed", "Mushroom", "Tomato", "Stem",
    "Twig", "Maple", "Oak", "Birch", "Poplar", "Gardener", "Shovel", "Pail",
    "Shears", "Sow", "Mow", "Wheelbarrow", "Shed", "Bay", "Lake", "Sea",
    "Riptide", "Creek", "Waterfall", "Canyon", "Glacier", "Plain", "Marsh",
    "Tundra", "Bedrock", "Gem", "Fossil", "Erosion", "Limestone", "Sediment",
    "Metamorph", "Lava", "Volcano", "Eruption", "Tsunami", "Fuel", "Magma",
    "Atmosphere", "Atom", "Atomic", "Nuclear", "Nucleus", "Neutron", "Proton",
    "Particle", "Ozone", "Dioxide", "Ecosystem", "Habitat", "Extinction",
    "Greenhouse", "Resource", "Drought", "Thaw", "Silt", "Hinterland", "Marrow",
    "Hearth", "Existence", "Physical", "Progress", "Positive", "Cloud", "Atlas",
    "Alkaline", "Antacid", "Crust", "Core", "Share", "Kinsman", "Honour",
    "Modest", "Policy", "Elect", "Sway", "Wick", "Candle", "Fruits", "Flowers",
    "Scale", "Archive", "Stratosphere", "Sphere", "Rhomboid", "Genesis",
    "Gizmo", "Tweak", "Tamper", "Techy", "Solder", "Rose", "Result", "Resolute",
    "Time", "Space", "Flux", "Equalizer", "Foundation", "Bundle", "Glow",
    "Soil", "Outdoors", "Clean", "Birth", "Nature", "Willing", "Insight",
    "Oracle", "Medium", "Gnosis", "Astral", "Projec", "Logbook", "Journal",
    "Evolve", "Evolution", "Empathy", "Feels", "Change", "Slate", "Broad",
    "Pure", "Purse", "Protector", "Preserver", "Conserver", "Conservation",
    "Warden", "Beekeeper", "Honey", "Stargaze", "Satellite", "Asteroid",
    "Comet", "Icewind", "Parks", "Ecology", "Environment", "Ranger", "Land",
    "Fruition", "Lilly", "Lotus", "Beehive", "Listener", "Wavelength",
    "Wiretap", "Bliss", "Exquisite", "Experiment", "Test-tube", "Researcher",
    "Scientist", "Educator", "Study", "Sample", "Sequence", "Fog", "Mist",
    "Ambience", "Aphex", "Tasker", "Notepad", "Script", "Decimal", "Math",
    "Ratio", "Cherry", "Remedy", "Herbal", "Nurse", "Kind", "Channel", "Keeper",
    "Leader", "Courage", "Canopy", "Treetop", "Treehouse", "Hammock", "Giver",
    "Belief", "Faith", "Ivy", "Vine", "Archer", "Mend", "Planner", "Mind",
    "Calm", "Hugs", "Flare", "Frequency", "Report", "Guide", "Memory", "Medic",
    "Intel", "Graph", "Caretaker", "Patrol", "Wader", "Blueboots", "Radsoup",
    "Yardking", "Redwood", "Sound", "Assurance", "Refill", "Hot", "Cooler",
    "Kindle", "Safety", "Harness", "Cruise", "Setup", "Justice", "Polaris",
    "Pegs", "Floaty", "Bouncy", "Pattern", "Cog", "Gear", "Plugs", "Tron"
}

PLUGIN.LonerVoice1 = {}
PLUGIN.LonerVoice2 = {}
PLUGIN.LonerVoice3 = {}

PLUGIN.BanditVoice1 = {}
PLUGIN.BanditVoice2 = {}
PLUGIN.BanditVoice3 = {}
PLUGIN.DutyVoice1 = {}

PLUGIN.DutyVoice2 = {}
PLUGIN.DutyVoice3 = {}

PLUGIN.ArmyVoice1 = {}
PLUGIN.ArmyVoice2 = {}

PLUGIN.FreedomVoice1 = {}
PLUGIN.FreedomVoice2 = {}

PLUGIN.MercVoice1 = {}
PLUGIN.MercVoice2 = {}
PLUGIN.MercVoice3 = {}

for i = 1, 31, 1 do
    PLUGIN.LonerVoice1[i] =
        "characters_voice/human/stalker_1/states/idle/idle_" .. i .. ".ogg"
    PLUGIN.LonerVoice2[i] =
        "characters_voice/human/stalker_2/states/idle/idle_" .. i .. ".ogg"
    PLUGIN.LonerVoice3[i] =
        "characters_voice/human/stalker_3/states/idle/idle_" .. i .. ".ogg"

    PLUGIN.BanditVoice1[i] =
        "characters_voice/human/bandit_1/states/idle/idle_" .. i .. ".ogg"
    PLUGIN.BanditVoice2[i] =
        "characters_voice/human/bandit_2/states/idle/idle_" .. i .. ".ogg"
    PLUGIN.BanditVoice3[i] =
        "characters_voice/human/bandit_3/states/idle/idle_" .. i .. ".ogg"

    PLUGIN.DutyVoice1[i] = "characters_voice/human/dolg_1/states/idle/idle_" ..
                               i .. ".ogg"
    PLUGIN.DutyVoice2[i] = "characters_voice/human/dolg_2/states/idle/idle_" ..
                               i .. ".ogg"
    PLUGIN.DutyVoice3[i] = "characters_voice/human/dolg_3/states/idle/idle_" ..
                               i .. ".ogg"

    PLUGIN.ArmyVoice1[i] =
        "characters_voice/human/military_1/states/idle/idle_" .. i .. ".ogg"
    PLUGIN.ArmyVoice2[i] =
        "characters_voice/human/military_2/states/idle/idle_" .. i .. ".ogg"

    PLUGIN.FreedomVoice1[i] =
        "characters_voice/human/freedom_1/states/idle/idle_" .. i .. ".ogg"
    PLUGIN.FreedomVoice2[i] =
        "characters_voice/human/freedom_2/states/idle/idle_" .. i .. ".ogg"

    PLUGIN.MercVoice1[i] =
        "characters_voice/human/killer_1/states/idle/idle_" .. i .. ".ogg"
    PLUGIN.MercVoice2[i] =
        "characters_voice/human/killer_2/states/idle/idle_" .. i .. ".ogg"
    PLUGIN.MercVoice3[i] =
        "characters_voice/human/killer_3/states/idle/idle_" .. i .. ".ogg"

end

PLUGIN.LonerVoiceCombat1 = {}
PLUGIN.LonerVoiceCombat2 = {}
PLUGIN.LonerVoiceCombat3 = {}
PLUGIN.BanditVoiceCombat1 = {}
PLUGIN.BanditVoiceCombat2 = {}
PLUGIN.BanditVoiceCombat3 = {}
PLUGIN.DutyVoiceCombat1 = {}
PLUGIN.DutyVoiceCombat2 = {}
PLUGIN.DutyVoiceCombat3 = {}
PLUGIN.ArmyVoiceCombat1 = {}
PLUGIN.ArmyVoiceCombat2 = {}
PLUGIN.FreedomVoiceCombat1 = {}
PLUGIN.FreedomVoiceCombat2 = {}
PLUGIN.MercVoiceCombat1 = {}
PLUGIN.MercVoiceCombat2 = {}
PLUGIN.MercVoiceCombat3 = {}

for i = 1, 19, 1 do
    PLUGIN.LonerVoiceCombat1[i] =
        "characters_voice/human/stalker_1/fight/attack/script_attack_" .. i ..
            ".ogg"
    PLUGIN.LonerVoiceCombat2[i] =
        "characters_voice/human/stalker_2/fight/attack/script_attack_" .. i ..
            ".ogg"
    PLUGIN.LonerVoiceCombat3[i] =
        "characters_voice/human/stalker_3/fight/attack/script_attack_" .. i ..
            ".ogg"

    PLUGIN.BanditVoiceCombat1[i] =
        "characters_voice/human/bandit_1/fight/attack/script_attack_" .. i ..
            ".ogg"
    PLUGIN.BanditVoiceCombat2[i] =
        "characters_voice/human/bandit_2/fight/attack/script_attack_" .. i ..
            ".ogg"
    PLUGIN.BanditVoiceCombat3[i] =
        "characters_voice/human/bandit_3/fight/attack/script_attack_" .. i ..
            ".ogg"

    PLUGIN.DutyVoiceCombat1[i] =
        "characters_voice/human/dolg_1/fight/attack/script_attack_" .. i ..
            ".ogg"
    PLUGIN.DutyVoiceCombat2[i] =
        "characters_voice/human/dolg_2/fight/attack/script_attack_" .. i ..
            ".ogg"
    PLUGIN.DutyVoiceCombat3[i] =
        "characters_voice/human/dolg_3/fight/attack/script_attack_" .. i ..
            ".ogg"

    PLUGIN.ArmyVoiceCombat1[i] =
        "characters_voice/human/military_1/fight/attack/script_attack_" .. i ..
            ".ogg"
    PLUGIN.ArmyVoiceCombat2[i] =
        "characters_voice/human/military_2/fight/attack/script_attack_" .. i ..
            ".ogg"

    PLUGIN.FreedomVoiceCombat1[i] =
        "characters_voice/human/freedom_1/fight/attack/script_attack_" .. i ..
            ".ogg"
    PLUGIN.FreedomVoiceCombat2[i] =
        "characters_voice/human/freedom_2/fight/attack/script_attack_" .. i ..
            ".ogg"

    PLUGIN.MercVoiceCombat1[i] =
        "characters_voice/human/killer_1/fight/attack/script_attack_" .. i ..
            ".ogg"
    PLUGIN.MercVoiceCombat2[i] =
        "characters_voice/human/killer_2/fight/attack/script_attack_" .. i ..
            ".ogg"
    PLUGIN.MercVoiceCombat3[i] =
        "characters_voice/human/killer_3/fight/attack/script_attack_" .. i ..
            ".ogg"
end

