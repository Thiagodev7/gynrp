
local cfg = {}

-- # [CONFIG ELEVADORES]
-- # permission = permissão para abrir o elevador, se quiser sem permissão, é só deixar = nil
-- # blips = locais onde o blip deste elevador deverá aparecer [coloque a coordenada de cada andar que deve ter o blip do elevador]
-- # andares = andares que irão aparecer neste elevador
-- # andares [text = texto que irá aparecer no menu, tp_coords = coordenada do andar]

cfg.elevadores = {
    [1] = { -- PM
        
    permission = nil,
        blips = {
            {-1095.93, -850.64, 4.89}, -- Garagem
            {-1096.46, -850.45, 10.28}, -- 1
            {-1095.95, -850.71, 13.69}, -- Terreo
            {-1095.36, -850.48, 19.01}, -- 2
            {-1095.44, -851.6, 26.83}, -- 3
            {-1096.11, -850.75, 30.76}, -- 4
            {-1095.83, -850.5, 34.37}, -- 5
            {-1096.27, -850.48, 38.25}, -- Helipont
        },
        andares = {
            [8] = {
                text = "H",
                tp_coords = {-1096.27, -850.48, 38.25}
            },
            [7] = {
                text = "5",
                tp_coords = {-1095.83, -850.5, 34.37}
            },
            [6] = {
                text = "4",
                tp_coords = {-1096.11, -850.75, 30.76}
            },
            [5] = {
                text = "3",
                tp_coords = {-1095.44, -851.6, 26.83}
            },
            [4] = {
                text = "2",
                tp_coords = {-1095.36, -850.48, 19.01}
            },
            [3] = {
                text = "T",
                tp_coords = {-1095.95, -850.71, 13.69}
            },
            [2] = {
                text = "1",
                tp_coords = {-1096.46, -850.45, 10.28}
            },
            [1] = {
                text = "G",
                tp_coords = {-1095.93, -850.64, 4.89}
            }
        }
    },
  
    [2] = { -- HOPISTAL
        
    permission = nil,
        blips = {
            {-435.87, -359.02, 34.95}, -- 1
            {-487.66, -328.39, 42.31}, -- 2
            {-490.64, -327.69, 69.51}, -- 3
            {-439.37, -335.87, 78.31}, -- H
            {-418.81, -344.81, 24.24}, -- -1
        },
        andares = {
            [5] = {
                text = "-1",
                tp_coords = {-418.81, -344.81, 24.24}
            },
            [4] = {
                text = "H",
                tp_coords = {-439.37, -335.87, 78.31}
            },
            [3] = {
                text = "3",
                tp_coords = {-490.64, -327.69, 69.51}
            },
            [2] = {
                text = "2",
                tp_coords = {-487.66, -328.39, 42.31}
            },
            [1] = {
                text = "1",
                tp_coords = {-435.87, -359.02, 34.95}
            }
        }
    },

    

}

return cfg