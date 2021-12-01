Config = {
    Event = {
        { -- Diamant
            timeh = "10", timem = "00", -- time timeh:timem
            illegal = false, -- If give dirty money and deactivate blips
            pos = vector3(-1714.28, 2700.24, 0.98), radius = 60.0, -- The event zone
            ped = { -- Ped for sell
                name = "Vente diamant", pos = vector3(287.78, 2843.896, 43.68), h = 119.0, animation = "WORLD_HUMAN_GUARD_STAND", label = "a_m_m_soucent_02", text = "Appuyez sur ~b~E~s~ pour vendre vos ~b~diamant"
            },
            SellItems = { -- Items to sell
                { name = "dimamant", price = 2500, label = "diamond"}
            },
            Missions = { -- All the missions in the event zone
                { name = "Dimamant", pos = vector3(-1725.91, 2713.72, 0.88), notif = "Appuyez sur ~g~E~s~ pour fouiller la terre", anim = "CODE_HUMAN_MEDIC_TEND_TO_DEAD", time = 9, give = "diamond", chance = 75},
                { name = "Dimamant", pos = vector3(-1714.21, 2689.87, 0.76), notif = "Appuyez sur ~g~E~s~ pour fouiller la terre", anim = "CODE_HUMAN_MEDIC_TEND_TO_DEAD", time = 12, give = "diamond", chance = 80},
                { name = "Dimamant", pos = vector3(-1672.332, 2686.563, 0.63), notif = "Appuyez sur ~g~E~s~ pour fouiller la terre", anim = "CODE_HUMAN_MEDIC_TEND_TO_DEAD", time = 10, give = "diamond", chance = 70}
            }
        },
        { -- Recolte fruits cayo
            timeh = "13", timem = "00",
            illegal = false,
            pos = vector3(4873.88, -4626.78, 14.62), radius = 80.0,
            ped = {
                name = "Vente de fruits", pos = vector3(5002.21, -5192.58, 1.48), h = 317.2, animation = "WORLD_HUMAN_GUARD_STAND", label = "a_m_m_soucent_02", text = "Appuyez sur ~b~E~s~ pour vendre vos ~b~fruits"
            },
            SellItems = {
                { name = "Mangue", price = 450, label = "mangue"},
                { name = "Papaye", price = 500, label = "papaye"}
            },
            Missions = {
                { name = "Mangue", pos = vector3(4918.62, -4636.52, 12.74), notif = "Appuyez sur ~g~E~s~ pour fouiller l'arbre", anim = "CODE_HUMAN_MEDIC_TEND_TO_DEAD", time = 4, give = "mangue", chance = 98},
                { name = "Papaye", pos = vector3(4911.77, -4654.48, 12.05), notif = "Appuyez sur ~g~E~s~ pour fouiller l'arbre", anim = "CODE_HUMAN_MEDIC_TEND_TO_DEAD", time = 5, give = "papaye", chance = 93},
                { name = "Mangue", pos = vector3(4930.62, -4650.52, 12.63), notif = "Appuyez sur ~g~E~s~ pour fouiller l'arbre", anim = "CODE_HUMAN_MEDIC_TEND_TO_DEAD", time = 4, give = "mangue", chance = 97},
                { name = "Mangue", pos = vector3(4905.52, -4669.03, 11.30), notif = "Appuyez sur ~g~E~s~ pour fouiller l'arbre", anim = "CODE_HUMAN_MEDIC_TEND_TO_DEAD", time = 3, give = "mangue", chance = 99},
                { name = "Papaye", pos = vector3(4884.48, -4673.92, 10.41), notif = "Appuyez sur ~g~E~s~ pour fouiller l'arbre", anim = "CODE_HUMAN_MEDIC_TEND_TO_DEAD", time = 5, give = "papaye", chance = 91}
            }
        },
        { -- Pêche légal
            timeh = "15", timem = "00",
            illegal = false,
            pos = vector3(1045.2, 3878.95, 39.5), radius = 80.0,
            ped = {
                name = "Vente de poisson", pos = vector3(1302.67, 4225.36, 32.89), h = 82.9, animation = "WORLD_HUMAN_GUARD_STAND", label = "a_m_m_soucent_02", text = "Appuyez sur ~b~E~s~ pour vendre vos ~b~poissons"
            },
            SellItems = {
                { name = "Saumon", price = 750, label = "saumon"},
                { name = "Hareng", price = 600, label = "hareng"}
            },
            plonge = { -- Ped for scuba
                name = "Tenue de plongée", pos = vector3(1299.17, 4214.94, 32.88), h = 357.11, animation = "WORLD_HUMAN_GUARD_STAND", label = "a_m_m_soucent_02", text = "Appuyez sur ~b~E~s~ pour prendre/rendre une tenue de ~b~plongée"
            },
            Missions = {
                { name = "Hareng", pos = vector3(1074.043, 3896.443, 11.75345), notif = "Appuyez sur ~g~E~s~ pour pêcher le poissons", anim = "", skin = "a_c_fish", time = 4, give = "hareng", chance = 98},
                { name = "Saumon", pos = vector3(1017.67, 3876.097, 17.59307), notif = "Appuyez sur ~g~E~s~ pour pêcher le poissons", anim = "", skin = "a_c_fish", time = 5, give = "saumon", chance = 93},
                { name = "Hareng", pos = vector3(1059.105, 3887.089, -5.714271), notif = "Appuyez sur ~g~E~s~ pour pêcher le poissons", anim = "", skin = "a_c_fish", time = 4, give = "hareng", chance = 97},
                { name = "Hareng", pos = vector3(1038.711, 3915.26, -0.3781191), notif = "Appuyez sur ~g~E~s~ pour pêcher le poissons", anim = "", skin = "a_c_fish", time = 3, give = "hareng", chance = 99},
                { name = "Saumon", pos = vector3(1012.944, 3839.85, 20.64265), notif = "Appuyez sur ~g~E~s~ pour pêcher le poissons", anim = "", skin = "a_c_fish", time = 5, give = "saumon", chance = 91}
            }
        },
        { -- Pêche illégal
            timeh = "18", timem = "00",
            illegal = true,
            pos = vector3(-3420.21, 3146.36, 2.95), radius = 80.0,
            ped = {
                name = "Vente de poisson", pos = vector3(-168.77, 6144.67, 41.66), h = 74.5, animation = "WORLD_HUMAN_GUARD_STAND", label = "a_m_m_soucent_02", text = "Appuyez sur ~b~E~s~ pour vendre vos ~b~poissons"
            },
            SellItems = {
                { name = "Requin", price = 2500, label = "requin"},
                { name = "Requin marteau", price = 1000, label = "requinm"}
            },
            plonge = {
                name = "Tenue de plongée", pos = vector3(-3184.672, 3260.407, 0.254729), h = 306.49871826172, animation = "WORLD_HUMAN_GUARD_STAND", label = "a_m_m_soucent_02", text = "Appuyez sur ~b~E~s~ pour prendre/rendre une tenue de ~b~plongée"
            },
            Missions = {
                { name = "Requin", pos = vector3(-3419.627, 3139.034, -27.52332), notif = "Appuyez sur ~g~E~s~ pour pêcher le requin", anim = "", skin = "a_c_sharktiger", time = 4, give = "requin", chance = 98},
                { name = "Requin marteau", pos = vector3(-3454.684, 3130.645, -24.83865), notif = "Appuyez sur ~g~E~s~ pour pêcher le requin", anim = "", skin = "a_c_sharkhammer", time = 5, give = "requinm", chance = 93},
                { name = "Requin", pos = vector3(-3442.708, 3175.342, -13.82528), notif = "Appuyez sur ~g~E~s~ pour pêcher le requin", anim = "", skin = "a_c_sharktiger", time = 4, give = "requin", chance = 97},
                { name = "Requin", pos = vector3(-3377.485, 3128.351, -27.25766), notif = "Appuyez sur ~g~E~s~ pour pêcher le requin", anim = "", skin = "a_c_sharkhammer", time = 3, give = "requin", chance = 99},
                { name = "Requin marteau", pos = vector3(-3391.702, 3144.197, -16.72759), notif = "Appuyez sur ~g~E~s~ pour pêcher le requin", anim = "", skin = "a_c_sharktiger", time = 5, give = "requinm", chance = 91}
            }
        },
        { -- Arme illegal
            timeh = "22", timem = "00",
            illegal = false,
            pos = vector3(487.2964, -3292.501, 6.069255), radius = 80.0,
            crate = {
                vector3(503.4395, -3286.109, 5.089265),
                vector3(464.2006, -3281.69, 5.089265),
                vector3(488.5237, -3271.656, 5.089263),
                vector3(469.4983, -3301.434, 5.089263),
                vector3(486.0754, -3294.547, 5.089258)
            },
            ped = {
                name = "Fabriquation d'arme", pos = vector3(3824.84, 4442.71, 1.83), h = 98.66, animation = "WORLD_HUMAN_GUARD_STAND", label = "a_m_m_soucent_02", text = "Appuyez sur ~b~E~s~ pour fabriquer des ~b~armes"
            },
            SellItems = {
                { name = "Uzi", component = { -- Name in the menu
                    { name = "Chargeur", number = 4, label = "chargeur" }, -- Items needs to craft
                    { name = "Viseur", number = 2, label = "viseur" },
                    { name = "Cross", number = 2, label = "cross" },
                    { name = "Corp d'armes", number = 5, label = "weaponc" }
                }, label = "weapon_microsmg"} -- label of the gived item
            },
            Missions = {
                { name = "Viseur", pos = vector3(502.0677, -3285.93, 6.069265), notif = "Appuyez sur ~g~E~s~ pour fouiller la caisse", anim = "CODE_HUMAN_MEDIC_TEND_TO_DEAD", time = 15, give = "viseur", chance = 60},
                { name = "Cross", pos = vector3(465.4757, -3281.616, 6.069265), notif = "Appuyez sur ~g~E~s~ pour fouiller la caisse", anim = "CODE_HUMAN_MEDIC_TEND_TO_DEAD", time = 12, give = "cross", chance = 55},
                { name = "Chargeur", pos = vector3(488.5282, -3272.68, 6.069263), notif = "Appuyez sur ~g~E~s~ pour fouiller la caisse", anim = "CODE_HUMAN_MEDIC_TEND_TO_DEAD", time = 10, give = "chargeur", chance = 69},
                { name = "Chargeur", pos = vector3(470.7692, -3301.375, 6.069263), notif = "Appuyez sur ~g~E~s~ pour fouiller la caisse", anim = "CODE_HUMAN_MEDIC_TEND_TO_DEAD", time = 12, give = "chargeur", chance = 49},
                { name = "Corp d'armes", pos = vector3(486.0312, -3293.4, 6.069258), notif = "Appuyez sur ~g~E~s~ pour fouiller la caisse", anim = "CODE_HUMAN_MEDIC_TEND_TO_DEAD", time = 10, give = "weaponc", chance = 47}
            }
        }
    },
    Clothe = {
        m = {
            ['tshirt_1'] = 15, ['tshirt_2'] = 0,
            ['torso_1'] = 243, ['torso_2'] = 5,
            ['decals_1'] = 0, ['decals_2'] = 0,
            ['arms'] = 8,
            ['pants_1'] = 94, ['pants_2'] = 0,
            ['shoes_1'] = 67, ['shoes_2'] = 0,
            ['glasses_1'] = 26, ['glasses_2'] = 0,
            ['helmet_1'] = -1, ['helmet_2'] = 0,
            ['chain_1'] = 0, ['chain_2'] = 0,
            ['ears_1'] = -1, ['ears_2'] = 0
        },
        f = {
            ['tshirt_1'] = 1, ['tshirt_2'] = 0,
            ['torso_1'] = 251, ['torso_2'] = 5,
            ['decals_1'] = 0, ['decals_2'] = 0,
            ['arms'] = 6,
            ['pants_1'] = 97, ['pants_2'] = 5,
            ['shoes_1'] = 70, ['shoes_2'] = 0,
            ['glasses_1'] = 28, ['glasses_2'] = 0,
            ['helmet_1'] = -1, ['helmet_2'] = 0,
            ['chain_1'] = 0, ['chain_2'] = 0,
            ['ears_1'] = -1, ['ears_2'] = 0
        }
    }
}
