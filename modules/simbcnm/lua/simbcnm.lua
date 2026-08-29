-----------------------------------
-- func: simbcnm
-- desc: takes a bcnm entry item and rolls loot
-----------------------------------
local commandObj = {}

commandObj.cmdprops =
{
    permission = 0,
    parameters = 'i',
}

-- copying loot... not ideal but less intrusive

local loot =
{
    -- BCNM Tails of Woe
    [1] =
    {
        {
            { itemid = 13553, droprate = 150 }, -- blitz Ring
            { itemid =     0, droprate = 850 }, -- Nothing
        },

        {
            { itemid = 13554, droprate = 300 }, -- aegis Ring
            { itemid = 13625, droprate = 200 }, -- tundra mantle
            { itemid = 13238, droprate = 200 }, -- druids rope
            { itemid =     0, droprate = 300 }, -- Nothing
        },

        {
            { itemid = 4896, droprate = 145 }, -- firespirit
            { itemid = 4751, droprate = 165 }, -- erase
            { itemid = 4714, droprate = 140 }, -- phalanx
            { itemid = 4874, droprate = 123 }, -- absorb-str
            { itemid =  788, droprate =  94 }, -- peridot
            { itemid =  792, droprate =  94 }, -- pearl
            { itemid =  772, droprate =  13 }, -- green rock
            { itemid =  811, droprate =  53 }, -- ametrine
            { itemid =  748, droprate =  70 }, -- gold beastcoin
            { itemid =  749, droprate =  50 }, -- mythril beastcoin
            { itemid =  771, droprate =  53 }, -- yellow rock
            { itemid =    0, droprate =   0 }, -- nothing
        },

        {
            { itemid = 4751, droprate = 125 }, -- erase
            { itemid = 4714, droprate = 110 }, -- phalanx
            { itemid = 4874, droprate = 104 }, -- absorb-str
            { itemid =  788, droprate =  94 }, -- peridot
            { itemid =  792, droprate =  94 }, -- pearl
            { itemid =  772, droprate =  53 }, -- green rock
            { itemid =  811, droprate =  73 }, -- ametrine
            { itemid =  748, droprate =  70 }, -- gold beastcoin
            { itemid =  749, droprate =  70 }, -- mythril beastcoin
            { itemid =  771, droprate =  73 }, -- yellow rock
            { itemid =    0, droprate =  94 }, -- nothing
        },

        {
            { itemid = 4896, droprate = 174 }, -- firespirit
            { itemid = 4751, droprate =  16 }, -- vile elixir
            { itemid = 4714, droprate = 114 }, -- icespikes
            { itemid = 4874, droprate = 174 }, -- absorb-str
            { itemid = 4947, droprate = 138 }, -- utsusemi ni
            { itemid =  772, droprate =  18 }, -- green rock
            { itemid =  775, droprate =  18 }, -- black rock
            { itemid =  770, droprate =  17 }, -- blue rock
            { itemid =  769, droprate =  16 }, -- red rock
            { itemid =  774, droprate =  16 }, -- purple rock
            { itemid =  776, droprate =  16 }, -- white rock
            { itemid =  771, droprate =  17 }, -- yellow rock
            { itemid =  773, droprate =  17 }, -- translucent rock
            { itemid = 4172, droprate =  21 }, -- reraiser
            { itemid =  699, droprate =  22 }, -- oak log
            { itemid =  701, droprate =  18 }, -- rosewood log
            { itemid =  748, droprate = 120 }, -- gold beastcoin
            { itemid =  749, droprate = 102 }, -- mythril beastcoin
            { itemid =  792, droprate =  21 }, -- pearl
            { itemid =  798, droprate =  23 }, -- Turquoise
            { itemid =  808, droprate =  19 }, -- Goshenite
            { itemid =  793, droprate =  18 }, -- Black pearl
            { itemid =  815, droprate =  17 }, -- sphene
            { itemid =  790, droprate =  20 }, -- garnet
            { itemid =  811, droprate =  18 }, -- ametrine
            { itemid =    0, droprate =   0 }, -- nothing
        },

        {
            { itemid = 4714, droprate = 87 }, -- icespikes
            { itemid = 4874, droprate = 75 }, -- absorb-str
            { itemid = 4947, droprate = 75 }, -- utsusemi ni
            { itemid =  699, droprate = 80 }, -- oak log
            { itemid =  701, droprate = 97 }, -- rosewood log
            { itemid =  792, droprate = 86 }, -- pearl
            { itemid =  798, droprate = 88 }, -- Turquoise
            { itemid =  808, droprate = 79 }, -- Goshenite
            { itemid =  793, droprate = 93 }, -- Black pearl
            { itemid =  815, droprate = 79 }, -- sphene
            { itemid =  790, droprate = 71 }, -- garnet
            { itemid =  811, droprate = 90 }, -- ametrine
            { itemid =    0, droprate =  0 }, -- nothing
        },
    },

    -- BCNM Dismemberment Brigade
    [2] =
    {
        {
            { itemid = 16684, droprate = 250 }, -- kabrakans_axe
            { itemid = 17190, droprate = 250 }, -- sarnga
            { itemid = 17648, droprate = 250 }, -- dragvandil
            { itemid = 17379, droprate = 250 }, -- hamelin_flute
        },

        {
            { itemid =     0, droprate = 400 }, -- nothing
            { itemid = 13128, droprate = 200 }, -- spectacles
            { itemid = 13403, droprate = 200 }, -- assault_earring
            { itemid = 13555, droprate = 200 }, -- peace_ring
        },

        {
            { itemid =   0, droprate = 200 }, -- nothing
            { itemid = 773, droprate = 200 }, -- translucent_rock
            { itemid = 772, droprate = 200 }, -- green_rock
            { itemid = 771, droprate = 200 }, -- yellow_rock
            { itemid = 774, droprate = 200 }, -- purple_rock
        },

        {
            { itemid = 797, droprate = 100 }, -- painite
            { itemid = 784, droprate = 100 }, -- jadeite
            { itemid = 653, droprate = 100 }, -- mythril_ingot
            { itemid = 652, droprate = 100 }, -- steel_ingot
            { itemid = 810, droprate = 100 }, -- fluorite
            { itemid = 745, droprate = 100 }, -- gold_ingot
            { itemid = 805, droprate = 100 }, -- zircon
            { itemid = 801, droprate = 100 }, -- chrysoberyl
            { itemid = 654, droprate = 100 }, -- darksteel_ingot
            { itemid = 802, droprate = 100 }, -- moonstone
        },

        {
            { itemid =    0, droprate =  900 }, -- nothing
            { itemid = 4175, droprate =  100 }, -- vile_elixir_+1
        },
    },

    -- BCNM Hostile Herbivores
    [4] =
    {
        {
            { itemid =     0, droprate = 50 }, -- Nothing
            { itemid = 13251, droprate = 95 }, -- Ocean Belt
            { itemid = 13254, droprate = 95 }, -- Jungle Belt
            { itemid = 13253, droprate = 95 }, -- Steppe Belt
            { itemid = 13255, droprate = 95 }, -- Desert Belt
            { itemid = 13252, droprate = 95 }, -- Forest Belt
            { itemid = 13256, droprate = 95 }, -- Ocean Stone
            { itemid = 13259, droprate = 95 }, -- Jungle Stone
            { itemid = 13258, droprate = 95 }, -- Steppe Stone
            { itemid = 13260, droprate = 95 }, -- Desert Stone
            { itemid = 13257, droprate = 95 }, -- Forest Stone
        },

        {
            { itemid = 13292, droprate = 64 }, -- Guardians Ring
            { itemid = 13287, droprate = 65 }, -- Kampfer Ring
            { itemid = 13300, droprate = 65 }, -- Conjurers Ring
            { itemid = 13298, droprate = 65 }, -- Shinobi Ring
            { itemid = 13293, droprate = 65 }, -- Slayers Ring
            { itemid = 13289, droprate = 65 }, -- Sorcerers Ring
            { itemid = 13286, droprate = 64 }, -- Soldiers Ring
            { itemid = 13294, droprate = 65 }, -- Tamers Ring
            { itemid = 13296, droprate = 64 }, -- Trackers Ring
            { itemid = 13299, droprate = 65 }, -- Drake Ring
            { itemid = 13290, droprate = 65 }, -- Fencers Ring
            { itemid = 13295, droprate = 65 }, -- Minstrels Ring
            { itemid = 13288, droprate = 64 }, -- Medicine Ring
            { itemid = 13291, droprate = 65 }, -- Rogues Ring
            { itemid = 13297, droprate = 64 }, -- Ronin Ring
            { itemid = 13447, droprate = 30 }, -- Platinum Ring
        },

        {
            { itemid =    0, droprate = 100 }, -- Nothing
            { itemid = 4818, droprate = 176 }, -- Scroll Of Quake
            { itemid = 4902, droprate =  10 }, -- Light Spirit Pact
            { itemid = 4814, droprate = 176 }, -- Scroll Of Freeze
            { itemid = 4719, droprate = 176 }, -- Scroll Of Regen Iii
            { itemid = 4172, droprate =  60 }, -- Reraiser
            { itemid = 4174, droprate =  60 }, -- Vile Elixir
            { itemid = 4621, droprate = 176 }, -- Scroll Of Raise Ii
        },

        {
            { itemid =    0, droprate = 100 }, -- Nothing
            { itemid = 4818, droprate = 176 }, -- Scroll Of Quake
            { itemid = 4902, droprate =  10 }, -- Light Spirit Pact
            { itemid = 4814, droprate = 176 }, -- Scroll Of Freeze
            { itemid = 4719, droprate = 176 }, -- Scroll Of Regen Iii
            { itemid = 4172, droprate =  60 }, -- Reraiser
            { itemid = 4174, droprate =  60 }, -- Vile Elixir
            { itemid = 4621, droprate = 176 }, -- Scroll Of Raise Ii
        },

        {
            { itemid =  895, droprate =  59 }, -- Ram Horn
            { itemid =  700, droprate =  59 }, -- Mahogany Log
            { itemid =  653, droprate = 200 }, -- Mythril Ingot
            { itemid = 1116, droprate =  59 }, -- Manticore Hide
            { itemid =  866, droprate =  90 }, -- Handful Of Wyvern Scales
            { itemid = 1122, droprate =  90 }, -- Wyvern Skin
            { itemid =  703, droprate = 176 }, -- Petrified Log
            { itemid =  654, droprate =  59 }, -- Darksteel Ingot
            { itemid =  859, droprate =  59 }, -- Ram Skin
            { itemid =  746, droprate =  90 }, -- Platinum Ingot
        },

        {
            { itemid =    0, droprate = 100 }, -- Nothing
            { itemid =  895, droprate =  59 }, -- Ram Horn
            { itemid =  700, droprate =  59 }, -- Mahogany Log
            { itemid =  653, droprate = 200 }, -- Mythril Ingot
            { itemid = 1116, droprate =  59 }, -- Manticore Hide
            { itemid =  866, droprate =  90 }, -- Handful Of Wyvern Scales
            { itemid = 1122, droprate =  90 }, -- Wyvern Skin
            { itemid =  703, droprate = 176 }, -- Petrified Log
            { itemid =  654, droprate =  59 }, -- Darksteel Ingot
            { itemid =  859, droprate =  59 }, -- Ram Skin
            { itemid =  746, droprate =  90 }, -- Platinum Ingot
        },
    },

    -- BCNM Carapace Combatants
    [8] =
    {
        {
            { itemid = 894, droprate = 1000 }, -- beetle_jaw
        },

        {
            { itemid = 889, droprate = 1000 }, -- beetle_shell
        },

        {
            { itemid =     0, droprate = 250 }, -- nothing
            { itemid = 15282, droprate = 150 }, -- katana_obi
            { itemid = 15274, droprate = 150 }, -- staff_belt
            { itemid = 15280, droprate = 150 }, -- song_belt
            { itemid = 15272, droprate = 150 }, -- cestus_belt
            { itemid = 15279, droprate = 150 }, -- pick_belt
        },

        {
            { itemid =     0, droprate = 125 }, -- nothing
            { itemid = 14736, droprate = 125 }, -- genin_earring
            { itemid = 14738, droprate = 125 }, -- magicians_earring
            { itemid = 14729, droprate = 125 }, -- pilferers_earring
            { itemid = 13439, droprate = 125 }, -- warlocks_earring
            { itemid = 13436, droprate = 125 }, -- wrestlers_earring
            { itemid = 14737, droprate = 125 }, -- wyvern_earring
            { itemid = 14731, droprate = 125 }, -- killer_earring
        },

        {
            { itemid =   0, droprate = 160 }, -- nothing
            { itemid = 645, droprate = 140 }, -- chunk_of_darksteel_ore
            { itemid = 653, droprate = 140 }, -- mythril_ingot
            { itemid = 744, droprate = 140 }, -- silver_ingot
            { itemid = 652, droprate = 140 }, -- steel_ingot
            { itemid = 644, droprate = 140 }, -- chunk_of_mythril_ore
            { itemid = 807, droprate = 140 }, -- sardonyx
        },

        {
            { itemid =    0, droprate = 250 }, -- nothing
            { itemid = 4868, droprate = 125 }, -- scroll_of_dispel
            { itemid = 4947, droprate = 125 }, -- scroll_of_utsusemi_ni
            { itemid = 4753, droprate = 125 }, -- scroll_of_fire_ii
            { itemid = 5070, droprate = 125 }, -- scroll_of_magic_finale
            { itemid = 4877, droprate = 125 }, -- scroll_of_absorb-agi
            { itemid = 4878, droprate = 125 }, -- scroll_of_absorb-int
        },

        {
            { itemid =     0, droprate = 500 }, -- nothing
            { itemid = 17873, droprate = 500 }, -- jug_of_scarlet_sap
        },

        {
            { itemid =     0, droprate = 750 }, -- nothing
            { itemid = 17873, droprate = 250 }, -- jug_of_scarlet_sap
        },

        {
            { itemid =    0, droprate = 900 }, -- nothing
            { itemid = 4132, droprate = 100 }, -- hi-ether
        },
    },

    -- BCNM Shooting Fish
    [9] =
    {
        {
            { itemid = 1601, droprate = 1000 }, -- mannequin_head
        },

        {
            { itemid = 4484, droprate = 1000 }, -- shall_shell
        },

        {
            { itemid =   749, droprate = 300 }, -- mythril_beastcoin
            { itemid =   775, droprate =  70 }, -- black_rock
            { itemid =   774, droprate =  30 }, -- purple_rock
            { itemid =   776, droprate = 100 }, -- white_rock
            { itemid = 17202, droprate = 100 }, -- platoon_bow
            { itemid = 17462, droprate = 100 }, -- platoon_mace
            { itemid = 18171, droprate = 150 }, -- platoon_disc
            { itemid = 17271, droprate = 150 }, -- platoon_gun
        },

        {
            { itemid =   749, droprate = 310 }, -- mythril_beastcoin
            { itemid =   772, droprate =  50 }, -- green_rock
            { itemid =   771, droprate =  40 }, -- yellow_rock
            { itemid =   770, droprate =  40 }, -- blue_rock
            { itemid =   769, droprate =  40 }, -- red_rock
            { itemid =   773, droprate = 110 }, -- translucent_rock
            { itemid = 17519, droprate = 130 }, -- platoon_cesti
            { itemid = 18209, droprate = 100 }, -- platoon_cutter
            { itemid = 17692, droprate =  80 }, -- platoon_spatha
            { itemid = 18045, droprate = 100 }, -- platoon_zaghnal
        },

        {
            { itemid =    0, droprate = 670 }, -- nothing
            { itemid =  868, droprate = 190 }, -- handful_of_pugil_scales
            { itemid = 4484, droprate = 140 }, -- shall_shell
        },

        {
            { itemid =    0, droprate = 930 }, -- nothing
            { itemid = 1602, droprate =  70 }, -- mannequin_body
        },

        {
            { itemid = 4857, droprate = 180 }, -- scroll_of_blaze_spikes
            { itemid = 4984, droprate = 510 }, -- scroll_of_horde_lullaby
            { itemid = 4900, droprate = 280 }, -- thunder_spirit_pact
            { itemid = 4869, droprate =  30 }, -- scroll_of_warp
        },
    },

    -- BCNM Dropping Like Flies
    [10] =
    {
        {
            { itemid = 65535, droprate = 1000, amount = 4000 }, -- Gil
        },

        {
            { itemid = 846, droprate = 1000 }, -- Insect Wing
        },

        {
            { itemid = 1601, droprate = 1000 }, -- Mannequin Head
        },

        {
            { itemid =     0, droprate = 636 }, -- Nothing
            { itemid = 12486, droprate = 364 }, -- Emperor Hairpin
        },

        {
            { itemid = 12400, droprate = 175 }, -- Ashigaru Targe
            { itemid = 12399, droprate = 175 }, -- Beaters Aspis
            { itemid = 12395, droprate = 175 }, -- Varlets Targe
            { itemid = 12390, droprate = 175 }, -- Wrestlers Aspis
            { itemid =   809, droprate = 100 }, -- Clear Topaz
            { itemid =   795, droprate = 100 }, -- Lapis Lazuli
            { itemid =   796, droprate = 100 }, -- Light Opal
        },

        {
            { itemid = 13659, droprate = 250 }, -- Mercenary Mantle
            { itemid = 13668, droprate = 250 }, -- Singers Mantle
            { itemid = 13662, droprate = 250 }, -- Wizards Mantle
            { itemid = 13672, droprate = 250 }, -- Wyvern Mantle
        },

        {
            { itemid =  4947, droprate =  70 }, -- Scroll Of Utsusemi Ni
            { itemid =  5070, droprate =  70 }, -- Scroll Of Magic Finale
            { itemid = 17863, droprate = 150 }, -- Jug Of Quadav Bug Broth
            { itemid =   799, droprate = 100 }, -- Onyx
            { itemid =   795, droprate = 100 }, -- Lapis Lazuli
            { itemid =   796, droprate = 100 }, -- Light Opal
            { itemid =  4868, droprate = 150 }, -- Scroll Of Dispel
            { itemid =  4751, droprate = 100 }, -- Scroll Of Erase
            { itemid =   690, droprate =  90 }, -- Elm Log
            { itemid =  1602, droprate =  70 }, -- Mannequin Body
        },
    },

    -- KSNM Horns of War
    [11] =
    {
        {
            { itemid =  1441, droprate = 169 }, -- Libation Abjuration
            { itemid = 17939, droprate = 268 }, -- Kriegsbeil
            { itemid = 17823, droprate =  99 }, -- Shinsoku
            { itemid = 18173, droprate =  85 }, -- Nokizaru Shuriken
            { itemid = 17694, droprate =  70 }, -- Guespiere
            { itemid = 17464, droprate =  85 }, -- Purgatory Mace
            { itemid = 18351, droprate = 225 }, -- Meteor Cesti
        },

        {
            { itemid =  1442, droprate = 169 }, -- Oblation Abjuration
            { itemid = 17789, droprate =  14 }, -- Unsho
            { itemid = 17838, droprate = 239 }, -- Harlequins Horn
            { itemid = 18088, droprate =  85 }, -- Dreizack
            { itemid = 18211, droprate = 254 }, -- Gawains Axe
            { itemid = 17578, droprate = 183 }, -- Zen Pole
            { itemid = 17695, droprate  = 70 }, -- Bayards Sword
        },

        {
            { itemid =  703, droprate = 563 }, -- Petrified Log
            { itemid = 1446, droprate = 296 }, -- Lacquer Tree Log
            { itemid =  831, droprate =  14 }, -- Square Of Shining Cloth
            { itemid =  722, droprate = 141 }, -- Divine Log
        },

        {
            { itemid =   860, droprate = 535 }, -- Behemoth Hide
            { itemid =   883, droprate = 366 }, -- Behemoth Horn
            { itemid = 17108, droprate =  48 }, -- Healing Staff
        },

        {
            { itemid =  902, droprate =  99 }, -- Demon Horn
            { itemid =  703, droprate =  70 }, -- Petrified Log
            { itemid = 1132, droprate =  70 }, -- Square Of Raxa
            { itemid =  830, droprate =  28 }, -- Square Of Rainbow Cloth
            { itemid = 4173, droprate = 113 }, -- Hi-reraiser
            { itemid =  703, droprate = 211 }, -- Petrified Log
            { itemid =  942, droprate = 141 }, -- Philosophers Stone
            { itemid =  737, droprate =  56 }, -- Chunk Of Gold Ore
            { itemid =  644, droprate =  85 }, -- Chunk Of Mythril Ore
            { itemid =  887, droprate =  70 }, -- Coral Fragment
            { itemid =  700, droprate =  85 }, -- Mahogany Log
            { itemid =  866, droprate =  42 }, -- Handful Of Wyvern Scales
            { itemid =  645, droprate =  42 }, -- Chunk Of Darksteel Ore
            { itemid =  895, droprate =  70 }, -- Ram Horn
            { itemid =  702, droprate =  85 }, -- Ebony Log
            { itemid = 4172, droprate =  28 }, -- Reraiser
            { itemid =  738, droprate =  42 }, -- Chunk Of Platinum Ore
            { itemid = 4174, droprate =  42 }, -- Vile Elixir
            { itemid = 4175, droprate =   7 }, -- Vile Elixir +1
        },

        {
            { itemid = 1527, droprate = 208 }, -- Behemoth Tongue
            { itemid =  883, droprate = 296 }, -- Behemoth Horn
            { itemid = 4199, droprate = 155 }, -- Strength Potion
            { itemid = 4201, droprate =  70 }, -- Dexterity Potion
            { itemid = 4205, droprate = 141 }, -- Agility Potion
            { itemid = 4203, droprate = 113 }, -- Vitality Potion
        },

        {
            { itemid = 3341, droprate = 1000 }, -- Beastly Shank
        },

        {
            { itemid =  4209, droprate = 169 }, -- Mind Potion
            { itemid =  4207, droprate =  70 }, -- Intelligence Potion
            { itemid =  4211, droprate = 113 }, -- Charisma Potion
            { itemid =  4213, droprate = 155 }, -- Icarus Wing
            { itemid = 17840, droprate = 254 }, -- Angel Lyre
            { itemid =   785, droprate =  99 }, -- Emerald
            { itemid =   804, droprate =  42 }, -- Spinel
            { itemid =   786, droprate =  56 }, -- Ruby
            { itemid =   787, droprate =  28 }, -- Diamond
        },

        {
            { itemid = 4135, droprate = 296 }, -- Hi-ether +3
            { itemid = 4119, droprate = 225 }, -- Hi-potion +3
            { itemid = 4173, droprate = 197 }, -- Hi-reraiser
            { itemid = 4175, droprate = 282 }, -- Vile Elixir +1
        },

        {
            { itemid =  887, droprate = 141 }, -- Coral Fragment
            { itemid = 1132, droprate =  14 }, -- Square Of Raxa
            { itemid =  902, droprate = 113 }, -- Demon Horn
            { itemid =  737, droprate =  28 }, -- Chunk Of Gold Ore
            { itemid =  644, droprate =  85 }, -- Chunk Of Mythril Ore
            { itemid = 4174, droprate =  56 }, -- Vile Elixir
            { itemid =  895, droprate =  28 }, -- Ram Horn
            { itemid =  703, droprate = 296 }, -- Petrified Log
            { itemid =  738, droprate =  14 }, -- Chunk Of Platinum Ore
            { itemid =  700, droprate =  56 }, -- Mahogany Log
            { itemid =  866, droprate =  70 }, -- Handful Of Wyvern Scales
            { itemid = 1465, droprate =  42 }, -- Slab Of Granite
            { itemid =  645, droprate =  42 }, -- Chunk Of Darksteel Ore
            { itemid =  702, droprate =  42 }, -- Ebony Log
            { itemid = 4173, droprate =  42 }, -- Hi-reraiser
            { itemid =  823, droprate = 113 }, -- Spool Of Gold Thread
            { itemid =  830, droprate =  28 }, -- Square Of Rainbow Cloth
        },

        {
            { itemid = 1132, droprate = 127 }, -- Square Of Raxa
            { itemid =  837, droprate =  56 }, -- Spool Of Malboro Fiber
            { itemid =  942, droprate = 225 }, -- Philosophers Stone
            { itemid =  844, droprate = 423 }, -- Phoenix Feather
            { itemid =  836, droprate =  70 }, -- Square Of Damascene Cloth
            { itemid =  658, droprate =  42 }, -- Damascus Ingot
            { itemid = 1110, droprate =  85 }, -- Vial Of Black Beetle Blood
        },
    },

    -- BCNM Under Observation
    [12] =
    {
        {
            { itemid =     0, droprate = 910 }, -- Nothing
            { itemid = 13056, droprate =  90 }, -- Peacock Charm
        },

        {
            { itemid =     0, droprate = 467 }, -- Nothing
            { itemid = 18086, droprate =  48 }, -- Behourd Lance
            { itemid = 18046, droprate =  61 }, -- Mutilator
            { itemid = 18210, droprate =  46 }, -- Raifu
            { itemid = 15286, droprate = 302 }, -- Tilt Belt
            { itemid = 18350, droprate =  76 }, -- Tourney Patas
        },

        {
            { itemid =     0, droprate = 413 }, -- Nothing
            { itemid = 17696, droprate =  42 }, -- Buzzard Tuck
            { itemid = 17936, droprate =  77 }, -- De Saintres Axe
            { itemid = 17693, droprate =  73 }, -- Grudge Sword
            { itemid = 15287, droprate = 258 }, -- Mantra Belt
            { itemid =  4717, droprate =  68 }, -- Scroll Of Refresh
            { itemid =  4947, droprate =  55 }, -- Scroll Of Utsusemi Ni
            { itemid =  4858, droprate =  14 }, -- Scroll Of Ice Spikes
        },

        {
            { itemid = 4858, droprate = 114 }, -- Scroll Of Ice Spikes
            { itemid = 4717, droprate = 174 }, -- Scroll Of Refresh
            { itemid = 4947, droprate = 138 }, -- Scroll Of Utsusemi Ni
            { itemid =  769, droprate =  16 }, -- Red Rock
            { itemid =  770, droprate =  17 }, -- Blue Rock
            { itemid =  771, droprate =  17 }, -- Yellow Rock
            { itemid =  772, droprate =  18 }, -- Green Rock
            { itemid =  773, droprate =  17 }, -- Translucent Rock
            { itemid =  774, droprate =  16 }, -- Purple Rock
            { itemid =  775, droprate =  18 }, -- Black Rock
            { itemid =  776, droprate =  16 }, -- White Rock
            { itemid =  749, droprate = 102 }, -- Mythril Beastcoin
            { itemid =  748, droprate = 120 }, -- Gold Beastcoin
            { itemid =  699, droprate =  22 }, -- Oak Log
            { itemid =  811, droprate =  18 }, -- Ametrine
            { itemid =  793, droprate =  18 }, -- Black Pearl
            { itemid =  790, droprate =  20 }, -- Garnet
            { itemid =  808, droprate =  19 }, -- Goshenite
            { itemid =  792, droprate =  21 }, -- Pearl
            { itemid =  788, droprate =  35 }, -- Peridot
            { itemid =  815, droprate =  17 }, -- Sphene
            { itemid =  798, droprate =  23 }, -- Turquoise
            { itemid = 4172, droprate =  21 }, -- Reraiser
            { itemid = 4174, droprate =  16 }, -- Vile Elixir
        },

        {
            { itemid = 4896, droprate = 116 }, -- Fire Spirit Pact
            { itemid = 4874, droprate = 113 }, -- Scroll Of Absorb-str
            { itemid = 4751, droprate = 137 }, -- Scroll Of Erase
            { itemid = 4858, droprate =  67 }, -- Scroll Of Ice Spikes
            { itemid = 4714, droprate =  99 }, -- Scroll Of Phalanx
            { itemid =  811, droprate =  58 }, -- Ametrine
            { itemid =  793, droprate =  52 }, -- Black Pearl
            { itemid =  790, droprate =  51 }, -- Garnet
            { itemid =  808, droprate =  65 }, -- Goshenite
            { itemid =  792, droprate =  61 }, -- Pearl
            { itemid =  788, droprate =  63 }, -- Peridot
            { itemid =  815, droprate =  55 }, -- Sphene
            { itemid =  798, droprate =  62 }, -- Turquoise
        },

        {
            { itemid = 939, droprate = 1000 }, -- Hecteyes Eye
        },

        {
            { itemid = 914, droprate = 1000 }, -- Vial Of Mercury
        },
    },

    -- BCNM Eye of the Tiger
    [13] =
    {
        {
            { itemid = 884, droprate = 1000 }, -- black_tiger_fang
        },

        {
            { itemid = 884, droprate = 1000 }, -- black_tiger_fang
        },

        {
            { itemid =    0, droprate = 700 }, -- nothing
            { itemid = 1012, droprate = 300 }, -- nue_fang
        },

        {
            { itemid =     0, droprate = 125 }, -- nothing
            { itemid = 14842, droprate = 125 }, -- ivory_mitts
            { itemid = 15151, droprate = 125 }, -- super_ribbon
            { itemid = 15148, droprate = 125 }, -- mana_circlet
            { itemid = 15149, droprate = 125 }, -- rival_ribbon
            { itemid = 14845, droprate = 125 }, -- sly_gauntlets
            { itemid = 15150, droprate = 125 }, -- shock_mask
            { itemid = 14843, droprate = 125 }, -- spiked_finger_gauntlets
        },

        {
            { itemid = 13168, droprate = 125 }, -- intellect_torque
            { itemid = 13677, droprate = 125 }, -- esoteric_mantle
            { itemid = 13679, droprate = 125 }, -- templars_mantle
            { itemid = 13678, droprate = 125 }, -- snipers_mantle
            { itemid = 13166, droprate = 125 }, -- hateful_collar
            { itemid = 13167, droprate = 125 }, -- storm_gorget
            { itemid = 13676, droprate = 125 }, -- heavy_mantle
            { itemid = 13169, droprate = 125 }, -- benign_necklace
        },

        {
            { itemid =    0, droprate = 125 }, -- nothing
            { itemid =  745, droprate = 125 }, -- gold_ingot
            { itemid =  895, droprate = 125 }, -- ram_horn
            { itemid = 1122, droprate = 125 }, -- wyvern_skin
            { itemid =  702, droprate = 125 }, -- ebony_log
            { itemid =  653, droprate = 125 }, -- mythril_ingot
            { itemid =  859, droprate = 125 }, -- ram_skin
            { itemid =  887, droprate = 125 }, -- coral_fragment
        },

        {
            { itemid =    0, droprate = 400 }, -- nothing
            { itemid = 5152, droprate = 200 }, -- slice_of_buffalo_meat
            { itemid = 4272, droprate = 200 }, -- slice_of_dragon_meat
            { itemid = 4377, droprate = 200 }, -- slice_of_coeurl_meat
        },

        {
            { itemid =    0, droprate = 625 }, -- nothing
            { itemid = 4814, droprate = 125 }, -- scroll_of_freeze
            { itemid = 4621, droprate = 125 }, -- scroll_of_raise_ii
            { itemid = 4818, droprate = 125 }, -- scroll_of_quake
        },
    },

    -- BCNM Shots in the Dark
    [14] =
    {
        {
            { itemid = 748, droprate = 500 }, -- gold_beastcoin
            { itemid = 749, droprate = 500 }, -- mythril_beastcoin
        },

        {
            { itemid = 652, droprate = 500 }, -- steel_ingot
            { itemid = 791, droprate = 500 }, -- aquamarine
        },

        {
            { itemid =    0, droprate = 500 }, -- nothing
            { itemid = 4224, droprate = 500 }, -- demon_quiver
        },

        {
            { itemid =     0, droprate = 600 }, -- nothing
            { itemid = 14661, droprate = 200 }, -- teleport_ring_holla
            { itemid = 14664, droprate = 200 }, -- teleport_ring_vahzl
        },

        {
            { itemid =     0, droprate = 600 }, -- nothing
            { itemid = 13687, droprate = 200 }, -- sapient_cape
            { itemid = 14870, droprate = 200 }, -- trainers_wristbands
        },
    },

    -- KSNM Double Dragonian
    [15] =
    {
        {
            { itemid = 18378, droprate = 222 }, -- Subduer
            { itemid = 17699, droprate = 302 }, -- Dissector
            { itemid = 17509, droprate = 245 }, -- Destroyers
            { itemid = 18005, droprate = 208 }, -- Heart Snatcher
        },

        {
            { itemid =    0, droprate = 638 }, -- Nothing
            { itemid = 1133, droprate =  10 }, -- Vial Of Dragon Blood
            { itemid = 4486, droprate = 176 }, -- Dragon Heart
            { itemid = 4272, droprate = 176 }, -- Slice Of Dragon Meat
        },

        {
            { itemid =    0, droprate = 638 }, -- Nothing
            { itemid = 1133, droprate =  10 }, -- Vial Of Dragon Blood
            { itemid = 4486, droprate = 176 }, -- Dragon Heart
            { itemid = 4272, droprate = 176 }, -- Slice Of Dragon Meat
        },

        {
            { itemid =     0, droprate = 392 }, -- Nothing
            { itemid = 19026, droprate = 354 }, -- Spear Strap
            { itemid = 19024, droprate = 165 }, -- Sword Strap
            { itemid = 19025, droprate =  89 }, -- Pole Grip
        },

        {
            { itemid = 14764, droprate = 586 }, -- Minuet Earring
            { itemid =   655, droprate = 184 }, -- Adaman Ingot
            { itemid =   747, droprate = 207 }, -- Orichalcum Ingot
        },

        {
            { itemid = 17842, droprate = 238 }, -- Sorrowful Harp
            { itemid = 14762, droprate = 250 }, -- Attilas Earring
            { itemid = 17700, droprate = 225 }, -- Durandal
            { itemid = 18006, droprate = 275 }, -- Hoplites Harpe
        },

        {
            { itemid =  737, droprate = 122 }, -- Chunk Of Gold Ore
            { itemid = 4172, droprate =  54 }, -- Reraiser
            { itemid =  644, droprate =  41 }, -- Chunk Of Mythril Ore
            { itemid =  902, droprate =  81 }, -- Demon Horn
            { itemid =  702, droprate = 149 }, -- Ebony Log
            { itemid =  866, droprate =  54 }, -- Handful Of Wyvern Scales
            { itemid = 4175, droprate =  27 }, -- Vile Elixir +1
            { itemid =  700, droprate =  41 }, -- Mahogany Log
            { itemid =  887, droprate =  95 }, -- Coral Fragment
            { itemid =  703, droprate = 108 }, -- Petrified Log
            { itemid =  844, droprate = 135 }, -- Phoenix Feather
            { itemid =  738, droprate =  54 }, -- Chunk Of Platinum Ore
            { itemid =  895, droprate =  14 }, -- Ram Horn
            { itemid =  830, droprate =  14 }, -- Square Of Rainbow Cloth
            { itemid =  645, droprate =  68 }, -- Chunk Of Darksteel Ore
            { itemid = 4173, droprate =  14 }, -- Hi-reraiser
            { itemid = 1132, droprate = 135 }, -- Square Of Raxa
        },

        {
            { itemid =  836, droprate =  96 }, -- Square Of Damascene Cloth
            { itemid =  658, droprate =  27 }, -- Damascus Ingot
            { itemid =  942, droprate = 164 }, -- Philosophers Stone
            { itemid =  844, droprate = 260 }, -- Phoenix Feather
            { itemid =  837, droprate =  96 }, -- Spool Of Malboro Fiber
            { itemid = 1132, droprate = 288 }, -- Square Of Raxa
            { itemid = 1110, droprate =  41 }, -- Vial Of Black Beetle Blood
        },
    },

    -- KSNM Contaminated Colosseum
    [17] =
    {
        {
            { itemid = 837, droprate = 1000 }, -- Spool Of Malboro Fiber
        },

        {
            { itemid = 17827, droprate = 217 }, -- Michishiba-no-tsuyu
            { itemid = 17451, droprate = 174 }, -- Morgenstern
            { itemid = 17793, droprate = 333 }, -- Senjuinrikio
            { itemid = 17589, droprate = 174 }, -- Thyrsusstab
        },

        {
            { itemid = 13402, droprate = 101 }, -- Cassie Earring
            { itemid = 19027, droprate =  43 }, -- Claymore Grip
            { itemid =   920, droprate = 275 }, -- Malboro Vine
            { itemid =  1013, droprate = 275 }, -- Morbolger Vine
            { itemid = 19025, droprate = 203 }, -- Pole Grip
            { itemid = 19026, droprate = 116 }, -- Spear Strap
        },

        {
            { itemid =   655, droprate = 159 }, -- Adaman Ingot
            { itemid =   747, droprate = 290 }, -- Orichalcum Ingot
            { itemid = 13182, droprate = 406 }, -- Oscar Scarf
        },

        {
            { itemid = 15325, droprate = 159 }, -- Evokers Boots
            { itemid = 14872, droprate = 217 }, -- Ostreger Mitts
            { itemid = 15181, droprate = 145 }, -- Pineal Hat
            { itemid = 15387, droprate = 159 }, -- Trackers Kecks
        },

        {
            { itemid =  887, droprate = 101 }, -- Coral Fragment
            { itemid =  645, droprate =  29 }, -- Chunk Of Darksteel Ore
            { itemid =  902, droprate =  29 }, -- Demon Horn
            { itemid =  702, droprate =  29 }, -- Ebony Log
            { itemid =  737, droprate = 101 }, -- Chunk Of Gold Ore
            { itemid =  823, droprate =  29 }, -- Spool Of Gold Thread
            { itemid = 1465, droprate =  29 }, -- Slab Of Granite
            { itemid =  700, droprate =  43 }, -- Mahogany Log
            { itemid =  644, droprate =  29 }, -- Chunk Of Mythril Ore
            { itemid =  703, droprate =  58 }, -- Petrified Log
            { itemid =  738, droprate =  14 }, -- Chunk Of Platinum Ore
            { itemid =  830, droprate =  58 }, -- Square Of Rainbow Cloth
            { itemid =  895, droprate =  14 }, -- Ram Horn
            { itemid = 4174, droprate =  58 }, -- Vile Elixir
            { itemid = 4175, droprate =  29 }, -- Vile Elixir +1
            { itemid =  866, droprate =  72 }, -- Handful Of Wyvern Scales
        },

        {
            { itemid = 1110, droprate =  87 }, -- Vial Of Black Beetle Blood
            { itemid =  658, droprate =  14 }, -- Damascus Ingot
            { itemid =  836, droprate =  29 }, -- Square Of Damascene Cloth
            { itemid =  837, droprate =  43 }, -- Spool Of Malboro Fiber
            { itemid =  942, droprate = 174 }, -- Philosophers Stone
            { itemid =  844, droprate = 246 }, -- Phoenix Feather
            { itemid = 1132, droprate = 159 }, -- Square Of Raxa
        },
    },

    -- BCNM Wings of Fury
    [34] =
    {
        {
            { itemid = 891, droprate = 1000 }, -- Bat Fang
        },

        {
            { itemid = 4900, droprate = 306 }, -- Thunder Spirit Pact
            { itemid = 4744, droprate = 319 }, -- Scroll Of Invisible
            { itemid = 4745, droprate = 125 }, -- Scroll Of Sneak
            { itemid = 4746, droprate = 222 }, -- Scroll Of Deodorize
        },

        {
            { itemid = 17786, droprate = 153 }, -- Ganko
            { itemid = 18170, droprate = 139 }, -- Platoon Edge
            { itemid = 16687, droprate =  83 }, -- Platoon Axe
            { itemid = 17571, droprate =  97 }, -- Platoon Pole
            { itemid = 17993, droprate = 125 }, -- Platoon Dagger
            { itemid =   749, droprate = 444 }, -- Mythril Beastcoin
            { itemid =   773, droprate =  56 }, -- Translucent Rock
        },

        {
            { itemid = 17820, droprate = 111 }, -- Gunromaru
            { itemid = 17993, droprate = 139 }, -- Platoon Dagger
            { itemid = 18170, droprate = 139 }, -- Platoon Edge
            { itemid = 18085, droprate =  42 }, -- Platoon Lance
            { itemid = 16959, droprate = 181 }, -- Platoon Sword
            { itemid =   774, droprate =  97 }, -- Purple Rock
            { itemid =   769, droprate =  69 }, -- Red Rock
            { itemid =   776, droprate =  14 }, -- White Rock
            { itemid =   775, droprate =  28 }, -- Black Rock
            { itemid =   772, droprate =  28 }, -- Green Rock
            { itemid =   771, droprate =  14 }, -- Yellow Rock
            { itemid =   770, droprate =  69 }, -- Blue Rock
        },

        {
            { itemid =     0, droprate = 389 }, -- nothing
            { itemid = 13548, droprate = 167 }, -- astral_ring
            { itemid =   922, droprate = 444 }, -- bat_wing
        },
    },

    -- BCNM Petrifying Pair
    [35] =
    {
        {
            { itemid = 852, droprate = 1000 }, -- Lizard Skin
        },

        {
            { itemid =     0, droprate = 900 }, -- nothing
            { itemid = 13014, droprate = 100 }, -- leaping_boots
        },

        {
            { itemid = 15282, droprate =  50 }, -- Katana Obi
            { itemid = 15275, droprate =  75 }, -- Rapier Belt
            { itemid = 15278, droprate = 175 }, -- Scythe Belt
            { itemid =   694, droprate = 175 }, -- Chestnut Log
            { itemid =   690, droprate = 350 }, -- Elm Log
            { itemid =   652, droprate = 100 }, -- Steel Ingot
        },

        {
            { itemid =     0, droprate = 925 }, -- nothing (50%)
            { itemid = 15282, droprate =  50 }, -- Katana Obi
            { itemid = 15275, droprate =  75 }, -- Rapier Belt
            { itemid = 15278, droprate = 175 }, -- Scythe Belt
            { itemid =   694, droprate = 175 }, -- Chestnut Log
            { itemid =   690, droprate = 350 }, -- Elm Log
            { itemid =   652, droprate = 100 }, -- Steel Ingot
        },

        {
            { itemid = 15285, droprate = 105 }, -- Avatar Belt
            { itemid = 15279, droprate = 105 }, -- Pick Belt
            { itemid =   651, droprate = 131 }, -- Iron Ingot
            { itemid =   643, droprate = 131 }, -- Chunk Of Iron Ore
            { itemid =   644, droprate =  79 }, -- Chunk Of Mythril Ore
            { itemid =   736, droprate =  79 }, -- Chunk Of Silver Ore
            { itemid =   795, droprate = 131 }, -- Lapis Lazuli
        },

        {
            { itemid = 17867, droprate = 552 }, -- Jug Of Cold Carrion Broth
            { itemid =  4877, droprate = 263 }, -- Scroll Of Absorb-agi
            { itemid =  4878, droprate = 210 }, -- Scroll Of Absorb-int
            { itemid =  4876, droprate = 289 }, -- Scroll Of Absorb-vit
            { itemid =  4868, droprate = 105 }, -- Scroll Of Dispel
            { itemid =  4751, droprate =  79 }, -- Scroll Of Erase
            { itemid =  5070, droprate = 421 }, -- Scroll Of Magic Finale
            { itemid =  4947, droprate =  79 }, -- Scroll Of Utsusemi Ni
        },

        {
            { itemid =     0, droprate = 736 }, -- nothing (25%)
            { itemid = 15271, droprate = 200 }, -- Axe Belt
            { itemid = 15272, droprate = 125 }, -- Cestus Belt
            { itemid =   809, droprate =  10 }, -- Clear Topaz
            { itemid = 15276, droprate =  75 }, -- Dagger Belt
            { itemid =   645, droprate = 100 }, -- Darksteel Ore
            { itemid = 15281, droprate =  25 }, -- Gun Belt
            { itemid =  4132, droprate = 175 }, -- Hi-ether
            { itemid = 15284, droprate = 200 }, -- Lance Belt
            { itemid =   796, droprate =  75 }, -- Light Opal
            { itemid = 15273, droprate = 175 }, -- Mace Belt
            { itemid =   653, droprate = 200 }, -- Mythril Ingot
            { itemid =   799, droprate =  25 }, -- Onyx
            { itemid = 15283, droprate = 250 }, -- Sarashi
            { itemid = 15277, droprate = 100 }, -- Shield Belt
            { itemid = 15280, droprate = 100 }, -- Song Belt
            { itemid = 15274, droprate = 150 }, -- Staff Belt
            { itemid =   744, droprate = 100 }, -- Silver Ingot
            { itemid =   806, droprate = 125 }, -- Tourmaline
        },

        {
            { itemid =     0, droprate = 2210 }, -- nothing (50%)
            { itemid = 15271, droprate =  200 }, -- Axe Belt
            { itemid = 15272, droprate =  125 }, -- Cestus Belt
            { itemid =   809, droprate =   10 }, -- Clear Topaz
            { itemid = 15276, droprate =   75 }, -- Dagger Belt
            { itemid =   645, droprate =  100 }, -- Darksteel Ore
            { itemid = 15281, droprate =   25 }, -- Gun Belt
            { itemid =  4132, droprate =  175 }, -- Hi-ether
            { itemid = 15284, droprate =  200 }, -- Lance Belt
            { itemid =   796, droprate =   75 }, -- Light Opal
            { itemid = 15273, droprate =  175 }, -- Mace Belt
            { itemid =   653, droprate =  200 }, -- Mythril Ingot
            { itemid =   799, droprate =   25 }, -- Onyx
            { itemid = 15283, droprate =  250 }, -- Sarashi
            { itemid = 15277, droprate =  100 }, -- Shield Belt
            { itemid = 15280, droprate =  100 }, -- Song Belt
            { itemid = 15274, droprate =  150 }, -- Staff Belt
            { itemid =   744, droprate =  100 }, -- Silver Ingot
            { itemid =   806, droprate =  125 }, -- Tourmaline
        },
    },

    -- BCNM Toadal Recall
    [36] =
    {
        {
            { itemid = 4386, droprate = 1000 }, -- king_truffle
        },

        {
            { itemid = 17880, droprate = 1000 }, -- jug_of_seedbed_soil
        },

        {
            { itemid =     0, droprate = 200 }, -- nothing
            { itemid = 12403, droprate = 200 }, -- magicians_shield
            { itemid = 12389, droprate = 200 }, -- mercenarys_targe
            { itemid = 12399, droprate = 200 }, -- beaters_aspis
            { itemid = 12394, droprate = 200 }, -- pilferers_aspis
        },

        {
            { itemid =     0, droprate = 250 }, -- nothing
            { itemid = 13667, droprate = 250 }, -- trimmers_mantle
            { itemid = 13671, droprate = 250 }, -- genin_mantle
            { itemid = 13663, droprate = 250 }, -- warlocks_mantle
        },

        {
            { itemid =    0, droprate = 625 }, -- nothing
            { itemid = 4947, droprate = 125 }, -- scroll_of_utsusemi_ni
            { itemid = 4714, droprate = 125 }, -- scroll_of_phalanx
            { itemid = 4751, droprate = 125 }, -- scroll_of_erase
        },

        {
            { itemid =    0, droprate = 250 }, -- nothing
            { itemid = 1601, droprate = 250 }, -- mannequin_head
            { itemid = 1602, droprate = 250 }, -- mannequin_body
            { itemid = 1603, droprate = 250 }, -- mannequin_hands
        },
    },

    -- BCNM The Worm's Turn
    [65] =
    {
        {
            { itemid =    0, droprate = 125 }, -- nothing
            { itemid = 4896, droprate = 125 }, -- fire_spirit_pact
            { itemid = 4714, droprate = 125 }, -- scroll_of_phalanx
            { itemid = 4947, droprate = 125 }, -- scroll_of_utsusemi_ni
            { itemid = 4751, droprate = 125 }, -- scroll_of_erase
            { itemid = 4858, droprate = 125 }, -- scroll_of_ice_spikes
            { itemid = 4874, droprate = 125 }, -- scroll_of_absorb-str
            { itemid = 4717, droprate = 125 }, -- scroll_of_refresh
        },

        {
            { itemid =     0, droprate = 125 }, -- nothing
            { itemid = 13405, droprate = 125 }, -- enhancing_earring
            { itemid = 13129, droprate = 125 }, -- spirit_torque
            { itemid = 13127, droprate = 125 }, -- guarding_gorget
            { itemid = 13404, droprate = 125 }, -- nemesis_earring
            { itemid = 13623, droprate = 125 }, -- earth_mantle
            { itemid = 12350, droprate = 125 }, -- strike_shield
            { itemid = 17203, droprate = 125 }, -- shikar_bow
        },

        {
            { itemid = 699, droprate = 500 }, -- oak_log
            { itemid = 701, droprate = 500 }, -- rosewood_log
        },

        {
            { itemid = 748, droprate = 500 }, -- gold_beastcoin
            { itemid = 749, droprate = 500 }, -- mythril_beastcoin
        },

        {
            { itemid = 793, droprate = 200 }, -- black_pearl
            { itemid = 811, droprate = 200 }, -- ametrine
            { itemid = 771, droprate = 200 }, -- yellow_rock
            { itemid = 788, droprate = 200 }, -- peridot
            { itemid = 798, droprate = 200 }, -- turquoise
        },

        {
            { itemid =    0, droprate = 800 }, -- nothing
            { itemid = 4172, droprate = 200 }, -- reraiser
        },
    },

    -- BCNM Grimshell Shocktroopers
    [66] =
    {
        {
            { itemid =     0, droprate = 250 }, -- nothing
            { itemid = 13403, droprate = 125 }, -- assault_earring
            { itemid = 16788, droprate = 125 }, -- vassagos_scythe
            { itemid = 17615, droprate = 125 }, -- chicken_knife
            { itemid = 17430, droprate = 125 }, -- fey_wand
            { itemid = 12351, droprate = 125 }, -- astral_shield
            { itemid = 13624, droprate = 125 }, -- enhancing_mantle
        },

        {
            { itemid = 653, droprate = 250 }, -- mythril_ingot
            { itemid = 652, droprate = 250 }, -- steel_ingot
            { itemid = 745, droprate = 250 }, -- gold_ingot
            { itemid = 654, droprate = 250 }, -- darksteel_ingot
        },

        {
            { itemid = 702, droprate = 250 }, -- ebony_log
            { itemid = 801, droprate = 250 }, -- chrysoberyl
            { itemid = 810, droprate = 250 }, -- fluorite
            { itemid = 140, droprate = 250 }, -- jadeite
        },

        {
            { itemid =    0, droprate = 875 }, -- nothing
            { itemid = 4621, droprate = 125 }, -- scroll_of_raise_ii
        },

        {
            { itemid =    0, droprate = 800 }, -- nothing
            { itemid = 4621, droprate = 200 }, -- hi-reraiser
        },
    },

    -- BCNM 3, 2, 1...
    [69] =
    {
        {
            { itemid = 16897, droprate = 500 }, -- kageboshi
            { itemid = 16991, droprate = 500 }, -- odenta
        },

        {
            { itemid = 13251, droprate = 200 }, -- ocean_belt
            { itemid = 13252, droprate = 200 }, -- forest_belt
            { itemid = 13253, droprate = 200 }, -- steppe_belt
            { itemid = 13254, droprate = 200 }, -- jungle_belt
            { itemid = 13255, droprate = 200 }, -- desert_belt
        },

        {
            { itemid =    0, droprate = 250 }, -- nothing
            { itemid = 4814, droprate = 125 }, -- scroll_of_freeze
            { itemid = 4818, droprate = 125 }, -- scroll_of_quake
            { itemid = 4621, droprate = 125 }, -- scroll_of_raise_ii
            { itemid = 4719, droprate = 125 }, -- scroll_of_regen_iii
            { itemid = 4896, droprate = 125 }, -- fire_spirit_pact
            { itemid = 4902, droprate = 125 }, -- light_spirit_pact
        },

        {
            { itemid =   0, droprate = 800 }, -- nothing
            { itemid = 703, droprate = 200 }, -- petrified_log
        },
    },

    -- BCNM Birds of a Feather
    [73] =
    {
        {
            { itemid = 847, droprate = 1000 }, -- Bird Feather
        },

        {
            { itemid = 14735, droprate = 125 }, -- Ashigaru Earring
            { itemid = 14732, droprate = 125 }, -- Trimmers Earring
            { itemid = 14734, droprate = 125 }, -- Beaters Earring
            { itemid = 13437, droprate = 125 }, -- Healers Earring
            { itemid = 13435, droprate = 125 }, -- Mercenarys Earring
            { itemid = 14733, droprate = 125 }, -- Singers Earring
            { itemid = 13438, droprate = 125 }, -- Wizards Earring
            { itemid = 13436, droprate = 125 }, -- Wrestlers Earring
        },

        {
            { itemid =     0, droprate = 125 }, -- nothing
            { itemid = 15285, droprate = 125 }, -- Avatar Belt
            { itemid = 15276, droprate = 125 }, -- Dagger Belt
            { itemid = 15284, droprate = 125 }, -- Lance Belt
            { itemid = 15275, droprate = 125 }, -- Rapier Belt
            { itemid = 15283, droprate = 125 }, -- Sarashi
            { itemid = 15278, droprate = 125 }, -- Scythe Belt
            { itemid = 15277, droprate = 125 }, -- Shield Belt
        },

        {
            { itemid =    0, droprate = 500 }, -- nothing
            { itemid = 4868, droprate = 125 }, -- Scroll Of Dispel
            { itemid = 4751, droprate = 125 }, -- Scroll Of Erase
            { itemid = 5070, droprate = 125 }, -- Scroll Of Magic Finale
            { itemid = 4947, droprate = 125 }, -- Scroll Of Utsusemi Ni
        },

        {
            { itemid =    0, droprate = 136 }, -- nothing
            { itemid = 4570, droprate = 125 }, -- Bird Egg
            { itemid =  847, droprate =  50 }, -- Bird Feather
            { itemid =  694, droprate = 125 }, -- Chestnut Log
            { itemid =  690, droprate = 188 }, -- Elm Log
            { itemid = 4132, droprate =  63 }, -- Hi-ether
            { itemid = 4222, droprate = 313 }, -- Horn Quiver
        },

        {
            { itemid =   0, droprate = 123 }, -- nothing
            { itemid = 651, droprate =  63 }, -- Iron Ingot
            { itemid = 795, droprate = 125 }, -- Lapis Lazuli
            { itemid = 796, droprate = 125 }, -- Light Opal
            { itemid = 653, droprate =  63 }, -- Mythril Ingot
            { itemid = 644, droprate =  63 }, -- Chunk Of Mythril Ore
            { itemid = 799, droprate = 250 }, -- Onyx
            { itemid = 736, droprate =  63 }, -- Chunk Of Silver Ore
            { itemid = 744, droprate = 125 }, -- Silver Ingot
        },

    },

    -- BCNM Crustacean Conundrum
    [74] =
    {
        {
            { itemid = 4400, droprate = 1000 }, -- slice_of_land_crab_meat
        },

        {
            { itemid = 1602, droprate = 1000 }, -- mannequin_body
        },

        {
            { itemid =   0, droprate = 334 }, -- nothing
            { itemid = 881, droprate = 666 }, -- crab_shell
        },

        {
            { itemid =  4221, droprate = 444 }, -- beetle_quiver
            { itemid = 17877, droprate = 556 }, -- jug_of_fish_oil_broth
        },

        {
            { itemid =   0, droprate = 450 }, -- nothing
            { itemid = 650, droprate = 100 }, -- brass_ingot
            { itemid = 660, droprate = 150 }, -- bronze_sheet
            { itemid = 649, droprate = 300 }, -- bronze_ingot
        },

        {
            { itemid =    0, droprate = 300 }, -- nothing
            { itemid =  749, droprate = 500 }, -- mythril_beastcoin
            { itemid = 1603, droprate = 100 }, -- mannequin_hands
            { itemid = 1601, droprate = 100 }, -- mannequin_head
        },

        {
            { itemid =     0, droprate = 200 }, -- nothing
            { itemid = 17519, droprate = 100 }, -- platoon_cesti
            { itemid = 17993, droprate = 100 }, -- platoon_dagger
            { itemid = 16687, droprate = 100 }, -- platoon_axe
            { itemid = 17202, droprate = 100 }, -- platoon_bow
            { itemid = 18085, droprate = 100 }, -- platoon_lance
            { itemid = 16959, droprate = 100 }, -- platoon_sword
            { itemid = 17462, droprate = 100 }, -- platoon_mace
            { itemid = 18045, droprate = 100 }, -- platoon_zaghnal
        },
    },

    -- BCNM Grove Guardians
    [75] =
    {
        {
            { itemid = 1602, droprate = 1000 }, -- mannequin_body
        },

        {
            { itemid =    0, droprate = 800 }, -- nothing
            { itemid = 1603, droprate = 200 }, -- mannequin_hands
        },

        {
            { itemid =     0, droprate = 250 }, -- nothing
            { itemid = 13660, droprate = 250 }, -- wrestlers_mantle
            { itemid = 13673, droprate = 250 }, -- magicians_mantle
            { itemid = 13664, droprate = 250 }, -- pilferers_mantle
        },

        {
            { itemid =     0, droprate = 200 }, -- nothing
            { itemid = 12391, droprate = 200 }, -- healers_shield
            { itemid = 12401, droprate = 200 }, -- genin_aspis
            { itemid = 12396, droprate = 200 }, -- killer_targe
            { itemid = 15274, droprate = 200 }, -- staff_belt
        },

        {
            { itemid =   0, droprate = 250 }, -- nothing
            { itemid = 572, droprate = 250 }, -- bag_of_herb_seeds
            { itemid = 573, droprate = 250 }, -- bag_of_vegetable_seeds
            { itemid = 575, droprate = 250 }, -- bag_of_grain_seeds
        },

        {
            { itemid =    0, droprate = 500 }, -- nothing
            { itemid = 4868, droprate = 125 }, -- scroll_of_dispel
            { itemid = 4947, droprate = 125 }, -- scroll_of_utsusemi_ni
            { itemid = 5070, droprate = 125 }, -- scroll_of_magic_finale
            { itemid = 4751, droprate = 125 }, -- scroll_of_erase
        },

        {
            { itemid =    0, droprate = 800 }, -- nothing
            { itemid = 4223, droprate = 200 }, -- scorpion_quiver
        },
    },

    -- KSNM The Hills are Alive
    [76] =
    {
        {
            { itemid = 3343, droprate = 1000 }, -- Blue Pondweed
        },

        {
            { itemid = 18047, droprate = 188 }, -- Havoc Scythe
            { itemid = 17939, droprate =  27 }, -- Kriegsbeil
            { itemid = 17937, droprate = 170 }, -- Leopard Axe
            { itemid =  1441, droprate = 295 }, -- Libation Abjuration
            { itemid = 18351, droprate =  27 }, -- Meteor Cesti
            { itemid = 17464, droprate =  71 }, -- Purgatory Mace
            { itemid = 17575, droprate = 196 }, -- Somnus Signa
        },

        {
            { itemid = 18211, droprate =  45 }, -- Gawains Axe
            { itemid = 17576, droprate = 259 }, -- Grim Staff
            { itemid = 17245, droprate = 241 }, -- Grosveneurs Bow
            { itemid = 17838, droprate = 143 }, -- Harlequins Horn
            { itemid =  1442, droprate = 161 }, -- Oblation Abjuration
            { itemid = 17996, droprate = 143 }, -- Stylet
            { itemid = 17578, droprate =  36 }, -- Zen Pole
        },

        {
            { itemid =   683, droprate = 446 }, -- Adaman Chain
            { itemid =   908, droprate = 420 }, -- Adamantoise Shell
            { itemid =  1312, droprate =  71 }, -- Piece Of Angel Skin
            { itemid = 14080, droprate =  26 }, -- Strider Boots
        },

        {
            { itemid =  887, droprate = 116 }, -- Coral Fragment
            { itemid =  645, droprate =  89 }, -- Chunk Of Darksteel Ore
            { itemid =  902, droprate =  71 }, -- Demon Horn
            { itemid =  702, droprate = 152 }, -- Ebony Log
            { itemid =  737, droprate = 107 }, -- Chunk Of Gold Ore
            { itemid =  823, droprate =  89 }, -- Spool Of Gold Thread
            { itemid = 1465, droprate =  45 }, -- Slab Of Granite
            { itemid = 4173, droprate =  71 }, -- Hi-reraiser
            { itemid =  700, droprate = 107 }, -- Mahogany Log
            { itemid =  703, droprate = 223 }, -- Petrified Log
            { itemid =  738, droprate = 116 }, -- Chunk Of Platinum Ore
            { itemid =  830, droprate =  54 }, -- Square Of Rainbow Cloth
            { itemid =  895, droprate =  54 }, -- Ram Horn
            { itemid = 1132, droprate =  71 }, -- Square Of Raxa
            { itemid = 4172, droprate =  45 }, -- Reraiser
            { itemid =  866, droprate =  54 }, -- Handful Of Wyvern Scales
            { itemid = 4174, droprate =  63 }, -- Vile Elixir
            { itemid = 4175, droprate =  45 }, -- Vile Elixir +1
        },

        {
            { itemid =  683, droprate = 268 }, -- Adaman Chain
            { itemid = 1525, droprate = 121 }, -- Adamantoise Egg
            { itemid = 4205, droprate =  80 }, -- Agility Potion
            { itemid = 4201, droprate = 143 }, -- Dexterity Potion
            { itemid = 4199, droprate = 214 }, -- Strength Potion
            { itemid = 4203, droprate = 196 }, -- Vitality Potion
        },

        {
            { itemid =   646, droprate = 107 }, -- Chunk Of Adaman Ore
            { itemid =  4211, droprate =  89 }, -- Charisma Potion
            { itemid =   645, droprate = 179 }, -- Chunk Of Darksteel Ore
            { itemid =  4213, droprate = 134 }, -- Icarus Wing
            { itemid =  4207, droprate = 152 }, -- Intelligence Potion
            { itemid =  4209, droprate =  80 }, -- Mind Potion
            { itemid =   739, droprate =  80 }, -- Chunk Of Orichalcum Ore
            { itemid =   738, droprate = 107 }, -- Chunk Of Platinum Ore
            { itemid = 17698, droprate = 152 }, -- Princely Sword
        },

        {
            { itemid = 4135, droprate = 295 },  -- Hi-ether +3
            { itemid = 4119, droprate = 250 },  -- Hi-potion +3
            { itemid = 4173, droprate = 196 },  -- Hi-reraiser
            { itemid = 4175, droprate = 214 },  -- Vile Elixir +1
        },

        {
            { itemid =  887, droprate = 139 }, -- Coral Fragment
            { itemid =  645, droprate =  59 }, -- Chunk Of Darksteel Ore
            { itemid =  902, droprate =  50 }, -- Demon Horn
            { itemid =  702, droprate = 109 }, -- Ebony Log
            { itemid =  737, droprate =  69 }, -- Chunk Of Gold Ore
            { itemid = 1465, droprate =  99 }, -- Slab Of Granite
            { itemid = 4173, droprate =  79 }, -- Hi-reraiser
            { itemid =  700, droprate = 129 }, -- Mahogany Log
            { itemid =  644, droprate = 119 }, -- Chunk Of Mythril Ore
            { itemid =  844, droprate =  69 }, -- Phoenix Feather
            { itemid =  703, droprate = 168 }, -- Petrified Log
            { itemid =  738, droprate = 129 }, -- Chunk Of Platinum Ore
            { itemid =  895, droprate = 109 }, -- Ram Horn
            { itemid = 1132, droprate =  79 }, -- Square Of Raxa
            { itemid = 4174, droprate =  69 }, -- Vile Elixir
            { itemid =  866, droprate =  79 }, -- Handful Of Wyvern Scales
            { itemid = 4172, droprate =  50 }, -- Reraiser
            { itemid =  823, droprate =  89 }, -- Spool Of Gold Thread
        },

        {
            { itemid = 1110, droprate = 109 }, -- Vial Of Black Beetle Blood
            { itemid =  836, droprate =  89 }, -- Square Of Damascene Cloth
            { itemid =  658, droprate =  79 }, -- Damascus Ingot
            { itemid =  837, droprate =  99 }, -- Spool Of Malboro Fiber
            { itemid =  942, droprate = 188 }, -- Philosophers Stone
            { itemid =  844, droprate = 238 }, -- Phoenix Feather
            { itemid = 1132, droprate = 109 }, -- Square Of Raxa
        },

        {
            { itemid =  722, droprate =  79 }, -- Divine Log
            { itemid = 1446, droprate = 257 }, -- Lacquer Tree Log
            { itemid =  703, droprate = 337 }, -- Petrified Log
            { itemid =  831, droprate = 149 }, -- Square Of Shining Cloth
        },
    },

    -- BCNM The Final Bout
    [78] =
    {
        {
            { itemid = 1237, droprate = 1000 }, -- bag_of_tree_cuttings
        },

        {
            { itemid = 1237, droprate = 1000 }, -- bag_of_tree_cuttings
        },

        {
            { itemid = 919, droprate = 1000 }, -- clump_of_boyahda_moss
        },

        {
            { itemid = 4818, droprate = 100 }, -- scroll_of_quake
            { itemid = 1414, droprate = 100 }, -- piece_of_wisteria_lumber
            { itemid =  700, droprate = 100 }, -- mahogany_log
            { itemid =  702, droprate = 100 }, -- ebony_log
            { itemid = 4814, droprate = 100 }, -- scroll_of_freeze
            { itemid =  654, droprate = 100 }, -- darksteel_ingot
            { itemid = 4621, droprate = 100 }, -- scroll_of_raise_ii
            { itemid =  703, droprate = 100 }, -- petrified_log
            { itemid =  745, droprate = 100 }, -- gold_ingot
            { itemid =  887, droprate = 100 }, -- coral_fragment
        },

        {
            { itemid = 15150, droprate = 62 }, -- shock_mask
            { itemid = 15151, droprate = 62 }, -- super_ribbon
            { itemid = 15149, droprate = 62 }, -- rival_ribbon
            { itemid = 14842, droprate = 62 }, -- ivory_mitts
            { itemid = 14843, droprate = 70 }, -- spiked_finger_gauntlets
            { itemid = 14845, droprate = 62 }, -- sly_gauntlets
            { itemid = 14844, droprate = 62 }, -- rush_gloves
            { itemid = 15148, droprate = 62 }, -- mana_circlet
            { itemid = 13166, droprate = 62 }, -- hateful_collar
            { itemid = 13677, droprate = 62 }, -- esoteric_mantle
            { itemid = 13679, droprate = 62 }, -- templars_mantle
            { itemid = 13676, droprate = 62 }, -- heavy_mantle
            { itemid = 13168, droprate = 62 }, -- intellect_torque
            { itemid = 13167, droprate = 62 }, -- storm_gorget
            { itemid = 13169, droprate = 62 }, -- benign_necklace
            { itemid = 13678, droprate = 62 }, -- snipers_mantle
        },
    },

    -- BCNM Up In Arms
    [79] =
    {
        {
            { itemid = 65535, droprate = 1000, amount = 15000 }, -- Gil
        },

        {
            { itemid = 793, droprate = 1000 }, -- Black Pearl
        },

        {
            { itemid = 792, droprate = 1000 }, -- Pearl
        },

        {
            { itemid = 792, droprate = 1000 }, -- Pearl
        },

        {
            { itemid = 1311, droprate = 1000 }, -- Piece Of Oxblood
        },

        {
            { itemid = 1311, droprate = 1000 }, -- Piece Of Oxblood
        },

        {
            { itemid = 1311, droprate = 1000 }, -- Piece Of Oxblood
        },

        {
            { itemid = 14666, droprate = 447 }, -- Teleport Ring Altep
            { itemid = 14662, droprate = 487 }, -- Teleport Ring Dem
        },

        {
            { itemid = 13175, droprate = 494 }, -- Ajari Bead Necklace
            { itemid = 13176, droprate = 449 }, -- Philomath Stole
        },

        {
            { itemid =  791, droprate =  51 }, -- Aquamarine
            { itemid =  801, droprate =  32 }, -- Chrysoberyl
            { itemid =  654, droprate =  39 }, -- Darksteel Ingot
            { itemid =  702, droprate =  21 }, -- Ebony Log
            { itemid = 4173, droprate =  32 }, -- Hi-reraiser
            { itemid =  745, droprate =  55 }, -- Gold Ingot
            { itemid =  784, droprate =  62 }, -- Jadeite
            { itemid =  653, droprate =  81 }, -- Mythril Ingot
            { itemid =  802, droprate =  56 }, -- Moonstone
            { itemid =  797, droprate = 195 }, -- Painite
            { itemid =  652, droprate =  58 }, -- Steel Ingot
            { itemid =  803, droprate =  38 }, -- Sunstone
            { itemid =  773, droprate =  11 }, -- Translucent Rock
            { itemid = 4175, droprate =  21 }, -- Vile Elixir +1
            { itemid =  771, droprate =  15 }, -- Yellow Rock
            { itemid =  805, droprate =  26 }, -- Zircon
            { itemid =  769, droprate =  21 }, -- Red Rock
            { itemid =  700, droprate =  17 }, -- Mahogany Log
            { itemid =  770, droprate =   9 }, -- Blue Rock
            { itemid =  810, droprate =  62 }, -- Fluorite
            { itemid =  774, droprate =  11 }, -- Purple Rock
            { itemid =  775, droprate =  11 }, -- Black Rock
            { itemid =  772, droprate =  11 }, -- Green Rock
            { itemid =  776, droprate =   9 }, -- White Rock
        },

        {
            { itemid =     0, droprate =  932 }, -- Nothing
            { itemid = 17440, droprate =   13 }, -- Kraken Club
            { itemid = 15185, droprate =   55 }, -- Walkure Mask
        },
    },

    -- KSNM Operation Desert Swarm
    [81] =
    {
        {
            { itemid =  1473, droprate = 813 }, -- High-quality Scorpion Shell
            { itemid = 13552, droprate =  55 }, -- Serket Ring
            { itemid =   901, droprate = 123 }, -- Venomous Claw
        },

        {
            { itemid = 17207, droprate = 216 }, -- Expunger
            { itemid = 18005, droprate = 295 }, -- Heart Snatcher
            { itemid = 18217, droprate = 239 }, -- Rampager
            { itemid = 17793, droprate = 231 }, -- Senjuinrikio
        },

        {
            { itemid = 17624, droprate = 504 }, -- Anubiss Knife
            { itemid =   655, droprate =   4 }, -- Adaman Ingot
            { itemid = 19027, droprate =  86 }, -- Claymore Grip
            { itemid =   747, droprate =  22 }, -- Orichalcum Ingot
            { itemid = 19025, droprate = 146 }, -- Pole Grip
            { itemid = 19024, droprate =  22 }, -- Sword Strap
        },

        {
            { itemid = 15295, droprate = 287 }, -- Hierarch Belt
            { itemid = 12407, droprate = 216 }, -- Palmerins Shield
            { itemid = 14871, droprate = 198 }, -- Trainers Gloves
            { itemid = 15294, droprate = 287 }, -- Warwolf Belt
        },

        {
            { itemid =  887, droprate =  52 }, -- Coral Fragment
            { itemid =  645, droprate =  56 }, -- Chunk Of Darksteel Ore
            { itemid =  902, droprate =  41 }, -- Demon Horn
            { itemid =  702, droprate =  63 }, -- Ebony Log
            { itemid =  737, droprate =  52 }, -- Chunk Of Gold Ore
            { itemid =  823, droprate =  26 }, -- Spool Of Gold Thread
            { itemid = 1465, droprate =  11 }, -- Slab Of Granite
            { itemid = 4173, droprate =  37 }, -- Hi-reraiser
            { itemid =  700, droprate = 101 }, -- Mahogany Log
            { itemid =  653, droprate =   0 }, -- Mythril Ingot
            { itemid =  644, droprate =  52 }, -- Chunk Of Mythril Ore
            { itemid =  703, droprate = 116 }, -- Petrified Log
            { itemid =  844, droprate =  15 }, -- Phoenix Feather
            { itemid =  942, droprate =  56 }, -- Philosophers Stone
            { itemid =  738, droprate =  45 }, -- Chunk Of Platinum Ore
            { itemid =  830, droprate =  22 }, -- Square Of Rainbow Cloth
            { itemid =  895, droprate =  67 }, -- Ram Horn
            { itemid = 1132, droprate = 119 }, -- Square Of Raxa
            { itemid = 4172, droprate =  45 }, -- Reraiser
            { itemid = 4174, droprate =  19 }, -- Vile Elixir
            { itemid = 4175, droprate =  41 }, -- Vile Elixir +1
            { itemid =  866, droprate =  34 }, -- Handful Of Wyvern Scales
        },

        {
            { itemid = 1110, droprate =  78 }, -- Vial Of Black Beetle Blood
            { itemid =  836, droprate =  56 }, -- Square Of Damascene Cloth
            { itemid =  658, droprate =  93 }, -- Damascus Ingot
            { itemid =  837, droprate =  56 }, -- Spool Of Malboro Fiber
            { itemid =  942, droprate = 157 }, -- Philosophers Stone
            { itemid =  844, droprate = 276 }, -- Phoenix Feather
            { itemid = 1132, droprate = 209 }, -- Square Of Raxa
        },
    },

    -- KSNM Prehistoric Pigeons
    [82] =
    {
        {
            { itemid = 17827, droprate = 217 }, -- Michishiba-no-tsuyu
            { itemid = 17699, droprate = 174 }, -- Dissector
            { itemid = 17275, droprate = 333 }, -- Coffinmaker
            { itemid = 18053, droprate = 174 }, -- Gravedigger
        },

        {
            { itemid = 19027, droprate = 144 }, -- Claymore Grip
            { itemid =   658, droprate = 275 }, -- Damascus Ingot
            { itemid =   843, droprate = 275 }, -- Giant Bird Plume
            { itemid = 19025, droprate = 203 }, -- Pole Grip
            { itemid = 19026, droprate = 116 }, -- Spear Strap
        },

        {
            { itemid =   655, droprate = 159 }, -- Adaman Ingot
            { itemid =   747, droprate = 290 }, -- Orichalcum Ingot
            { itemid = 14765, droprate = 406 }, -- Titanis Earring
        },

        {
            { itemid = 15325, droprate = 159 }, -- Evokers Boots
            { itemid = 14872, droprate = 217 }, -- Ostreger Mitts
            { itemid = 15181, droprate = 145 }, -- Pineal Hat
            { itemid = 15387, droprate = 159 }, -- Trackers Kecks
        },

        {
            { itemid =  887, droprate = 101 }, -- Coral Fragment
            { itemid =  645, droprate =  29 }, -- Chunk Of Darksteel Ore
            { itemid =  902, droprate =  29 }, -- Demon Horn
            { itemid =  702, droprate =  29 }, -- Ebony Log
            { itemid =  745, droprate = 101 }, -- Gold Ingot
            { itemid =  823, droprate =  29 }, -- Spool Of Gold Thread
            { itemid =  644, droprate =  29 }, -- Chunk Of Mythril Ore
            { itemid =  703, droprate =  58 }, -- Petrified Log
            { itemid =  738, droprate =  14 }, -- Chunk Of Platinum Ore
            { itemid =  830, droprate =  58 }, -- Square Of Rainbow Cloth
            { itemid =  895, droprate =  14 }, -- Ram Horn
            { itemid = 1132, droprate = 159 }, -- Square Of Raxa
            { itemid =  837, droprate =  72 }, -- Spool Of Malboro Fiber
        },

        {
            { itemid = 1110, droprate =  87 }, -- Vial Of Black Beetle Blood
            { itemid =  658, droprate =  14 }, -- Damascus Ingot
            { itemid =  836, droprate =  29 }, -- Square Of Damascene Cloth
            { itemid =  942, droprate = 174 }, -- Philosophers Stone
            { itemid =  844, droprate = 246 }, -- Phoenix Feather
            { itemid = 1132, droprate = 159 }, -- Square Of Raxa
        },
    },

    -- BCNM Steamed Sprouts
    [97] =
    {
        {
            { itemid =   748, droprate = 500 }, -- gold_beastcoin
            { itemid =   749, droprate = 500 }, -- mythril_beastcoin
        },

        {
            { itemid =     0, droprate = 750 }, -- nothing
            { itemid =  4174, droprate = 250 }, -- vile_elixir
        },

        {
            { itemid =     0, droprate = 600 }, -- nothing
            { itemid = 13237, droprate = 100 }, -- survival_belt
            { itemid = 13127, droprate = 100 }, -- guarding_gorget
            { itemid = 13405, droprate = 100 }, -- enhancing_earring
            { itemid = 12349, droprate = 100 }, -- balance_buckler
        },

        {
            { itemid =   776, droprate = 125 }, -- white_rock
            { itemid =   773, droprate = 125 }, -- translucent_rock
            { itemid =   774, droprate = 125 }, -- purple_rock
            { itemid =   769, droprate = 125 }, -- red_rock
            { itemid =   770, droprate = 125 }, -- blue_rock
            { itemid =   771, droprate = 125 }, -- yellow_rock
            { itemid =   772, droprate = 125 }, -- green_rock
            { itemid =   775, droprate = 125 }, -- black_rock
        },

        {
            { itemid =   790, droprate =  50 }, -- garnet
            { itemid =   793, droprate =  50 }, -- black_pearl
            { itemid =   811, droprate =  50 }, -- ametrine
            { itemid =   797, droprate =  50 }, -- painite
            { itemid =   792, droprate =  50 }, -- pearl
            { itemid =   699, droprate = 100 }, -- oak_log
            { itemid =   808, droprate = 100 }, -- goshenite
            { itemid =   815, droprate = 100 }, -- sphene
            { itemid =   701, droprate = 100 }, -- rosewood_log
            { itemid =   798, droprate = 100 }, -- turquoise
            { itemid =   794, droprate = 100 }, -- sapphire
            { itemid =   788, droprate = 150 }, -- peridot
        },

        {
            { itemid =     0, droprate = 125 }, -- nothing
            { itemid =  4717, droprate = 125 }, -- scroll_of_refresh
            { itemid =  4896, droprate = 125 }, -- fire_spirit_pact
            { itemid =  4751, droprate = 125 }, -- scroll_of_erase
            { itemid =  4874, droprate = 125 }, -- scroll_of_absorb-str
            { itemid =  4714, droprate = 125 }, -- scroll_of_phalanx
            { itemid =  4858, droprate = 125 }, -- scroll_of_ice_spikes
            { itemid =  4947, droprate = 125 }, -- scroll_of_utsusemi_ni
        },
    },

    -- BCNM Divine Punishers
    [98] =
    {
        {
            { itemid = 16726, droprate = 250 }, -- forsetis_axe
            { itemid = 17647, droprate = 250 }, -- aramiss_rapier
            { itemid = 17491, droprate = 250 }, -- spartan_cesti
            { itemid = 17429, droprate = 250 }, -- dominion_mace
        },

        {
            { itemid =     0, droprate = 250 }, -- nothing
            { itemid = 13054, droprate = 100 }, -- fuma_kyahan
            { itemid = 13555, droprate = 200 }, -- peace_ring
            { itemid = 13624, droprate = 200 }, -- enhancing_mantle
            { itemid = 13236, droprate = 150 }, -- master_belt
            { itemid = 13952, droprate = 100 }, -- ochiudos_kote
        },

        {
            { itemid =     0, droprate = 850 }, -- nothing
            { itemid =  4173, droprate = 100 }, -- hi-reraiser
            { itemid =  4175, droprate =  50 }, -- vile_elixir_+1
        },

        {
            { itemid =   774, droprate = 166 }, -- purple_rock
            { itemid =   773, droprate = 166 }, -- translucent_rock
            { itemid =   769, droprate = 167 }, -- red_rock
            { itemid =   775, droprate = 167 }, -- black_rock
            { itemid =   771, droprate = 167 }, -- yellow_rock
            { itemid =   776, droprate = 167 }, -- white_rock
        },

        {
            { itemid =   797, droprate = 125 }, -- painite
            { itemid =   791, droprate = 125 }, -- aquamarine
            { itemid =   810, droprate = 125 }, -- fluorite
            { itemid =   805, droprate = 125 }, -- zircon
            { itemid =   803, droprate = 125 }, -- sunstone
            { itemid =   801, droprate = 125 }, -- chrysoberyl
            { itemid =   802, droprate = 125 }, -- moonstone
            { itemid =   784, droprate = 125 }, -- jadeite
        },

        {
            { itemid =     0, droprate = 517 }, -- nothing
            { itemid =   700, droprate = 333 }, -- mahogany_log
            { itemid =   702, droprate = 150 }, -- ebony_log
        },

        {
            { itemid =   652, droprate = 350 }, -- steel_ingot
            { itemid =   653, droprate = 150 }, -- mythril_ingot
            { itemid =   654, droprate = 150 }, -- darksteel_ingot
            { itemid =   745, droprate = 350 }, -- gold_ingot
        },
    },

    -- BCNM Treasure and Tribulations
    [100] =
    {
        {
            { itemid = 13292, droprate =  75 }, -- Guardians Ring
            { itemid = 13287, droprate =  32 }, -- Kampfer Ring
            { itemid = 13300, droprate =  54 }, -- Conjurers Ring
            { itemid = 13298, droprate =  32 }, -- Shinobi Ring
            { itemid = 13293, droprate =  97 }, -- Slayers Ring
            { itemid = 13289, droprate =  75 }, -- Sorcerers Ring
            { itemid = 13286, droprate = 108 }, -- Soldiers Ring
            { itemid = 13294, droprate =  22 }, -- Tamers Ring
            { itemid = 13296, droprate =  65 }, -- Trackers Ring
            { itemid = 13299, droprate =  32 }, -- Drake Ring
            { itemid = 13290, droprate =  32 }, -- Fencers Ring
            { itemid = 13295, droprate =  86 }, -- Minstrels Ring
            { itemid = 13288, droprate =  86 }, -- Medicine Ring
            { itemid = 13291, droprate =  75 }, -- Rogues Ring
            { itemid = 13297, droprate =  11 }, -- Ronin Ring
            { itemid = 13447, droprate =  32 }, -- Platinum Ring
        },

        {
            { itemid = 13548, droprate = 376 }, -- Astral Ring
            { itemid = 13447, droprate =  22 }, -- Platinum Ring
            { itemid =  4818, droprate =  65 }, -- Scroll Of Quake
            { itemid =   859, droprate =  10 }, -- Ram Skin
            { itemid =  4172, droprate =  11 }, -- Reraiser
            { itemid =   653, droprate =  22 }, -- Mythril Ingot
            { itemid =  4902, droprate =  10 }, -- Light Spirit Pact
            { itemid =  4814, droprate =  32 }, -- Scroll Of Freeze
            { itemid =  4719, droprate =  43 }, -- Scroll Of Regen Iii
            { itemid =  4621, droprate =  32 }, -- Scroll Of Raise Ii
            { itemid =   703, droprate =  11 }, -- Petrified Log
            { itemid =   887, droprate =  11 }, -- Coral Fragment
            { itemid =   700, droprate =  11 }, -- Mahogany Log
            { itemid =   738, droprate =  43 }, -- Chunk Of Platinum Ore
            { itemid =   737, droprate = 108 }, -- Chunk Of Gold Ore
            { itemid =   645, droprate =  32 }, -- Chunk Of Darksteel Ore
            { itemid =   644, droprate =  65 }, -- Chunk Of Mythril Ore
            { itemid =   745, droprate =  10 }, -- Gold Ingot
            { itemid =   654, droprate =  11 }, -- Darksteel Ingot
            { itemid =   746, droprate =  11 }, -- Platinum Ingot
            { itemid =   702, droprate =  11 }, -- Ebony Log
            { itemid =   895, droprate =  11 }, -- Ram Horn
            { itemid =   902, droprate =  11 }, -- Demon Horn
            { itemid =  1116, droprate =   9 }, -- Manticore Hide
            { itemid =  1122, droprate =  11 }, -- Wyvern Skin
            { itemid =   866, droprate =  11 }, -- Handful Of Wyvern Scales
        },
    },

    -- BCNM Creeping Doom
    [104] =
    {
        {
            { itemid =   816, droprate = 1000 }, -- spool_of_silk_thread
        },

        {
            { itemid = 65535, droprate = 1000, amount = 3000 }, -- gil
        },

        {
            { itemid =     0, droprate = 700 }, -- nothing
            { itemid =   816, droprate = 300 }, -- spool_of_silk_thread
        },

        {
            { itemid =     0, droprate = 900 }, -- nothing
            { itemid =   816, droprate = 100 }, -- spool_of_silk_thread
        },

        {
            { itemid =     0, droprate = 300 }, -- nothing
            { itemid = 14733, droprate =  40 }, -- singers_earring
            { itemid = 14735, droprate =  50 }, -- ashigaru_earring
            { itemid = 14738, droprate =  50 }, -- magicians_earring
            { itemid = 13439, droprate =  50 }, -- warlocks_earring
            { itemid = 13437, droprate =  40 }, -- healers_earring
            { itemid = 14730, droprate =  45 }, -- esquires_earring
            { itemid = 13438, droprate =  50 }, -- wizards_earring
            { itemid = 14737, droprate =  40 }, -- wyvern_earring
            { itemid = 13435, droprate =  50 }, -- mercenarys_earring
            { itemid = 14731, droprate =  45 }, -- killer_earring
            { itemid = 13436, droprate =  45 }, -- wrestlers_earring
            { itemid = 14736, droprate =  50 }, -- genin_earring
            { itemid = 14734, droprate =  50 }, -- beaters_earring
            { itemid = 14729, droprate =  45 }, -- pilferers_earring
            { itemid = 14732, droprate =  50 }, -- trimmers_earring
        },

        {
            { itemid =     0, droprate = 700 }, -- nothing
            { itemid = 14733, droprate =  20 }, -- singers_earring
            { itemid = 14735, droprate =  20 }, -- ashigaru_earring
            { itemid = 14738, droprate =  20 }, -- magicians_earring
            { itemid = 13439, droprate =  20 }, -- warlocks_earring
            { itemid = 13437, droprate =  20 }, -- healers_earring
            { itemid = 14730, droprate =  20 }, -- esquires_earring
            { itemid = 13438, droprate =  20 }, -- wizards_earring
            { itemid = 14737, droprate =  20 }, -- wyvern_earring
            { itemid = 13435, droprate =  20 }, -- mercenarys_earring
            { itemid = 14731, droprate =  20 }, -- killer_earring
            { itemid = 13436, droprate =  20 }, -- wrestlers_earring
            { itemid = 14736, droprate =  20 }, -- genin_earring
            { itemid = 14734, droprate =  20 }, -- beaters_earring
            { itemid = 14729, droprate =  20 }, -- pilferers_earring
            { itemid = 14732, droprate =  20 }, -- trimmers_earring
        },

        {
            { itemid =    0, droprate = 500 }, -- nothing
            { itemid = 1134, droprate = 400 }, -- sheet_of_bast_parchment
            { itemid = 4116, droprate = 100 }, -- hi-potion
        },

        {
            { itemid =    0, droprate = 500 }, -- nothing
            { itemid =  694, droprate = 250 }, -- chestnut_log
            { itemid = 4132, droprate = 250 }, -- hi-ether
        },

        {
            { itemid =    0, droprate = 250 }, -- nothing
            { itemid = 4751, droprate = 150 }, -- scroll_of_erase
            { itemid = 4868, droprate = 200 }, -- scroll_of_dispel
            { itemid = 5070, droprate = 250 }, -- scroll_of_magic_finale
            { itemid = 4947, droprate = 150 }, -- scroll_of_utsusemi_ni
        },

        {
            { itemid =   0, droprate = 300 }, -- nothing
            { itemid = 814, droprate =  50 }, -- amber_stone
            { itemid = 645, droprate =  50 }, -- chunk_of_darksteel_ore
            { itemid = 690, droprate =  50 }, -- elm_log
            { itemid = 651, droprate =  50 }, -- iron_ingot
            { itemid = 643, droprate =  50 }, -- chunk_of_iron_ore
            { itemid = 795, droprate =  50 }, -- lapis_lazuli
            { itemid = 653, droprate =  50 }, -- mythril_ingot
            { itemid = 644, droprate =  50 }, -- chunk_of_mythril_ore
            { itemid = 799, droprate =  50 }, -- onyx
            { itemid = 807, droprate =  50 }, -- sardonyx
            { itemid = 744, droprate =  50 }, -- silver_ingot
            { itemid = 736, droprate =  50 }, -- chunk_of_silver_ore
            { itemid = 652, droprate =  50 }, -- steel_ingot
            { itemid = 806, droprate =  50 }, -- tourmaline
            { itemid = 796, droprate =  50 }, -- light opal
        },

        {
            { itemid =   0, droprate = 500 }, -- nothing
            { itemid = 814, droprate =  30 }, -- amber_stone
            { itemid = 645, droprate =  40 }, -- chunk_of_darksteel_ore
            { itemid = 690, droprate =  30 }, -- elm_log
            { itemid = 651, droprate =  30 }, -- iron_ingot
            { itemid = 643, droprate =  40 }, -- chunk_of_iron_ore
            { itemid = 795, droprate =  30 }, -- lapis_lazuli
            { itemid = 653, droprate =  40 }, -- mythril_ingot
            { itemid = 644, droprate =  40 }, -- chunk_of_mythril_ore
            { itemid = 799, droprate =  30 }, -- onyx
            { itemid = 807, droprate =  30 }, -- sardonyx
            { itemid = 744, droprate =  40 }, -- silver_ingot
            { itemid = 736, droprate =  30 }, -- chunk_of_silver_ore
            { itemid = 652, droprate =  30 }, -- steel_ingot
            { itemid = 806, droprate =  30 }, -- tourmaline
            { itemid = 796, droprate =  30 }, -- light opal
        },
    },

    -- BCNM Charming Trio
    [105] =
    {
        {
            { itemid = 1603, droprate = 1000 }, -- Mannequin Hands
        },

        {
            { itemid =  915, droprate = 250 }, -- Jar Of Toad Oil
            { itemid = 4112, droprate = 300 }, -- Potion
            { itemid = 4113, droprate = 180 }, -- Potion +1
            { itemid = 4898, droprate = 130 }, -- Air Spirit Pact
            { itemid =  825, droprate = 280 }, -- Square Of Cotton Cloth
        },

        {
            { itemid =   749, droprate = 250 }, -- Mythril Beastcoin
            { itemid = 17786, droprate = 190 }, -- Ganko
            { itemid =   827, droprate = 270 }, -- Square Of Wool Cloth
            { itemid = 18171, droprate = 145 }, -- Platoon Disc
            { itemid =   824, droprate = 295 }, -- Square Of Grass Cloth
            { itemid =   826, droprate = 260 }, -- Square Of Linen Cloth
        },

        {
            { itemid =     0, droprate = 800 }, -- Nothing
            { itemid = 18209, droprate = 167 }, -- Platoon Cutter
        },

        {
            { itemid =   0, droprate = 500 },  -- Nothing
            { itemid = 924, droprate = 500 },  -- Vial Of Fiend Blood
        },

        {
            { itemid =   0, droprate = 500 },  -- Nothing
            { itemid = 924, droprate = 500 },  -- Vial Of Fiend Blood
        },

        {
            { itemid = 18170, droprate = 235 }, -- Platoon Edge
            { itemid = 17271, droprate = 235 }, -- Platoon Gun
            { itemid = 17692, droprate = 235 }, -- Platoon Spatha
            { itemid = 17571, droprate = 235 }, -- Platoon Pole
            { itemid = 17820, droprate = 255 }, -- Gunromaru
            { itemid =  1601, droprate = 260 }, -- Mannequin Head
            { itemid =  4853, droprate = 250 }, -- Scroll Of Drain
            { itemid =   930, droprate = 190 }, -- Vial Of Beastman Blood
        },
    },

    -- BCNM Harem Scarem
    [106] =
    {
        {
            { itemid = 857, droprate = 1000 }, -- dhalmel_hide
        },

        {
            { itemid =   0, droprate =  500 }, -- nothing
            { itemid = 893, droprate =  500 }, -- giant_femur
        },

        {
            { itemid =    0, droprate = 500 }, -- nothing
            { itemid = 4359, droprate = 500 }, -- slice_of_dhalmel_meat
        },

        {
            { itemid =     0, droprate = 400 }, -- nothing
            { itemid = 13659, droprate = 150 }, -- mercenary_mantle
            { itemid = 13669, droprate = 150 }, -- beaters_mantle
            { itemid = 13665, droprate = 150 }, -- esquires_mantle
            { itemid = 13661, droprate = 150 }, -- healers_mantle
        },

        {
            { itemid =     0, droprate = 400 }, -- nothing
            { itemid = 12392, droprate = 200 }, -- wizards_shield
            { itemid = 12397, droprate = 200 }, -- trimmers_aspis
            { itemid = 12402, droprate = 200 }, -- wyvern_targe
        },

        {
            { itemid =    0, droprate = 200 }, -- nothing
            { itemid = 4751, droprate = 200 }, -- scroll_of_erase
            { itemid = 4868, droprate = 200 }, -- scroll_of_dispel
            { itemid = 5070, droprate = 200 }, -- scroll_of_magic_finale
            { itemid = 4947, droprate = 200 }, -- scroll_of_utsusemi_ni
        },

        {
            { itemid =   0, droprate = 250 }, -- nothing
            { itemid = 828, droprate = 250 }, -- square_of_velvet_cloth
            { itemid = 826, droprate = 250 }, -- square_of_linen_cloth
            { itemid = 827, droprate = 250 }, -- square_of_wool_cloth
        },

        {
            { itemid =    0, droprate = 600 }, -- nothing
            { itemid = 1601, droprate = 200 }, -- mannequin_head
            { itemid = 1603, droprate = 200 }, -- mannequin_hands
        },
    },

    -- KSNM Early Bird Catches the Wyrm
    [107] =
    {
        {
            { itemid = 3339, droprate = 1000 }, -- Jug Of Honey Wine
        },

        {
            { itemid =  1441, droprate = 312 }, -- Libation Abjuration
            { itemid = 17694, droprate = 182 }, -- Guespiere
            { itemid = 18047, droprate =  65 }, -- Havoc Scythe
            { itemid = 17937, droprate =  43 }, -- Leopard Axe
            { itemid = 18173, droprate = 181 }, -- Nokizaru Shuriken
            { itemid = 17823, droprate = 217 }, -- Shinsoku
            { itemid = 17575, droprate =  43 }, -- Somnus Signa
        },

        {
            { itemid =  722, droprate =  94 }, -- Divine Log
            { itemid = 1446, droprate = 196 }, -- Lacquer Tree Log
            { itemid =  703, droprate = 572 }, -- Petrified Log
            { itemid =  831, droprate =  43 }, -- Square Of Shining Cloth
        },

        {
            { itemid =  1442, droprate = 159 }, -- Oblation Abjuration
            { itemid = 17695, droprate = 151 }, -- Bayards Sword
            { itemid = 18088, droprate = 167 }, -- Dreizack
            { itemid = 17576, droprate =  95 }, -- Grim Staff
            { itemid = 17245, droprate =  95 }, -- Grosveneurs Bow
            { itemid = 17996, droprate =  56 }, -- Stylet
            { itemid = 17789, droprate = 341 }, -- Unsho
        },

        {
            { itemid =  4486, droprate = 522 }, -- Dragon Heart
            { itemid =  4272, droprate = 346 }, -- Slice Of Dragon Meat
            { itemid = 17928, droprate =  82 }, -- Juggernaut
            { itemid = 13189, droprate =  59 }, -- Speed Belt
        },

        {
            { itemid =  887, droprate =  32 }, -- Coral Fragment
            { itemid =  645, droprate =  71 }, -- Chunk Of Darksteel Ore
            { itemid =  902, droprate =  79 }, -- Demon Horn
            { itemid =  702, droprate =  56 }, -- Ebony Log
            { itemid =  737, droprate =  71 }, -- Chunk Of Gold Ore
            { itemid =  823, droprate =  32 }, -- Spool Of Gold Thread
            { itemid = 4173, droprate =  48 }, -- Hi-reraiser
            { itemid =  700, droprate = 127 }, -- Mahogany Log
            { itemid =  644, droprate = 111 }, -- Chunk Of Mythril Ore
            { itemid =  703, droprate = 183 }, -- Petrified Log
            { itemid =  942, droprate =  40 }, -- Philosophers Stone
            { itemid =  738, droprate =  56 }, -- Chunk Of Platinum Ore
            { itemid =  895, droprate =  24 }, -- Ram Horn
            { itemid = 1132, droprate = 119 }, -- Square Of Raxa
            { itemid = 4172, droprate =  56 }, -- Reraiser
            { itemid = 4175, droprate =  40 }, -- Vile Elixir +1
            { itemid =  866, droprate =  24 }, -- Handful Of Wyvern Scales
        },

        {
            { itemid = 1526, droprate = 210 }, -- Wyrm Beard
            { itemid = 1313, droprate = 775 }, -- Lock Of Sirens Hair
        },

        {
            { itemid =  4209, droprate =  94 }, -- Mind Potion
            { itemid =  4207, droprate = 130 }, -- Intelligence Potion
            { itemid =  4211, droprate = 116 }, -- Charisma Potion
            { itemid =  4213, droprate =  51 }, -- Icarus Wing
            { itemid =  1132, droprate = 246 }, -- Square Of Raxa
            { itemid = 17582, droprate = 246 }, -- Prelatic Pole
        },

        {
            { itemid = 4135, droprate = 290 }, -- Hi-ether +3
            { itemid = 4119, droprate = 225 }, -- Hi-potion +3
            { itemid = 4173, droprate = 210 }, -- Hi-reraiser
            { itemid = 4175, droprate = 217 }, -- Vile Elixir +1
        },

        {
            { itemid =  887, droprate =  87 }, -- Coral Fragment
            { itemid =  645, droprate =  80 }, -- Chunk Of Darksteel Ore
            { itemid =  902, droprate =  58 }, -- Demon Horn
            { itemid =  702, droprate =  72 }, -- Ebony Log
            { itemid =  737, droprate =  87 }, -- Chunk Of Gold Ore
            { itemid =  823, droprate =  14 }, -- Spool Of Gold Thread
            { itemid = 4173, droprate =  22 }, -- Hi-reraiser
            { itemid =  700, droprate =  80 }, -- Mahogany Log
            { itemid =  644, droprate =  36 }, -- Chunk Of Mythril Ore
            { itemid =  703, droprate = 145 }, -- Petrified Log
            { itemid =  844, droprate =   7 }, -- Phoenix Feather
            { itemid =  738, droprate =  51 }, -- Chunk Of Platinum Ore
            { itemid =  830, droprate =  29 }, -- Square Of Rainbow Cloth
            { itemid =  895, droprate =  36 }, -- Ram Horn
            { itemid = 1132, droprate =  72 }, -- Square Of Raxa
            { itemid = 4172, droprate =  29 }, -- Reraiser
            { itemid = 4174, droprate =  29 }, -- Vile Elixir
            { itemid = 4175, droprate =   7 }, -- Vile Elixir +1
            { itemid =  866, droprate =  22 }, -- Handful Of Wyvern Scales
        },

        {
            { itemid = 1110, droprate =  58 }, -- Vial Of Black Beetle Blood
            { itemid =  836, droprate =  36 }, -- Square Of Damascene Cloth
            { itemid =  658, droprate =  72 }, -- Damascus Ingot
            { itemid =  837, droprate =  22 }, -- Spool Of Malboro Fiber
            { itemid =  942, droprate = 275 }, -- Philosophers Stone
            { itemid =  844, droprate = 196 }, -- Phoenix Feather
            { itemid = 1132, droprate = 225 }, -- Square Of Raxa
        },
    },

    -- BCNM Royal Succession
    [108] =
    {
        {
            { itemid = 4596, droprate = 1000 }, -- bunch_of_wild_pamamas
        },

        {
            { itemid =     0, droprate = 300 }, -- nothing
            { itemid = 17572, droprate = 100 }, -- dusky_staff
            { itemid = 17995, droprate = 100 }, -- jongleurs_dagger
            { itemid = 17994, droprate = 100 }, -- calveleys_dagger
            { itemid = 17463, droprate = 100 }, -- sealed_mace
            { itemid = 17821, droprate = 100 }, -- himmel_stock
            { itemid = 17787, droprate = 100 }, -- kagehide
            { itemid = 17787, droprate = 100 }, -- ohaguro
        },

        {
            { itemid =     0, droprate = 100 }, -- nothing
            { itemid = 14736, droprate = 300 }, -- genin_earring
            { itemid = 13164, droprate = 300 }, -- agile_gorget
            { itemid = 13165, droprate = 300 }, -- jagd_gorget
        },

        {
            { itemid =    0, droprate = 370 }, -- nothing
            { itemid =  798, droprate = 100 }, -- turquoise
            { itemid = 4468, droprate = 100 }, -- bunch_of_pamamas
            { itemid =  829, droprate = 110 }, -- square_of_silk_cloth
            { itemid =  701, droprate = 140 }, -- rosewood_log
            { itemid =  792, droprate = 180 }, -- pearl
        },

        {
            { itemid = 4714, droprate = 250 }, -- scroll_of_phalanx
            { itemid = 4874, droprate = 250 }, -- scroll_of_absorb
            { itemid = 4717, droprate = 250 }, -- scroll_of_refresh
            { itemid = 4751, droprate = 250 }, -- scroll_of_erase
        },

        {
            { itemid =   0, droprate = 600 }, -- nothing
            { itemid = 748, droprate = 400 }, -- gold_beastcoin
        },
    },

    -- BCNM Rapid Raptors
    [109] =
    {
        {
            { itemid = 853, droprate = 1000 }, -- raptor_skin
        },

        {
            { itemid = 655, droprate = 1000 }, -- adaman_ingot
        },

        {
            { itemid =     0, droprate = 190 }, -- nothing
            { itemid = 14845, droprate = 110 }, -- sly_gauntlets
            { itemid = 14843, droprate = 120 }, -- spiked_finger_gauntlets
            { itemid = 14844, droprate = 140 }, -- rush_gloves
            { itemid = 15149, droprate = 140 }, -- rival_ribbon
            { itemid = 15148, droprate = 150 }, -- mana_circlet
            { itemid = 14842, droprate = 150 }, -- ivory_mitts
        },

        {
            { itemid =     0, droprate =  30 }, -- nothing
            { itemid = 13167, droprate = 100 }, -- storm_gorget
            { itemid = 13168, droprate = 100 }, -- intellect_torque
            { itemid = 13169, droprate = 120 }, -- benign_necklace
            { itemid = 13676, droprate = 130 }, -- heavy_mantle
            { itemid = 13166, droprate = 170 }, -- hateful_collar
            { itemid = 13677, droprate = 170 }, -- esoteric_mantle
            { itemid = 13679, droprate = 180 }, -- templars_mantle
        },

        {
            { itemid =   0, droprate = 230 }, -- nothing
            { itemid = 653, droprate = 200 }, -- mythril_ingot
            { itemid = 643, droprate = 200 }, -- chunk_of_iron_ore
            { itemid = 703, droprate = 370 }, -- petrified_log
        },

        {
            { itemid =    0, droprate = 560 }, -- nothing
            { itemid = 4172, droprate = 440 }, -- reraiser
        },
    },

    -- BCNM Wild Wild Whiskers
    [110] =
    {
        {
            { itemid = 1591, droprate = 1000 }, -- high-quality_coeurl_hide
        },

        {
            { itemid = 1591, droprate = 1000 }, -- high-quality_coeurl_hide
        },

        {
            { itemid = 1591, droprate = 1000 }, -- high-quality_coeurl_hide
        },

        {
            { itemid = 646, droprate = 1000 }, -- chunk_of_adaman_ore
        },

        {
            { itemid = 5253, droprate = 1000 }, -- hermes_quencher
        },

        {
            { itemid = 4213, droprate = 1000 }, -- icarus_wing
        },

        {
            { itemid = 15293, droprate = 365 }, -- gleemans_belt
            { itemid = 15292, droprate = 635 }, -- penitents_rope
        },

        {
            { itemid = 14663, droprate = 426 }, -- teleport_ring_mea
            { itemid = 14665, droprate = 574 }, -- teleport_ring_yhoat
        },

        {
            { itemid =     0, droprate = 848 }, -- nothing
            { itemid = 15185, droprate =  58 }, -- walkure_mask
            { itemid =  4173, droprate =  78 }, -- hi-reraiser
            { itemid =   702, droprate =  16 }, -- ebony_log
        },

        {
            { itemid =  771, droprate =  9 }, -- yellow_rock
            { itemid =  775, droprate =  9 }, -- black_rock
            { itemid =  791, droprate = 16 }, -- aquamarine
            { itemid =  769, droprate = 16 }, -- red_rock
            { itemid =  770, droprate = 16 }, -- blue_rock
            { itemid =  774, droprate = 16 }, -- purple_rock
            { itemid =  700, droprate = 33 }, -- mahogany_log
            { itemid =  801, droprate = 33 }, -- chrysoberyl
            { itemid =  805, droprate = 33 }, -- zircon
            { itemid =  652, droprate = 49 }, -- steel_ingot
            { itemid =  654, droprate = 49 }, -- darksteel_ingot
            { itemid =  773, droprate = 49 }, -- translucent_rock
            { itemid =  803, droprate = 49 }, -- sunstone
            { itemid =  802, droprate = 66 }, -- moonstone
            { itemid =  653, droprate = 82 }, -- mythril_ingot
            { itemid =  810, droprate = 82 }, -- fluorite
            { itemid =  745, droprate = 98 }, -- gold_ingot
            { itemid =  784, droprate = 98 }, -- jadeite
            { itemid =  797, droprate = 98 }, -- painite
            { itemid = 4175, droprate = 99 }, -- vile_elixir_+1
        },
    },

    -- BCNM Jungle Boogymen
    [129] =
    {
        {
            { itemid = 13153, droprate = 250 }, -- Dark Torque
            { itemid = 13156, droprate = 250 }, -- Elemental Torque
            { itemid = 13157, droprate = 250 }, -- Healing Torque
            { itemid = 13161, droprate = 250 }, -- Wind Torque
        },

        {
            { itemid =  751, droprate = 500 }, -- Platinum Beastcoin
            { itemid = 4874, droprate =  48 }, -- Scroll Of Absorb-STR
            { itemid = 4751, droprate = 143 }, -- Scroll Of Erase
            { itemid = 4714, droprate = 119 }, -- Scroll Of Phalanx
            { itemid = 4896, droprate =  48 }, -- Fire Spirit Pact
            { itemid = 1255, droprate =  48 }, -- Chunk Of Fire Ore
            { itemid = 1256, droprate =  48 }, -- Chunk Of Ice Ore
            { itemid = 1257, droprate =  48 }, -- Chunk Of Wind Ore
            { itemid = 1258, droprate =  48 }, -- Chunk Of Earth Ore
            { itemid = 1259, droprate =  48 }, -- Chunk Of Lightning Ore
            { itemid = 1260, droprate =  48 }, -- Chunk Of Water Ore
            { itemid = 1261, droprate =  48 }, -- Chunk Of Light Ore
            { itemid = 1262, droprate =  48 }, -- Chunk Of Dark Ore
        },

        {
            { itemid =  751, droprate = 833 }, -- Platinum Beastcoin
            { itemid = 1256, droprate = 167 }, -- Chunk Of Ice Ore
        },

        {
            { itemid = 13155, droprate = 250 }, -- Enfeebling Torque
            { itemid = 13148, droprate = 250 }, -- Evasion Torque
            { itemid = 13151, droprate = 250 }, -- Guarding Torque
            { itemid = 13158, droprate = 250 }, -- Summoning Torque
        },

        {
            { itemid =  654, droprate = 154 }, -- Darksteel Ingot
            { itemid =  797, droprate = 154 }, -- Painite
            { itemid =  745, droprate = 154 }, -- Gold Ingot
            { itemid =  791, droprate =  77 }, -- Aquamarine
            { itemid = 4175, droprate =  77 }, -- Vile Elixir +1
            { itemid =  653, droprate = 153 }, -- Mythril Ingot
            { itemid =  801, droprate =  30 }, -- Chrysoberyl
            { itemid =  802, droprate =  30 }, -- Moonstone
            { itemid =  803, droprate =  30 }, -- Sunstone
            { itemid =  805, droprate =  30 }, -- Zircon
            { itemid =  791, droprate =  30 }, -- Aquamarine
            { itemid =  702, droprate =  30 }, -- Ebony Log
            { itemid =  700, droprate =  30 }, -- Mahogany Log
            { itemid =  942, droprate =  30 }, -- Philosophers Stone
        },

        {
            { itemid =  654, droprate =  77 }, -- Darksteel Ingot
            { itemid =  802, droprate = 134 }, -- Moonstone
            { itemid =  652, droprate = 154 }, -- Steel Ingot
            { itemid =  801, droprate =  50 }, -- Chrysoberyl
            { itemid = 4173, droprate = 154 }, -- Hi-reraiser
            { itemid =  784, droprate = 121 }, -- Jadeite
            { itemid =  837, droprate =  10 }, -- Spool Of Malboro Fiber
            { itemid = 1110, droprate =  10 }, -- Vial Of Black Beetle Blood
            { itemid =  769, droprate =  30 }, -- Red Rock
            { itemid =  770, droprate =  30 }, -- Blue Rock
            { itemid =  771, droprate =  30 }, -- Yellow Rock
            { itemid =  772, droprate =  30 }, -- Green Rock
            { itemid =  773, droprate =  30 }, -- Translucent Rock
            { itemid =  774, droprate =  30 }, -- Purple Rock
            { itemid =  775, droprate =  30 }, -- Black Rock
            { itemid =  776, droprate =  30 }, -- White Rock
            { itemid =  810, droprate =  50 }, -- Fluorite
        },
    },

    -- BCNM Amphibian Assault
    [130] =
    {
        {
            { itemid = 13155, droprate = 250 }, -- Enfeebling Torque
            { itemid = 13152, droprate = 250 }, -- Divine Torque
            { itemid = 13150, droprate = 250 }, -- Shield Torque
            { itemid = 13160, droprate = 250 }, -- String Torque
        },

        {
            { itemid = 13156, droprate = 250 }, -- Elemental Torque
            { itemid = 13148, droprate = 250 }, -- Evasion Torque
            { itemid = 13151, droprate = 250 }, -- Guarding Torque
            { itemid = 13154, droprate = 250 }, -- Enhancing Torque
        },

        {
            { itemid = 1260, droprate = 125 }, -- Chunk Of Water Ore
            { itemid = 1257, droprate = 125 }, -- Chunk Of Wind Ore
            { itemid = 1256, droprate = 125 }, -- Chunk Of Ice Ore
            { itemid = 1259, droprate = 125 }, -- Chunk Of Lightning Ore
            { itemid = 1261, droprate = 125 }, -- Chunk Of Light Ore
            { itemid = 1255, droprate = 125 }, -- Chunk Of Fire Ore
            { itemid = 1262, droprate = 125 }, -- Chunk Of Dark Ore
            { itemid = 1258, droprate = 125 }, -- Chunk Of Earth Ore
        },

        {
            { itemid =     0, droprate = 750 }, -- nothing
            { itemid = 13158, droprate = 250 }, -- Summoning Torque
        },

        {
            { itemid =   0, droprate = 200 }, -- nothing
            { itemid = 751, droprate = 800 }, -- Platinum Beastcoin
        },

        {
            { itemid =    0, droprate = 375 }, -- nothing
            { itemid = 4896, droprate = 125 }, -- Fire Spirit Pact
            { itemid = 4874, droprate = 125 }, -- Scroll Of Absorb-str
            { itemid = 4751, droprate = 125 }, -- Scroll Of Erase
            { itemid = 4714, droprate = 125 }, -- Scroll Of Phalanx
            { itemid = 4621, droprate = 125 }, -- Scroll Of Raise Ii
        },

        {
            { itemid =    0, droprate = 888 }, -- nothing
            { itemid = 4175, droprate =  56 }, -- Vile Elixir +1
            { itemid = 4173, droprate =  56 }, -- Hi-reraiser
        },

        {
            { itemid = 810, droprate =  10 }, -- Fluorite
            { itemid = 797, droprate =  50 }, -- Painite
            { itemid = 803, droprate =  10 }, -- Sunstone
            { itemid = 784, droprate = 150 }, -- Jadeite
            { itemid = 791, droprate =  50 }, -- Aquamarine
            { itemid = 802, droprate = 150 }, -- Moonstone
            { itemid = 771, droprate =  50 }, -- Yellow Rock
            { itemid = 769, droprate =  50 }, -- Red Rock
            { itemid = 776, droprate = 100 }, -- White Rock
            { itemid = 772, droprate =  50 }, -- Green Rock
            { itemid = 773, droprate = 100 }, -- Translucent Rock
            { itemid = 801, droprate = 150 }, -- Chrysoberyl
            { itemid = 775, droprate =  50 }, -- Black Rock
            { itemid = 774, droprate =  50 }, -- Purple Rock
        },

        {
            { itemid = 751, droprate = 500 }, -- Platinum Beastcoin
            { itemid = 887, droprate = 222 }, -- Coral Fragment
            { itemid = 837, droprate =  10 }, -- Spool Of Malboro Fiber
            { itemid = 652, droprate = 111 }, -- Steel Ingot
            { itemid = 702, droprate =  56 }, -- Ebony Log
        },
    },

    -- BCNM Legion XI Comitatensis
    [193] =
    {
        {
            { itemid =     0, droprate = 100 }, -- nothing
            { itemid = 13148, droprate = 150 }, -- evasion_torque
            { itemid = 13149, droprate = 150 }, -- parrying_torque
            { itemid = 13151, droprate = 150 }, -- guarding_torque
            { itemid = 13159, droprate = 150 }, -- ninjutsu_torque
            { itemid = 13161, droprate = 150 }, -- wind_torque
            { itemid = 13158, droprate = 150 }, -- summoning_torque
        },

        {
            { itemid =     0, droprate = 100 }, -- nothing
            { itemid = 13152, droprate = 150 }, -- divine_torque
            { itemid = 13153, droprate = 150 }, -- dark_torque
            { itemid = 13154, droprate = 150 }, -- enhancing_torque
            { itemid = 13155, droprate = 150 }, -- enfeebling_torque
            { itemid = 13156, droprate = 150 }, -- elemental_torque
            { itemid = 13157, droprate = 150 }, -- healing_torque
        },

        {
            { itemid = 803, droprate = 100 }, -- sunstone
            { itemid = 737, droprate = 100 }, -- chunk_of_gold_ore
            { itemid = 784, droprate = 100 }, -- jadeite
            { itemid = 810, droprate = 100 }, -- fluorite
            { itemid = 654, droprate = 100 }, -- darksteel_ingot
            { itemid = 805, droprate = 100 }, -- zircon
            { itemid = 801, droprate = 100 }, -- chrysoberyl
            { itemid = 802, droprate = 100 }, -- moonstone
            { itemid = 797, droprate = 100 }, -- painite
            { itemid = 652, droprate = 100 }, -- steel_ingot
        },

        {
            { itemid =    0, droprate = 500 }, -- nothing
            { itemid = 4621, droprate = 500 }, -- scroll_of_raise_ii
        },

        {
            { itemid =    0, droprate = 950 }, -- nothing
            { itemid = 4175, droprate =  50 }, -- vile_elixir_+1
        },

        {
            { itemid = 771, droprate =  50 }, -- yellow_rock
            { itemid = 776, droprate =  50 }, -- white_rock
            { itemid = 702, droprate = 125 }, -- ebony_log
            { itemid = 751, droprate = 775 }, -- platinum_beastcoin
        },

        {
            { itemid =    0, droprate = 600 }, -- nothing
            { itemid = 1260, droprate =  50 }, -- chunk_of_water_ore
            { itemid = 1256, droprate =  50 }, -- chunk_of_ice_ore
            { itemid = 1259, droprate =  50 }, -- chunk_of_lightning_ore
            { itemid = 1258, droprate =  50 }, -- chunk_of_earth_ore
            { itemid = 1255, droprate =  50 }, -- chunk_of_fire_ore
            { itemid = 1261, droprate =  50 }, -- chunk_of_light_ore
            { itemid = 1262, droprate =  50 }, -- chunk_of_dark_ore
            { itemid = 1257, droprate =  50 }, -- chunk_of_wind_ore
        },
    },

    -- KSNM Eye of the Storm
    [198] =
    {
        {
            { itemid = 1124, droprate = 1000 }, -- Wyvern Wing
        },

        {
            { itemid = 1122, droprate = 1000 }, -- Wyvern Skin
        },

        {
            { itemid = 65535, droprate = 1000, amount = 24000 }, -- gil

        },

        {
            { itemid =   836, droprate = 216 }, -- Damascene Cloth
            { itemid =   658, droprate = 295 }, -- Damascus Ingot
            { itemid = 17938, droprate = 239 }, -- Woodville's Axe
            { itemid = 17998, droprate = 231 }, -- Thanatos Baselard
            { itemid = 17579, droprate = 231 }, -- Wyvern Perch
            { itemid = 18373, droprate = 231 }, -- Balin's Sword
            { itemid =  1110, droprate = 231 }, -- Beetle Blood
        },

        {
            { itemid = 18092, droprate = 104 }, -- Bourdonasse
            { itemid =  4175, droprate =  86 }, -- Vile Elixir +1
            { itemid =  4174, droprate =  22 }, -- Vile Elixir
            { itemid = 19025, droprate = 146 }, -- Pole Grip
            { itemid = 19024, droprate = 240 }, -- Sword Strap
        },

        {
            { itemid = 17246, droprate = 287 }, -- Ziska's Crossbow
            { itemid = 17790, droprate = 216 }, -- Unji
            { itemid = 17999, droprate = 198 }, -- Taillifer's Dagger
            { itemid = 18089, droprate = 287 }, -- Schiltron Spear
            { itemid =  4774, droprate = 287 }, -- Thunder III
        },

        {
            { itemid =  887, droprate =  52 }, -- Coral Fragment
            { itemid =  645, droprate =  56 }, -- Chunk Of Darksteel Ore
            { itemid =  902, droprate =  41 }, -- Demon Horn
            { itemid =  702, droprate =  63 }, -- Ebony Log
            { itemid =  737, droprate =  52 }, -- Chunk Of Gold Ore
            { itemid =  823, droprate =  26 }, -- Spool Of Gold Thread
            { itemid = 1465, droprate =  11 }, -- Slab Of Granite
            { itemid = 4173, droprate =  37 }, -- Hi-reraiser
            { itemid =  700, droprate = 101 }, -- Mahogany Log
            { itemid =  653, droprate =  30 }, -- Mythril Ingot
            { itemid =  644, droprate =  52 }, -- Chunk Of Mythril Ore
            { itemid =  703, droprate = 116 }, -- Petrified Log
            { itemid =  844, droprate =  15 }, -- Phoenix Feather
            { itemid =  942, droprate =  56 }, -- Philosophers Stone
            { itemid =  738, droprate =  45 }, -- Chunk Of Platinum Ore
            { itemid =  830, droprate =  22 }, -- Square Of Rainbow Cloth
            { itemid =  895, droprate =  67 }, -- Ram Horn
            { itemid = 1132, droprate = 119 }, -- Square Of Raxa
            { itemid = 4172, droprate =  45 }, -- Reraiser
            { itemid =    0, droprate = 400 }, -- Nothing
        },

        {
            { itemid =  836, droprate =  56 }, -- Square Of Damascene Cloth
            { itemid =  658, droprate =  93 }, -- Damascus Ingot
            { itemid =  837, droprate =  56 }, -- Spool Of Malboro Fiber
            { itemid =  942, droprate = 157 }, -- Philosophers Stone
            { itemid =  844, droprate = 176 }, -- Phoenix Feather
            { itemid = 1132, droprate = 109 }, -- Square Of Raxa
            { itemid =    0, droprate = 500 }, -- Nothing
        }
    },

    -- BCNM Demolition Squad
    [520] =
    {
        {
            { itemid = 14833, droprate = 125 }, -- marine_m_gloves
            { itemid = 14834, droprate = 125 }, -- marine_f_gloves
            { itemid = 14835, droprate = 125 }, -- wood_gauntlets
            { itemid = 14836, droprate = 125 }, -- wood_gloves
            { itemid = 14837, droprate = 125 }, -- creek_m_mitts
            { itemid = 14838, droprate = 125 }, -- creek_f_mitts
            { itemid = 14839, droprate = 125 }, -- river_gauntlets
            { itemid = 14840, droprate = 125 }, -- dune_bracers
        },

        {
            { itemid = 474, droprate = 125 }, -- red_chip
            { itemid = 475, droprate = 125 }, -- blue_chip
            { itemid = 476, droprate = 125 }, -- yellow_chip
            { itemid = 477, droprate = 125 }, -- green_chip
            { itemid = 478, droprate = 125 }, -- clear_chip
            { itemid = 479, droprate = 125 }, -- purple_chip
            { itemid = 480, droprate = 125 }, -- white_chip
            { itemid = 481, droprate = 125 }, -- black_chip
        },

        {
            { itemid =   0, droprate = 125 }, -- nothing
            { itemid = 653, droprate = 125 }, -- mythril_ingot
            { itemid = 702, droprate = 125 }, -- ebony_log
            { itemid = 703, droprate = 125 }, -- petrified_log
            { itemid = 791, droprate = 125 }, -- aquamarine
            { itemid = 797, droprate = 125 }, -- painite
            { itemid = 801, droprate = 125 }, -- chrysoberyl
            { itemid = 802, droprate = 125 }, -- moonstone
        },

        {
            { itemid =    0, droprate = 625 }, -- nothing
            { itemid = 4749, droprate = 125 }, -- scroll_of_reraise_ii
            { itemid = 4812, droprate = 125 }, -- scroll_of_flare
            { itemid = 5005, droprate = 125 }, -- scroll_of_valor_minuet_iv
        },

        {
            { itemid =    0, droprate = 700 }, -- nothing
            { itemid = 4119, droprate =  75 }, -- hi-potion_+3
            { itemid = 4173, droprate = 150 }, -- hi-reraiser
            { itemid = 4174, droprate =  50 }, -- vile_elixir
            { itemid = 4175, droprate =  25 }, -- vile_elixir_+1
        },
    },

    -- BCNM Die by the Sword
    [521] =
    {
        {
            { itemid = 16655, droprate = 1000 }, -- rusty_pick
        },

        {
            { itemid = 14735, droprate = 71 }, -- ashigaru_earring
            { itemid = 14730, droprate = 71 }, -- esquires_earring
            { itemid = 14738, droprate = 72 }, -- magicians_earring
            { itemid = 13435, droprate = 72 }, -- mercenarys_earring
            { itemid = 14729, droprate = 72 }, -- pilferers_earring
            { itemid = 14733, droprate = 71 }, -- singers_earring
            { itemid = 14732, droprate = 71 }, -- trimmers_earring
            { itemid = 13439, droprate = 72 }, -- warlocks_earring
            { itemid = 13438, droprate = 72 }, -- wizards_earring
            { itemid = 13436, droprate = 72 }, -- wrestlers_earring
            { itemid = 14737, droprate = 71 }, -- wyvern_earring
            { itemid = 14734, droprate = 71 }, -- beaters_earring
            { itemid = 14736, droprate = 71 }, -- genin_earring
            { itemid = 14731, droprate = 71 }, -- killer_earring
        },

        {
            { itemid = 15285, droprate = 71 }, -- avatar_belt
            { itemid = 15271, droprate = 71 }, -- axe_belt
            { itemid = 15272, droprate = 72 }, -- cestus_belt
            { itemid = 15276, droprate = 72 }, -- dagger_belt
            { itemid = 15281, droprate = 72 }, -- gun_belt
            { itemid = 15282, droprate = 71 }, -- katana_obi
            { itemid = 15284, droprate = 71 }, -- lance_belt
            { itemid = 15283, droprate = 72 }, -- sarashi
            { itemid = 15278, droprate = 72 }, -- scythe_belt
            { itemid = 15277, droprate = 72 }, -- shield_belt
            { itemid = 15280, droprate = 71 }, -- song_belt
            { itemid = 15274, droprate = 71 }, -- staff_belt
            { itemid = 15279, droprate = 71 }, -- pick_belt
            { itemid = 15275, droprate = 71 }, -- rapier_belt
        },

        {
            { itemid = 4751, droprate = 200 }, -- scroll_of_erase
            { itemid = 4715, droprate = 200 }, -- scroll_of_reprisal
            { itemid = 4868, droprate = 200 }, -- scroll_of_dispel
            { itemid = 5070, droprate = 200 }, -- scroll_of_magic_finale
            { itemid = 4947, droprate = 200 }, -- gscroll_of_utsusemi_nin_belt
        },

        {
            { itemid =     0, droprate = 775 }, -- nothing
            { itemid =   745, droprate =  50 }, -- gold_ingot
            { itemid =   746, droprate =  50 }, -- platinum_ingot
            { itemid =   703, droprate =  50 }, -- petrified_log
            { itemid = 16606, droprate =  75 }, -- rusty_greatsword
        },

        {
            { itemid =    0, droprate = 250 }, -- nothing
            { itemid = 1601, droprate = 250 }, -- mannequin_head
            { itemid = 1602, droprate = 250 }, -- mannequin_body
            { itemid = 1603, droprate = 250 }, -- mannequin_hands
        },

        {
            { itemid =    0, droprate = 667 }, -- nothing
            { itemid = 4132, droprate = 333 }, -- hi-ether
        },
    },

    -- BCNM Let Sleeping Dogs Die
    [522] =
    {
        {
            { itemid = 858, droprate = 1000 }, -- wolf_hide
        },

        {
            { itemid = 940, droprate = 1000 }, -- revival_tree_root
        },

        {
            { itemid =    0, droprate = 100 }, -- nothing
            { itemid = 1601, droprate = 300 }, -- mannequin_head
            { itemid = 1602, droprate = 300 }, -- mannequin_body
            { itemid = 1603, droprate = 300 }, -- mannequin_hands
        },

        {
            { itemid =    0, droprate = 250 }, -- nothing
            { itemid = 4877, droprate = 125 }, -- scroll_of_absorb-agi
            { itemid = 4878, droprate = 125 }, -- scroll_of_absorb-int
            { itemid = 4876, droprate = 125 }, -- scroll_of_absorb-vit
            { itemid = 4751, droprate = 125 }, -- scroll_of_erase
            { itemid = 4947, droprate = 125 }, -- scroll_of_utsusemi_ni
            { itemid = 4868, droprate = 125 }, -- scroll_of_dispel
        },

        {
            { itemid =     0, droprate = 100 }, -- nothing
            { itemid = 12398, droprate = 150 }, -- singers_shield
            { itemid = 12393, droprate = 150 }, -- warlocks_shield
            { itemid = 12403, droprate = 150 }, -- magicians_shield
            { itemid = 13670, droprate = 150 }, -- ashigaru_mantle
            { itemid = 13662, droprate = 150 }, -- wizards_mantle
            { itemid = 13666, droprate = 150 }, -- killer_mantle
        },
    },

    -- BCNM Brothers D'Aurphe
    [523] =
    {
        {
            { itemid = 14202, droprate = 125 }, -- creek_m_clomps
            { itemid = 14203, droprate = 125 }, -- creek_f_clomps
            { itemid = 14198, droprate = 125 }, -- marine_m_boots
            { itemid = 14199, droprate = 125 }, -- marine_f_boots
            { itemid = 14200, droprate = 125 }, -- wood_m_ledelsens
            { itemid = 14201, droprate = 125 }, -- wood_f_ledelsens
            { itemid = 14205, droprate = 125 }, -- dune_sandals
            { itemid = 14204, droprate = 125 }, -- river_gaiters
        },

        {
            { itemid = 17472, droprate =  43 }, -- cross-counters
            { itemid =   801, droprate =  10 }, -- chrysoberyl
            { itemid =   784, droprate =  94 }, -- jadeite
            { itemid =   803, droprate = 113 }, -- sunstone
            { itemid =   805, droprate =  75 }, -- zircon
            { itemid =   478, droprate =  10 }, -- clear_chip
            { itemid =   474, droprate =  38 }, -- red_chip
            { itemid =   476, droprate =  38 }, -- yellow_chip
            { itemid =   745, droprate = 151 }, -- gold_ingot
            { itemid =   774, droprate =  19 }, -- purple_rock
            { itemid =   776, droprate =  19 }, -- white_rock
        },

        {
            { itemid =  652, droprate = 132 }, -- steel_ingot
            { itemid =  773, droprate = 113 }, -- translucent_rock
            { itemid =  654, droprate = 113 }, -- darksteel_ingot
            { itemid =  797, droprate =  50 }, -- painite
            { itemid =  702, droprate = 132 }, -- ebony_log
            { itemid =  480, droprate =  10 }, -- white_chip
            { itemid =  802, droprate = 151 }, -- moonstone
            { itemid =  805, droprate =  75 }, -- zircon
            { itemid =  810, droprate =  57 }, -- fluorite
            { itemid =  801, droprate =  57 }, -- chrysoberyl
            { itemid =  772, droprate =  38 }, -- green_rock
            { itemid = 4173, droprate =  38 }, -- hi-reraiser
            { itemid = 4175, droprate =  38 }, -- vile_elixir_+1
        },

        {
            { itemid = 4812, droprate = 283 }, -- scroll_of_flare
            { itemid = 5005, droprate = 358 }, -- scroll_of_valor_minuet_iv
            { itemid = 4749, droprate = 264 }, -- scroll_of_reraise_ii
        },

        {
            { itemid =     0, droprate = 957 }, -- nothing
            { itemid = 17187, droprate =  43 }, -- eurytos_bow
        },

        {
            { itemid =   0, droprate = 582 }, -- nothing
            { itemid = 653, droprate = 302 }, -- mythril_ingot
            { itemid = 475, droprate =  19 }, -- blue_chip
            { itemid = 481, droprate =  38 }, -- black_chip
            { itemid = 479, droprate =  10 }, -- purple_chip
            { itemid = 477, droprate =  19 }, -- green_chip
            { itemid = 700, droprate =  10 }, -- mahogany_log
            { itemid = 769, droprate =  10 }, -- red_rock
            { itemid = 775, droprate =  10 }, -- black_rock
        },

        {
            { itemid =    0, droprate = 887 }, -- nothing
            { itemid = 4119, droprate = 113 }, -- hi-potion_+3
        },
    },

    -- BCNM Undying Promise
    [524] =
    {
        {
            { itemid = 880, droprate = 1000 }, -- bone_chip
        },

        {
            { itemid = 880, droprate = 1000 }, -- bone_chip
        },

        {
            { itemid = 17994, droprate = 175 }, -- calveleys_dagger
            { itemid = 12405, droprate = 175 }, -- jennet_shield
            { itemid = 17995, droprate = 175 }, -- jongleurs_dagger
            { itemid = 17821, droprate = 175 }, -- kagehide
            { itemid = 17787, droprate = 175 }, -- ohaguro
            { itemid =   702, droprate = 125 }, -- ebony_log
        },

        {
            { itemid = 18086, droprate = 200 }, -- behourd_lance
            { itemid = 12404, droprate = 200 }, -- elegant_shield
            { itemid = 18046, droprate = 200 }, -- mutilator
            { itemid = 18210, droprate = 200 }, -- raifu
            { itemid = 18350, droprate = 200 }, -- tourney_patas
        },

        {
            { itemid =  645, droprate =  60 }, -- chunk_of_darksteel_ore
            { itemid =  745, droprate =  60 }, -- gold_ingot
            { itemid =  748, droprate =  60 }, -- gold_beastcoin
            { itemid =  749, droprate =  60 }, -- mythril_beastcoin
            { itemid =  653, droprate =  60 }, -- mythril_ingot
            { itemid =  746, droprate =  60 }, -- platinum_ingot
            { itemid =  895, droprate =  60 }, -- ram_horn
            { itemid = 4717, droprate = 125 }, -- scroll_of_refresh
            { itemid = 4172, droprate = 145 }, -- reraiser
            { itemid = 4947, droprate = 125 }, -- scroll_of_utsusemi_ni
            { itemid = 4858, droprate = 125 }, -- scroll_of_ice_spikes
            { itemid =  866, droprate =  60 }, -- handful_of_wyvern_scales
        },

        {
            { itemid =  887, droprate =  78 }, -- coral_fragment
            { itemid =  654, droprate =  78 }, -- darksteel_ingot
            { itemid =  902, droprate =  78 }, -- demon_horn
            { itemid = 4896, droprate = 125 }, -- fire_spirit_pact
            { itemid =  737, droprate =  78 }, -- chunk_of_gold_ore
            { itemid =  653, droprate =  78 }, -- mythril_ingot
            { itemid =  703, droprate =  78 }, -- petrified_log
            { itemid =  895, droprate =  78 }, -- ram_horn
            { itemid = 4874, droprate = 125 }, -- scroll_of_absorb-str
            { itemid = 4751, droprate = 125 }, -- scroll_of_erase
            { itemid = 4714, droprate = 125 }, -- scroll_of_phalanx
        },

        {
            { itemid =   0, droprate = 850 }, -- nothing
            { itemid = 859, droprate =  50 }, -- ram_skin
            { itemid = 700, droprate =  50 }, -- mahogany_log
            { itemid = 738, droprate =  50 }, -- platinum_ore
        },
    },

    -- BCNM Factory Rejects
    [525] =
    {
        {
            { itemid = 1165, droprate = 1000 }, -- doll_shard
        },

        {
            { itemid = 914, droprate = 1000 }, -- vial_of_mercury
        },

        {
            { itemid =   0, droprate = 500 }, -- nothing
            { itemid = 748, droprate = 500 }, -- gold_beastcoin
        },

        {
            { itemid =     0, droprate = 250 }, -- nothing
            { itemid = 18210, droprate = 250 }, -- raifu
            { itemid = 17696, droprate = 250 }, -- buzzard_tuck
            { itemid = 17995, droprate = 250 }, -- jongleurs_dagger
        },

        {
            { itemid =     0, droprate = 200 }, -- nothing
            { itemid = 13675, droprate = 400 }, -- rearguard_mantle
            { itemid = 13674, droprate = 400 }, -- agile_mantle
        },

        {
            { itemid =    0, droprate = 750 }, -- nothing
            { itemid = 4947, droprate = 125 }, -- scroll_of_utsusemi_ni
            { itemid = 4714, droprate = 125 }, -- scroll_of_phalanx
        },
    },

    -- BCNM Idol Thoughts
    [526] =
    {
        {
            { itemid = 955, droprate = 1000 }, -- golem_shard
        },

        {
            { itemid = 1465, droprate = 1000 }, -- slab_of_granite
        },

        {
            { itemid = 1441, droprate = 500 }, -- libation_abjuration
            { itemid = 1442, droprate = 500 }, -- oblation_abjuration
        },

        {
            { itemid =    0, droprate = 875 }, -- nothing
            { itemid = 1441, droprate = 125 }, -- scroll_of_freeze
        },

        {
            { itemid =     0, droprate = 200 }, -- nothing
            { itemid = 18175, droprate = 200 }, -- optical_needle
            { itemid = 18177, droprate = 200 }, -- kakanpu
            { itemid = 18174, droprate = 200 }, -- mantra_coin
            { itemid = 18176, droprate = 200 }, -- nazar_bonjuk
        },

        {
            { itemid =   0, droprate = 100 }, -- nothing
            { itemid = 644, droprate = 300 }, -- chunk_of_mythril_ore
            { itemid = 745, droprate = 300 }, -- gold_ingot
            { itemid = 746, droprate = 300 }, -- platinum_ingot
        },
    },

    -- BCNM An Awful Autopsy
    [527] =
    {
        {
            { itemid = 849, droprate = 1000 }, -- undead_skin
        },

        {
            { itemid =     0, droprate = 500 }, -- nothing
            { itemid = 15149, droprate = 250 }, -- rival_ribbon
            { itemid = 15151, droprate = 250 }, -- super_ribbon
        },

        {
            { itemid =     0, droprate = 250 }, -- nothing
            { itemid = 14842, droprate = 250 }, -- ivory_mitts
            { itemid = 14844, droprate = 250 }, -- rush_gloves
            { itemid = 14845, droprate = 250 }, -- sly_gauntlets
        },

        {
            { itemid =     0, droprate = 200 }, -- nothing
            { itemid = 13676, droprate = 200 }, -- heavy_mantle
            { itemid = 13677, droprate = 200 }, -- esoteric_mantle
            { itemid = 13678, droprate = 200 }, -- snipers_mantle
            { itemid = 13679, droprate = 200 }, -- templars_mantle
        },

        {
            { itemid =     0, droprate = 200 }, -- nothing
            { itemid = 13166, droprate = 200 }, -- hateful_collar
            { itemid = 13167, droprate = 200 }, -- storm_gorget
            { itemid = 13168, droprate = 200 }, -- intellect_torque
            { itemid = 13169, droprate = 200 }, -- benign_necklace
        },

        {
            { itemid =   0, droprate = 200 }, -- nothing
            { itemid = 654, droprate = 200 }, -- darksteel_ingot
            { itemid = 702, droprate = 200 }, -- ebony_log
            { itemid = 703, droprate = 200 }, -- petrified_log
            { itemid = 745, droprate = 200 }, -- gold_ingot
        },

        {
            { itemid =    0, droprate = 875 }, -- nothing
            { itemid = 4818, droprate = 125 }, -- scroll_of_quake
        },
    },

    -- BCNM Celery
    [528] =
    {
        {
            { itemid = 1441, droprate = 1000 }, -- libation_abjuration
        },

        {
            { itemid = 1442, droprate = 1000 }, -- oblation_abjuration
        },

        {
            { itemid = 830, droprate = 1000 }, -- square_of_rainbow_cloth
        },

        {
            { itemid = 829, droprate = 1000 }, -- square_of_silk_cloth
        },

        {
            { itemid = 829, droprate = 1000 }, -- square_of_silk_cloth
        },

        {
            { itemid = 829, droprate = 1000 }, -- square_of_silk_cloth
        },

        {
            { itemid = 14662, droprate = 250 }, -- teleport_ring_dem
            { itemid = 14663, droprate = 250 }, -- teleport_ring_mea
            { itemid = 17841, droprate = 250 }, -- nursemaids_harp
            { itemid = 18004, droprate = 250 }, -- trailers_kukri
        },

        {
            { itemid = 14761, droprate = 250 }, -- elusive_earring
            { itemid = 13691, droprate = 250 }, -- knightly_mantle
            { itemid = 13689, droprate = 250 }, -- hi-ether_tank
            { itemid = 13688, droprate = 250 }, -- hi-potion_tank
        },

        {
            { itemid =     0, droprate = 950 }, -- nothing
            { itemid = 15185, droprate =  50 }, -- walkure_mask
        },

        {
            { itemid =  791, droprate =  50 }, -- aquamarine
            { itemid =  801, droprate =  50 }, -- chrysoberyl
            { itemid =  654, droprate = 100 }, -- darksteel_ingot
            { itemid =  702, droprate =  50 }, -- ebony_log
            { itemid =  810, droprate =  50 }, -- fluorite
            { itemid =  745, droprate =  50 }, -- gold_ingot
            { itemid = 4173, droprate =  50 }, -- hi-reraiser
            { itemid =  784, droprate =  50 }, -- jadeite
            { itemid =  700, droprate =  50 }, -- mahogany_log
            { itemid =  802, droprate =  50 }, -- moonstone
            { itemid =  653, droprate =  50 }, -- mythril_ingot
            { itemid =  797, droprate =  50 }, -- painite
            { itemid =  769, droprate =  50 }, -- red_rock
            { itemid =  652, droprate =  50 }, -- steel_ingot
            { itemid =  803, droprate =  50 }, -- sunstone
            { itemid =  773, droprate =  50 }, -- translucent_rock
            { itemid =  776, droprate =  50 }, -- white_rock
            { itemid = 4175, droprate =  50 }, -- vile_elixir_+1
            { itemid =  805, droprate =  50 }, -- zircon
        },
    },
}

-- 1130 : moon orb
-- 1131 : star orb
-- 1175 : clotho orb
-- 1177 : comet orb
-- 1180 : atropos orb
-- 1551 : cloudy orb
-- 1552 : sky orb
-- 1553 : themis orb

local dungeonInfo = {
    [1] = { itemid = 1131, level = 40 }, -- BCNM Tails of Woe
    [2] = { itemid = 1130, level = 60 }, -- BCNM Dismemberment Brigade
    [4] = { itemid = 1177, level = 50 }, -- BCNM Hostile Herbivores
    [8] = { itemid = 1552, level = 30 }, -- BCNM Carapace Combatants
    [9] = { itemid = 1551, level = 20 }, -- BCNM Shooting Fish
    [10] = { itemid = 1552, level = 30 }, -- BCNM Dropping Like Flies
    [11] = { itemid = 1553, level = 75 }, -- KSNM Horns of War
    [12] = { itemid = 1131, level = 40 }, -- BCNM Under Observation
    [13] = { itemid = 1177, level = 50 }, -- BCNM Eye of the Tiger
    [14] = { itemid = 1130, level = 60 }, -- BCNM Shots in the Dark
    [15] = { itemid = 1175, level = 75 }, -- KSNM Double Dragonian
    [17] = { itemid = 1180, level = 75 }, -- KSNM Contaminated Colosseum
    [34] = { itemid = 1551, level = 20 }, -- BCNM Wings of Fury
    [35] = { itemid = 1552, level = 30 }, -- BCNM Petrifying Pair
    [36] = { itemid = 1552, level = 30 }, -- BCNM Toadal Recall
    [65] = { itemid = 1131, level = 40 }, -- BCNM The Worm's Turn
    [73] = { itemid = 1552, level = 30 }, -- BCNM Birds of a Feather
    [74] = { itemid = 1551, level = 20 }, -- BCNM Crustacean Conundrum
    [75] = { itemid = 1552, level = 30 }, -- BCNM Grove Guardians
    [97] = { itemid = 1131, level = 40 }, -- BCNM Steamed Sprouts
    [104] = { itemid = 1552, level = 30 }, -- BCNM Creeping Doom
    [105] = { itemid = 1551, level = 20 }, -- BCNM Charming Trio
    [106] = { itemid = 1552, level = 30 }, -- BCNM Harem Scarem
    [108] = { itemid = 1131, level = 40 }, -- BCNM Royal Succession
    [521] = { itemid = 1552, level = 30 }, -- BCNM Die by the Sword
    [522] = { itemid = 1552, level = 30 }, -- BCNM Let Sleeping Dogs Die
    [524] = { itemid = 1131, level = 40 }, -- BCNM Undying Promise
    [525] = { itemid = 1131, level = 40 }, -- BCNM Factory Rejects
}

local function handleLootRolls(player, lootTable)

    for i = 1, #lootTable, 1 do
        local lootGroup = lootTable[i]

        if lootGroup then
            local max = 0

            for _, entry in pairs(lootGroup) do
                max = max + entry.droprate
            end

            local roll = math.random(max)

            for _, entry in pairs(lootGroup) do
                max = max - entry.droprate

                if roll > max then
                    if entry.itemid ~= 0 then
                        if entry.itemid == 65535 then
                            local gil = entry.amount
                            npcUtil.giveCurrency(player, 'gil', gil)
                            break
                        end

                        player:addTreasure(entry.itemid)
                    end

                    break
                end
            end
        end
    end
end

commandObj.onTrigger = function(player, battlefieldId)

    if battlefieldId == nil then
        player:PrintToPlayer('!simbcnm <battlefield id>')
        return
    end

    local info = dungeonInfo[battlefieldId]
    if info == nil then
        player:PrintToPlayer('Unknown battlefield')
        return
    end

    local lootTable = loot[battlefieldId]
    if lootTable == nill then
        playerPrintToPlayer('Battlefield has no loot')
    end

    if player:getMainLvl() < info.level then
        player:PrintToPlayer(string.format('You must be level %d or higher', info.level))
        return
    end

    if player:hasItem(info.itemid, xi.inv.INVENTORY) then
        player:delItem(info.itemid, 1, xi.inv.INVENTORY)
        handleLootRolls(player, lootTable)
    else
        local item = GetItemByID(info.itemid)
        player:PrintToPlayer(string.format('You need this item in your inventory : %s', item:getName()))
    end
end

return commandObj