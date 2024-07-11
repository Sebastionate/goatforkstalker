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






CAMI.RegisterPrivilege({
	Name = "Helix - Manage CEnts",
    MinAccess = "superadmin"
})

function math.ToMeters( num )
    return num * 0.01905
end

function math.ToSU( num )
    return num * 52.49
end



if (CLIENT) then
    function PLUGIN:GetCharacterName(speaker, chatType)
        if speaker.combatEntity then
            return speaker:Name()
        end
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



PLUGIN.lastnamesnormal =  {
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
    "Gray", "Green", "Grenade", "Great", "Grice", "Grill", "Grinder",
    "Haggler", "Handicapped", "Hangman", "Hardware", "Hardy", "Hatrack",
    "Hawkins", "Head", "Heartthrob", "Hedge", "Herdsman", "Hero", "Highlander",
    "Hipster", "Hireling", "Hoary", "Hobo", "Holey", "Homeboy", "Homebrew",
    "Hunchback", "Icarus", "Ice", "Important", "Indian", "Ink", "Iron",
    "Ironstone", "Iroquois", "Jack", "Jupiter", "Jackstraw", "Jammy", "Janitor",
    "Jerboa", "Jester", "Jiggers", "Jogger", "Joint", "Jumper", "June", "Junk",
    "Kagor", "Karma", "Kaschey", "Key", "Khan", "Kicker", "King", "Knot",
    "Kolobok", "Koschei", "Kutuzov", "Lame", "Lamer", "Lamp", "Lantern", "Law",
    "Lax", "Leary", "Leech", "Legal", "Legalist", "Lemming", "Leshiy",
    "Lifeguard", "Lifesaver", "Little Man", "Loader", "Loaf", "Local", "Lock",
    "Locksmith", "Log Splitter", "Long", "Long John", "Loony", "Loser",
    "Loudmouth", "Loyal", "Luckster", "Lucky", "Machine", "Machinist", "Madera",
    "Magnate", "Major", "Morei", "Manipulator", "Manul", "Marmot", "Martian",
    "Mason", "Matador", "Meany", "Mechanic", "Merchant", "Messenger", "Met",
    "Milkman", "Minepicker", "Miner", "Minesweeper", "Minnow", "Miser",
    "Moderator", "Mohawk", "Monocle", "Moor", "Moody", "Mop", "Moped", "Morel",
    "Motor", "Mountaineer", "Mummer", "Muscleman", "Musket", "Nail", "Napoleon",
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
    "Vampire", "Brood", "Colony", "Griswold", "Reader", "Ironsmith",
    "Basket", "Riggs", "Sail", "Northlane", "Southway", "Flick", "Otto",
    "Kransky", "Jurich", "Child", "Severance", "Heater", "Gant", "Casper",
    "Switch", "Crunk", "Diddy", "Sable", "Pod", "Popper", "Flask", "Rubix",
    "Collider", "Xray", "Kip", "Karage", "Donda", "Ramsey", "Forks", "Sponge",
    "Mill", "Flax", "Caught", "Crossfire", "Trix", "Grease", "Lender", "Looty",
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
