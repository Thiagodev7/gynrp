comandos = {
    verMinhaCnh = { cmd = "cnh", perms = { } },
    policiaConsultarCnh = { cmd = "vcnh", perms = { "policia.permissao", "admin.permissao" } },
    policiaRemoverCnh = { cmd = "rcnh", perms = { "policia.permissao", "admin.permissao" } },
    gravarRota = { cmd = "zgc", perms = { "admin.permissao" } },
    colocarCones = { cmd = "zcc", perms = { "admin.permissao" } },
}

blip_provas = {
    cds = { -695.2, -1667.24, 25.01 },
    item = "laudoteoricocnh",
    animation = {
        fazerAnimacao = true,
        cdsObj = { -707.82, -1671.99, 25.01, 183.0 },
        cdsPed = { -707.82 + 0.22, -1671.99 + 0.22, 25.01, 183.0 }
    },
    
    -- https://docs.fivem.net/docs/game-references/blips/
    configBlipInMap = {
        text = "Auto Escola | Detran",
        icon = 498,
        color = 4
    },
    
    -- https://docs.fivem.net/docs/game-references/markers/
    configDrawnMaker = {
        type = 36,
        color = { 244, 200, 0 },
        z = 0.3
    }
}

rotas = {
    [1] = {
        { 228.06098937988, -1389.0344238281, 30.511636734009, velocidadeMax = 120 },
        { 220.40, -1406.93, 28.90 },
        { 184.07, -1396.04, 28.77, velocidadeMax = 60 },
        { 210.09, -1327.85, 28.86 },
        { 212.71, -1147.49, 28.86, velocidadeMax = 300 },
        { 83.05, -1136.40, 28.68 },
        { 69.66, -1334.23, 28.76 },
        { -70.94, -1364.08, 28.92 },
        { -209.28, -1412.25, 30.77 },
        { -357.95, -1420.19, 28.82 },
        { -241.58, -1243.92, 36.81 },
        { -6.31, -1237.12, 36.76 },
        { 410.16, -1225.85, 40.00 },
        { 624.32, -1240.98, 40.53 },
        { 774.26, -1245.23, 26.32 },
        { 789.94, -1384.34, 26.39 },
        { 555.70, -1429.83, 28.91 },
        { 404.47, -1373.16, 29.70 },
        { 248.49, -1298.55, 28.81 },
        { 170.21, -1373.44, 28.85 },
        { 219.47, -1439.26, 28.86 },
        { 284.41, -1394.39, 29.97 },
        { 270.92, -1358.59, 31.45 },
        { 221.85, -1355.60, 30.11 },
    },

    [2] = {
        { 227.77, -1387.38, 29.94, velocidadeMax = 60 },
        { 222.40, -1404.87, 29.16 },
        { 196.81, -1405.98, 28.70 },
        { 212.54, -1335.63, 28.69, velocidadeMax = 120 },
        { 250.42, -1316.85, 28.77 },
        { 318.61, -1325.36, 31.51 },
        { 318.43, -1347.61, 31.74, velocidadeMax = 150 },
        { 299.46, -1371.57, 31.39 },
        { 280.82, -1377.53, 31.36 },
        { 274.93, -1364.24, 31.38, velocidadeMax = 120 },
        { 256.78, -1344.57, 31.37, velocidadeMax = 60 },
        { 235.81, -1345.12, 30.04 },
        { 221.42, -1363.79, 29.98 },
        { 224.72, -1378.75, 29.92 },
    },

    [3] = {
        { -693.07, -1681.68,  24.38, velocidadeMax = 60},
        { -432.15, -1773.52,  19.98},
        { -270.32, -1460.24,  30.67, velocidadeMax = 80},
        { -465.06, -1094.88,  26.96},
        { -497.7, -860.87,  29.67},
        { -624.05, -622.81,  31.87},
        { -591.73, -558.7,  33.94},
        { -431.69, -637.9,  36.41 , velocidadeMax = 120 }, 
        { -416.02, -1246.12,  36.51}, 
        { -737.52, -1703.96, 29.38, }, 
        { -729.84, -1623.35, 25.63, velocidadeMax = 60}, 
        { -686.73, -1682.3, 25.86}, 
        { -709.12, -1683.18, 25.84}, 
    }
}

configDrawnMakerRotas = {
    [1] = {
        type = 1,
        color = { 255, 255, 255 },
        z = 1.5
    },
    [2] = {
        type = 4,
        color = { 255, 7, 58 },
        z = 0.5
    },
    [3] = {
        type = 21,
        color = { 255, 7, 58 },
        z = 0.5
    },
}

-- https://wiki.rage.mp/index.php?title=Peds

config = {
    ["A"] = { 
        vehicle = "cg160",
        rota = rotas[3],
        spawnLoc = { -691.72, -1652.34, 25.01, 93.55 },
        maxErros = 3,
        instrutor = { existe = true, model = "a_m_y_genstreet_01" },
        valor = 5000,
        img = "https://cdn.discordapp.com/attachments/798381575284719626/946105964782817380/ZoTh_Motoca.png"
    },

    ["B"] = {  
        vehicle = "golg9",
        rota = rotas[3],
        spawnLoc = { -692.76, -1656.73, 24.75, 88.36 },
        maxErros = 3,
        instrutor = { existe = true, model = "ig_mp_agent14" },
        valor = 5000,
        img = "https://cdn.discordapp.com/attachments/798381575284719626/946105966036926554/ZoTh_Gol.png"
    },

    ["C"] = {  
        vehicle = "coachrv",
        rota = rotas[3],
        spawnLoc = { -710.76, -1681.1, 25.84, 268.86 },
        maxErros = 3,
        instrutor = { existe = true, model = "ig_mp_agent14" },
        valor = 8000,
        img = "https://cdn.discordapp.com/attachments/798381575284719626/946105965760098324/ZoTh_Onibus.png"
    },

    ["D"] = {  
        vehicle = "hauler",
        rota = rotas[3],
        spawnLoc = { -696.3, -1656.3, 25.24, 91.84 },
        maxErros = 3,
        instrutor = { existe = true, model = "ig_mp_agent14" },
        valor = 8000,
        img = "https://cdn.discordapp.com/attachments/798381575284719626/946105964493418517/ZoTh_Caminhao.png"
    },
}

parkInfos = {
    ["B"] = {
        cdsVehicle = { 250.08, -1396.16, 29.82, 78.45 },
        cdsBlips = {
            { 242.26, -1394.42, 29.81, 78.45 }
        },
        cones = {
            { 245.41, -1396.84, 29.51 },
            { 245.59, -1395.86, 29.50 },
            { 245.76, -1394.87, 29.48 },
            { 245.93, -1393.89, 29.45 },
            { 244.81, -1393.64, 29.45 },
            { 243.62, -1393.40, 29.45 },
            { 242.48, -1393.14, 29.45 },
            { 241.31, -1392.88, 29.44 },
            { 240.14, -1392.69, 29.45 },
            { 238.53, -1392.31, 29.45 },
            { 238.30, -1393.20, 29.48 },
            { 238.12, -1394.37, 29.52 },
            { 237.96, -1395.32, 29.52 },
        }
    },

    ["A"] = {
        cdsVehicle = { 241.97, -1416.83, 30.09, 320.46 },
        cdsBlips = {
            { 247.01, -1409.53, 30.10 },
            { 250.54, -1407.30, 30.10 },
            { 251.77, -1402.52, 30.09 },
            { 255.94, -1401.00, 30.05 },
            { 257.41, -1395.92, 30.02 },
            { 262.33, -1394.24, 30.32 },
            { 263.41, -1389.88, 30.64 },
            { 268.49, -1387.26, 31.06 },
            { 269.50, -1382.61, 31.40 },
            { 274.33, -1380.82, 31.49 },
            { 277.22, -1375.71, 31.45 },
        },
        cones = {
            { 248.94, -1411.44, 29.59 },
            { 249.61, -1410.70, 29.59 },
            { 250.28, -1409.95, 29.59 },
            { 250.94, -1409.21, 29.59 },
            { 251.61, -1408.46, 29.59 },
            { 252.28, -1407.71, 29.59 },
            { 252.94, -1406.97, 29.59 },
            { 253.61, -1406.22, 29.59 },
            { 254.27, -1405.48, 29.59 },
            { 254.94, -1404.73, 29.59 },
            { 255.61, -1403.98, 29.58 },
            { 256.27, -1403.24, 29.57 },
            { 256.94, -1402.49, 29.56 },
            { 257.61, -1401.75, 29.56 },
            { 258.27, -1401.00, 29.56 },
            { 258.94, -1400.26, 29.57 },
            { 259.60, -1399.51, 29.56 },
            { 260.27, -1398.76, 29.57 },
            { 260.94, -1398.02, 29.56 },
            { 261.60, -1397.27, 29.57 },
            { 262.27, -1396.53, 29.65 },
            { 262.93, -1395.79, 29.74 },
            { 263.60, -1395.05, 29.83 },
            { 264.26, -1394.30, 29.93 },
            { 264.93, -1393.56, 30.02 },
            { 265.59, -1392.82, 30.10 },
            { 266.26, -1392.08, 30.18 },
            { 266.92, -1391.34, 30.26 },
            { 267.59, -1390.59, 30.33 },
            { 268.25, -1389.85, 30.41 },
            { 268.92, -1389.11, 30.48 },
            { 269.58, -1388.36, 30.55 },
            { 270.25, -1387.62, 30.63 },
            { 270.91, -1386.88, 30.72 },
            { 271.58, -1386.14, 30.79 },
            { 272.25, -1385.39, 30.87 },
            { 272.91, -1384.65, 30.95 },
            { 273.58, -1383.91, 31.03 },
            { 274.28, -1383.20, 31.03 },
            { 274.95, -1382.46, 31.01 },
            { 275.61, -1381.71, 30.99 },
            { 276.28, -1380.97, 30.98 },
            { 272.34, -1377.48, 30.94 },
            { 244.99, -1408.09, 29.59 },
            { 245.73, -1407.26, 29.59 },
            { 246.39, -1406.51, 29.59 },
            { 247.06, -1405.77, 29.59 },
            { 247.73, -1405.02, 29.59 },
            { 248.39, -1404.28, 29.59 },
            { 249.06, -1403.53, 29.59 },
            { 249.73, -1402.78, 29.58 },
            { 250.39, -1402.04, 29.56 },
            { 251.06, -1401.29, 29.54 },
            { 251.72, -1400.55, 29.53 },
            { 252.39, -1399.80, 29.54 },
            { 253.06, -1399.06, 29.54 },
            { 253.72, -1398.31, 29.53 },
            { 254.39, -1397.56, 29.52 },
            { 255.06, -1396.82, 29.52 },
            { 255.72, -1396.07, 29.50 },
            { 256.39, -1395.33, 29.49 },
            { 257.05, -1394.58, 29.47 },
            { 257.72, -1393.84, 29.55 },
            { 258.39, -1393.09, 29.63 },
            { 259.05, -1392.35, 29.71 },
            { 259.72, -1391.61, 29.79 },
            { 260.38, -1390.87, 29.87 },
            { 261.05, -1390.12, 29.96 },
            { 261.71, -1389.38, 30.04 },
            { 262.38, -1388.64, 30.12 },
            { 263.04, -1387.90, 30.19 },
            { 263.71, -1387.15, 30.26 },
            { 264.37, -1386.41, 30.34 },
            { 265.04, -1385.67, 30.41 },
            { 265.70, -1384.92, 30.48 },
            { 266.37, -1384.18, 30.57 },
            { 267.03, -1383.44, 30.67 },
            { 267.70, -1382.70, 30.76 },
            { 268.36, -1381.96, 30.85 },
            { 269.03, -1381.22, 30.94 },
            { 269.69, -1380.47, 30.96 },
            { 270.36, -1379.73, 30.96 },
            { 271.02, -1378.98, 30.95 },
            { 271.69, -1378.24, 30.94 },
            { 249.53, -1406.83, 29.59 },
            { 252.23, -1403.87, 29.59 },
            { 254.71, -1401.10, 29.53 },
            { 258.00, -1397.41, 29.53 },
            { 261.16, -1393.88, 29.75 },
            { 263.77, -1390.94, 30.09 },
            { 267.06, -1387.21, 30.46 },
            { 270.08, -1383.84, 30.83 },
            { 272.98, -1380.57, 30.97 },
        }
    },

    ["D"] = {
        cdsVehicle = { 259.28, -1392.89, 31.05, 139.29 },
        cdsBlips = {
            { 243.89, -1395.11, 30.72, 78.45 }
        },
        cones = {
            { 249.11, -1394.19, 29.57 },
            { 248.13, -1393.98, 29.57 },
            { 247.15, -1393.75, 29.57 },
            { 246.18, -1393.54, 29.57 },
            { 245.20, -1393.32, 29.57 },
            { 244.22, -1393.11, 29.57 },
            { 243.24, -1392.89, 29.57 },
            { 242.27, -1392.65, 29.57 },
            { 241.30, -1392.44, 29.57 },
            { 240.31, -1392.24, 29.57 },
            { 239.33, -1392.04, 29.56 },
            { 238.48, -1392.63, 29.46 },
            { 238.28, -1393.67, 29.49 },
            { 238.08, -1394.54, 29.52 },
            { 237.88, -1395.46, 29.52 },
            { 248.71, -1397.94, 29.52 },
            { 248.87, -1397.24, 29.52 },
            { 249.07, -1396.47, 29.52 },
            { 249.27, -1395.70, 29.49 },
            { 249.50, -1394.86, 29.46 },
        }
    },

    -- ["C"] = {
    --     cdsVehicle = { 259.28, -1392.89, 31.05, 139.29 },
    --     cdsBlips = {
    --         { 243.89, -1395.11, 30.72, 78.45 }
    --     },
    --     cones = {
    --         { 249.11, -1394.19, 29.57 },
    --         { 248.13, -1393.98, 29.57 },
    --         { 247.15, -1393.75, 29.57 },
    --         { 246.18, -1393.54, 29.57 },
    --         { 245.20, -1393.32, 29.57 },
    --         { 244.22, -1393.11, 29.57 },
    --         { 243.24, -1392.89, 29.57 },
    --         { 242.27, -1392.65, 29.57 },
    --         { 241.30, -1392.44, 29.57 },
    --         { 240.31, -1392.24, 29.57 },
    --         { 239.33, -1392.04, 29.56 },
    --         { 238.48, -1392.63, 29.46 },
    --         { 238.28, -1393.67, 29.49 },
    --         { 238.08, -1394.54, 29.52 },
    --         { 237.88, -1395.46, 29.52 },
    --         { 248.71, -1397.94, 29.52 },
    --         { 248.87, -1397.24, 29.52 },
    --         { 249.07, -1396.47, 29.52 },
    --         { 249.27, -1395.70, 29.49 },
    --         { 249.50, -1394.86, 29.46 },
    --     }
    -- }
}