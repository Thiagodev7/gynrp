ConfigClient = {
    unidades = 20,
    distance = 2, -- Distancia que poderá abrir as lojas
    keyBind = true, -- Se o inventário terá key bind ou seja os 5 primeiros itens ele poderá usar com as teclas 1,2,3,4,5 respectivamente
    keyBindWeapon = false, -- Se o inventário terá a opção e pegar a arma na mão e desativar o tab ao usar a keybind
    ip = "http://181.215.253.55/skips/inventario", -- caso use ip por xammp bote o caminho assim http://ip/caminho e tire as iamgens do fx_manifest
    percentual = 0.85, -- Percentual para venda de itens nesse caso padrão está para 85% do valor do item
    tecla = 'oem_3', -- tecla que abrirá o inventario padrão é o aspas
    blackItemList = {
        trunckchest = {
            "identidade",
            "nada"
        }, -- Itens que não poderá colocar no chest das dos carros
        chest = {
            "identidade",
            "nada"
        },-- Itens que não poderá colocar no chest das facções
        homes = {
            "identidade",
            "nada"
        }, -- Itens que não poderá colocar no chest das casas
      
    }, -- Itens que não poderá colocar nos trunckchests, chests, homes


    lojas = {
		Mecanico = {
            locs = { 
                { 914.17, -2099.58, 30.46 },
                { 916.0, -2100.99, 30.46 },
                { -481.5, -165.35, 38.4 },
            }, 
            perm = "mecanico.permissao",
            itens = {
              -- ['nitro'] = {price = 30000},
               ['repairkit'] = {price = 1000},
               ['militec'] = {price = 500},
               ['pneu'] = {price = 250},
               ['ferramenta'] = {price = 30},
               ['rastreador'] = {price = 8000},

               ['nitro'] = {price = 30000},
               ['pneu'] = {price = 2500},
               ['suspensaoar'] = {price = 20000},
               ['raceticket'] = {price = 5000},
               ['moduloxenon'] = {price = 10000},
               ['moduloneon'] = {price = 10000},
            },
        }, 	
        

        Driftking = {
            locs = { 
                { 121.86, -3029.7, 7.05 }
            }, 
            --perm = "driftking.permissao",
            itens = {
               ['nitro'] = {price = 30000},
               ['pneu'] = {price = 2500},
               ['suspensaoar'] = {price = 20000},
               ['raceticket'] = {price = 5000},
               ['moduloxenon'] = {price = 10000},
               ['moduloneon'] = {price = 10000},
            },
        }, 	

        Itens_Ilegais = {
            locs = { 
                { 4504.34, -4554.52, 4.18 }
            }, 
            perm = "farc.permissao",
            itens = {
               ['algemas'] = {price = 20000},
               ['corda'] = {price = 10000},
               ['capuz'] = {price = 20000},
               ['lockpick'] = {price = 10000},
               ['pendrive'] = {price = 35000},
               ['pano'] = {price = 5000},
               ['linha'] = {price = 500},
               ['bombaadesiva'] = {price = 15000},
               ['ziplock'] = {price = 20},
            },
        }, 
        Contrabandista = {
            locs = { 
                { -1890.53, 2064.5, 145.58 }
            }, 
            perm = "cartel.permissao",
            itens = {
               ['gatilho'] = {price = 2000},
               ['mola'] = {price = 1250},
               ['placademetal'] = {price = 1500},
              -- ['capsula'] = {price = 250},
            },
        }, 	
        -- Loja_Casino = {
        --     locs = { -- Casino Store
        --         { 1116.06, 219.73, -49.43 }
        --     }, 
        --     perm = nil,
        --     itens = {
        --        ['ficha'] = {price = 100},
        --        ['ticketroleta'] = {price = 10000},
        --     },
        -- }, 	
       

        Venda_Minerios = {
            locs = { -- Venda minerios
                { -622.35, -229.87, 38.06 }
            }, 
            perm = nil,
            itens = {
               ['ferro2'] = {price = 30},
               ['ouro'] = {price = 50},
               ['diamante2'] = {price = 100},
            },
        }, 
        
        Venda_Acougue = {
            locs = { -- Venda peixes
                { 75.96, -1748.84, 29.3 }
            }, 
            perm = nil,
            itens = {
               ['dourado'] = {price = 240},
               ['corvina'] = {price = 210},
               ['pacu'] = {price = 210},
               ['pintado'] = {price = 210},
               ['pirarucu'] = {price = 225},
               ['tilapia'] = {price = 210},
               ['tucunare'] = {price = 215},
               ['salmao'] = {price = 220},
               ['carnecrua'] = {price = 200},
               ['couro'] = {price = 55},
            },
        }, 	

        Venda_Graos = {
            locs = { -- Venda Graos
                { 69.22, -1757.12, 29.3 }
            }, 
            perm = nil,
            itens = {
               ['graos'] = {price = 50},
            },
        }, 	
        
        Farmacia = {
            locs = { 
                { -492.39, -340.79, 42.33 }
            }, 
            perm = "paramedico.permissao",
            itens = {
               ['xerelto'] = {price = 0},
               ['dorflex'] = {price = 0},
               ['cicatricure'] = {price = 0},
               ['rebite'] = {price = 0},
               ['paracetanal'] = {price = 0},
               ['bandagem'] = {price = 0},
            },
        }, 


        DigitalDen = {
            locs = { 
                { -657.44, -857.41, 24.5 }
            }, 
            perm = nil,
            itens = {
               ['celular'] = {price = 2500},
               ['smartwatch'] = {price = 5000},
               ['radio'] = {price = 2500},
               ['notebook'] = {price = 25000},
            },
        }, 

        Aeroporto = {
            locs = { 
                { -1069.47, -2835.66, 27.71 }
            }, 
            perm = nil,
            itens = {
               ['celular'] = {price = 3000},
               ['chocolate'] = {price = 250},
               ['cafe'] = {price = 150},

            },
        }, 

        carrefour = {
            locs = {
                { 66.05, -1734.77, 29.3 },
                { 64.07, -1736.91, 29.3 },
                { 62.29, -1739.27, 29.3 },
            },
            perm = nil,
            itens = {
               ['hamburguer'] = {price = 90},
               ['frango'] = {price = 50},
               ['salsicha'] = {price = 50},
               ['alface'] = {price = 50},
               ['tomate'] = {price = 50},
               ['farinha'] = {price = 25},
               ['calabresa'] = {price = 50},
               ['queijo'] = {price = 60},
               ['salgadinho'] = {price = 150},
               ['rosquinha'] = {price = 150},
               ['chocolate'] = {price = 150},
               ['batata'] = {price = 90},

               ['limonada'] = {price = 110},
               ['agua'] = {price = 125},
               ['whisky'] = {price = 200},
               ['vodka'] = {price = 250},
               ['refrigerante'] = {price = 110},
               ['cafe'] = {price = 90},
            },
        }, 

        burguershot = {
            locs = {
                { -1198.88, -895.26, 14.0 },
            }, -- 
            perm = "burguershot.permissao",
            itens = {
               ['limonada'] = {price = 33},
               ['agua'] = {price = 40},
               ['refrigerante'] = {price = 20},
               ['cafe'] = {price = 30},
               ['sorvete'] = {price = 100},
            
            },
        }, 

        lojaderoupa = {
            locs = {
                { -1126.1, -1438.73, 5.23 },
            }, -- 
            perm = nil,
            itens = {
             --  ['mochila'] = {price = 30000},
               ['roupas'] = {price = 5000},
               ['chapeu'] = {price = 2000},
               ['oculos'] = {price = 2000},
               ['mascara'] = {price = 2000},
               ['skate'] = {price = 10000},
               ['isqueiro'] = {price = 250},
               ['seda'] = {price = 25},
            },
        }, 

        
        
        Cacadores = {
            locs = {
                { -678.88, 5837.86, 17.34 },
            }, -- 
            perm = nil,
            itens = {
               ['wbody|WEAPON_MUSKET'] = {price = 20000},
               ['wbody|WEAPON_KNIFE'] = {price = 10000},
               ['wammo|WEAPON_MUSKET'] = {price = 20},
               ['mascara'] = {price = 2000},
            },
        }, 
        

        ammunation = {
            locs = {
                { 1692.62,3759.50,34.70 },
                { 252.89,-49.25,69.94 },
                { 843.28,-1034.02,28.19 },
                { -331.35,6083.45,31.45 },
                { -663.15,-934.92,21.82 },
                { -1305.18,-393.48,36.69 },
                { -1118.80,2698.22,18.55 },
                { 2568.83,293.89,108.73 },
                { -3172.68,1087.10,20.83 },
                { 21.32,-1106.44,29.79 },
                { 811.19,-2157.67,29.61 }
            }, -- 
            perm = nil,
            itens = {
               ['wbody|WEAPON_KNIFE'] = {price = 10000},
               ['wbody|WEAPON_DAGGER'] = {price = 10000},
               ['wbody|WEAPON_KNUCKLE'] = {price = 10000},
               ['wbody|WEAPON_MACHETE'] = {price = 10000},
               ['wbody|WEAPON_SWITCHBLADE'] = {price = 10000},
               ['wbody|WEAPON_WRENCH'] = {price = 10000},
               ['wbody|WEAPON_HAMMER'] = {price = 10000},
               ['wbody|WEAPON_GOLFCLUB'] = {price = 10000},
               ['wbody|WEAPON_CROWBAR'] = {price = 10000},
               ['wbody|WEAPON_HATCHET'] = {price = 10000},
               ['wbody|WEAPON_BAT'] = {price = 10000},
               ['wbody|WEAPON_BATTLEAXE'] = {price = 10000},
               ['wbody|WEAPON_POOLCUE'] = {price = 10000},
               ['wbody|WEAPON_STONE_HATCHET'] = {price = 10000},
            },
        }, 

        pescaria = {
            locs = {
                { 1527.0, 3782.21, 34.54 },
            }, -- 
            perm = nil,
            itens = {
                ['isca'] = {price = 50},
                ['vara'] = {price = 250},
             
            },
        }, 

        Venda_Cartoes = {
            locs = {
                { 148.02, 6361.9, 31.53 },
            }, -- 
            perm = "anonymous.permissao",
            itens = {
                ['cartao1'] = {price = 50},
                ['cartao2'] = {price = 75},
                ['cartao3'] = {price = 100},
                ['cartao4'] = {price = 150},
             
            },
        }, 

        ammunation2 = {
            locs = {
                { 18.07, -1111.09, 29.8 },
            },
            perm = nil,
            itens = {
               
               ['garrafavazia'] = {price = 20},
               ['ferramenta'] = {price = 50},
               ['borrifador'] = {price = 100},
               ['furadeira'] = {price = 10000},
               ['serra'] = {price = 10000},
            },
        }, 

    },

    chestFac = {
        ['Bau-Anoymous'] = {
            loc = {747.17315673828,-1905.1430664062,29.461990356445},
            weight = 5000, 
            perm = "anonymous.permissao",
            slots = 100, 
            webhook = "https://discord.com/api/webhooks/1096474977462669322/2xJeofmtdYRGDWH4ekixZkGh0Lo2Bn05ux1QNdudrzuRaNGbEOJByWEgm4MhpdzQsZIz",
        },

        ['Bau-Anoymous2'] = {
            loc = {747.34, -1913.26, 29.47},
            weight = 5000, 
            perm = "anonymous2.permissao",
            slots = 100, 
            webhook = "https://discord.com/api/webhooks/1096475588774076516/w7TgeqLen4sT4r5hY5u6AeCbw8NAdVcXxY41jOjKmw6ogj4ypYHeqN7isipzcqMDaunp",
        },       
        
        ['Bau-Verdes2'] = {
            loc = {-2378.99, 1733.87, 212.13},
            weight = 5000, 
            perm = "verdes.permissao",
            slots = 100, 
            webhook = "https://discord.com/api/webhooks/1096475988126351491/et1046m7Wef8lx2gmhbtH8FlNd7hwJyons7MY5h0a7XOUFtWd1TNSjRaYDXkHaPDHJE5",
        },

        ['Bau-Verdes3'] = {
            loc = {-2359.57, 1752.8, 212.14},
            weight = 5000, 
            perm = "verdes2.permissao",
            slots = 100, 
            webhook = "https://discord.com/api/webhooks/1096476337075650651/P0gwsTCsLq_XOzVtok4-LG-eQ152hZKc6HVvA50jgaLU5J5URgvAH-DhwRy5bshqrK9J",
        },

        ['Bau-Verdes'] = {
            loc = {147.9, -1707.67, 22.21},
            weight = 500, 
            perm = "mendanha.permissao",
            slots = 30, 
            webhook = "https://discord.com/api/webhooks/1096475988126351491/et1046m7Wef8lx2gmhbtH8FlNd7hwJyons7MY5h0a7XOUFtWd1TNSjRaYDXkHaPDHJE5",
        },

        ['Bau-Roxos'] = {
            loc = {583.65, -427.91, 17.63},
            weight = 500, 
            perm = "verdes.permissao",
            slots = 30, 
            webhook = "https://discord.com/api/webhooks/1096476952510070804/Bvcwu798nWr0zgfyVlhCxx-eu9rA9M8In1M4-hH-Pbr3VVjBrvKt5pOt8ZnTElXyobNI",
        },

        ['Bau-Roxos2'] = {
            loc = {1273.03, -255.86, 98.06},
            weight = 5000, 
            perm = "mendanha.permissao",
            slots = 100, 
            webhook = "https://discord.com/api/webhooks/1096476952510070804/Bvcwu798nWr0zgfyVlhCxx-eu9rA9M8In1M4-hH-Pbr3VVjBrvKt5pOt8ZnTElXyobNI",
        },

        ['Bau-Roxos3'] = {
            loc = {1260.65, -216.97, 99.99},
            weight = 5000, 
            perm = "mendanha2.permissao",
            slots = 100, 
            webhook = "https://discord.com/api/webhooks/1096477087013032047/-9CpUUWfoxycodiJSgmhDpYAsfHtOXq4y4mLtZ5spbssUT0ve5ZXWPcOD-TKRpUnykJh",
        },

        ['Bau-Amarelos'] = {
            loc = {-1256.76, -1126.27, 0.79},
            weight = 500, 
            perm = "amarelos.permissao",
            slots = 30, 
            webhook = "https://discord.com/api/webhooks/1096477358346739722/ldTE_ZIt9hg3PG4mxhaLzLqPz0m39eu9YPvFxeN5JOtrF9WkP2VxUDIKM_oPiY3SzWrL",
        },

        ['Bau-Amarelos2'] = {
            loc = {569.34, 2441.48, 59.44},
            weight = 5000, 
            perm = "amarelos.permissao",
            slots = 100, 
            webhook = "https://discord.com/api/webhooks/1096477358346739722/ldTE_ZIt9hg3PG4mxhaLzLqPz0m39eu9YPvFxeN5JOtrF9WkP2VxUDIKM_oPiY3SzWrL",
        },

        ['Bau-Amarelos3'] = {
            loc = {599.89, 2430.86, 58.51},
            weight = 5000, 
            perm = "amarelos2.permissao",
            slots = 100, 
            webhook = "https://discord.com/api/webhooks/1096477595421397012/1dU-YB9xxlUP3GaPGDRYDTuQZzY0kDQ8vEGpvbwzj8bjZagZ4p_hYMkNcjxHcVrpqnTS",
        },

        ['Bau-Bahamas1'] = {
            loc = {943.21, -1486.78, 23.05},
            weight = 5000, 
            perm = "bahamas.permissao",
            slots = 100, 
            webhook = "https://discord.com/api/webhooks/1096479604648185948/GAavOPwBOA3A-cMh61vjXa05cux_WX8uBihYMF9hqMGNAZfCiOMQadBxs0Rgy1V95Wmg",
        },

        ['Bau-Bahamas2'] = {
            loc = {-1367.81, -612.79, 30.32},
            weight = 5000, 
            perm = "bahamas.permissao",
            slots = 100, 
            webhook = "https://discord.com/api/webhooks/1096479604648185948/GAavOPwBOA3A-cMh61vjXa05cux_WX8uBihYMF9hqMGNAZfCiOMQadBxs0Rgy1V95Wmg",
        },

        ['Bau-Bahamas3'] = {
            loc = {-1369.06, -623.75, 30.32},
            weight = 5000, 
            perm = "bahamas2.permissao",
            slots = 100, 
            webhook = "https://discord.com/api/webhooks/1096479784957132830/VigtRtL1cznzYhD99T2gWgF6YAhOP4DPv4CbIQFBQC0MV7_WEW0W8mrWxlDgPENgPYfy",
        },

        ['Bau-PlayBoy'] = {
            loc = {-1502.32, 118.32, 55.67},
            weight = 5000, 
            perm = "playboy.permissao",
            slots = 100, 
            webhook = "https://discord.com/api/webhooks/1096481470475944107/pBN8psoMyhj03JqD-7av1UWarLRFin505OxJVMgH3ymv_whcGnQfGaBLWG5CaYRB_naL",
        },	
        ['Bau-PlayBoy2'] = {
            loc = {-1515.56, 106.85, 52.25},
            weight = 5000, 
            perm = "playboy2.permissao",
            slots = 100, 
            webhook = "https://discord.com/api/webhooks/1096481225901867159/uuU3tZCpKV-nyJfMF8_NK0Z7use7vjHvUK_4ZobNyk8V2GnCEV1YY28_LFuKkcnM-tC_",
        },	

        ['Bau-Cartel'] = {
            loc = {-1880.69, 2055.25, 140.99},
            weight = 5000, 
            perm = "cartel.permissao",
            slots = 100, 
            webhook = "https://discord.com/api/webhooks/1096482340202631219/nEYYyHKs2LXYf1svCGQPWRT-bA31oABYo2t69dqhXB-hAOQcdt3QKQoqRGUpuWn_VdFQ",
        },	

        ['Bau-Cartel2'] = {
            loc = {-1863.39, 2054.27, 135.46},
            weight = 5000, 
            perm = "cartel2.permissao",
            slots = 100, 
            webhook = "https://discord.com/api/webhooks/1096482448969306112/X4v5RGo6UBW94alqTsKgvwKCjzzvJ7rOo3cu2XI6lNTV_Zs5NYUCB_fNat55sm--zs9a",
        },	

        ['Bau-TheLost'] = {
            loc = {-82.76, 832.0, 235.72},
            weight = 5000, 
            perm = "iraque.permissao",
            slots = 100, 
            webhook = "https://discord.com/api/webhooks/1096483723370844271/zvtwswMJe5UIDIbucRopp_RWI9P48SVdVyGCii6kJn1MVoKA3WyrRdjPvliiAJKK93_U",
        },

        ['Bau-TheLost2'] = {
            loc = {-99.15, 834.72, 227.79},
            weight = 5000, 
            perm = "iraque2.permissao",
            slots = 100, 
            webhook = "https://discord.com/api/webhooks/1096476785119604766/GbUSn1FOSegkd_E6rldQCR8HYfuRrgRPBtio3m3Tsp4j7fUKQS3QLrSoquIbJiQkNVhi",
        },

        ['Bau-SOA'] = {
            loc = {972.29, -98.07, 74.88},
            weight = 5000, 
            perm = "soa.permissao",
            slots = 100, 
            webhook = "https://discord.com/api/webhooks/1096484680217407540/hKCAHKzVkv_CzSN55lbfM5uRWmkbPoDiM0k7kjtRG3pNQGVZNvTfIYXGDyHAHyS8m1wZ",
        },

        ['Bau-SOA2'] = {
            loc = {977.1, -104.05, 74.85},
            weight = 5000, 
            perm = "soa2.permissao",
            slots = 100, 
            webhook = "https://discord.com/api/webhooks/1096484653046693948/W69v_koTaMs8cFZ6tf5mrWiWM1zDRLRYYZlj-dsI9lK8_H-MCzF0C4aSmjgemzSz6gT-",
        },

        ['Bau-Vanilla'] = {
            loc = {106.88, -1299.24, 28.77},
            weight = 5000, 
            perm = "vanilla.permissao",
            slots = 100, 
            webhook = "",
        },
       
        ['Bau-DriftKing'] = {
            loc = {153.37, -3011.68, 10.71},
            weight = 5000, 
            perm = "driftking.permissao",
            slots = 100, 
            webhook = "",
        },

        ['Bau-Burguershot'] = {
            loc = {-1203.05, -895.46, 14.0},
            weight = 5000, 
            perm = "burguershot.permissao",
            slots = 100, 
            webhook = "",
        },

        ['Bau-Policia'] = {
            loc = {-943.33, -2039.21, 9.41},
            weight = 50000, 
            perm = "policia.permissao",
            slots = 200, 
            webhook = "",
        },

        ['Bau-ROTAM'] = {
            loc = {-1757.37, -789.85, 17.04},
            weight = 50000, 
            perm = "policia.permissao",
            slots = 200, 
            webhook = "",
        },

        ['Bau-Civil'] = {
            loc = {278.15, -348.94, 49.58},
            weight = 50000, 
            perm = "policia.permissao",
            slots = 200, 
            webhook = "",
        },


        
    } 

}