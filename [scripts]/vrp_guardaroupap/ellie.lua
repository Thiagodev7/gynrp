
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

vCLIENT = Tunnel.getInterface("vrp_guardaroupap")

vRPex = {}
Tunnel.bindInterface("vrp_guardaroupap",vRPex)

local rpm1curta = {
    [1885233650] = {
        [1] = {-1,0,0},
		[2] = {73,0,0},
		[3] = {0,0,0},
		[4] = {31,2,0},
		[5] = {-1,0,0},
		[6] = {24,0,0},
		[7] = {0,0,2},
		[8] = {58,0,0},
		[9] = {22,0,0},
		[10] = {-1,0,0},
		[11] = {93,0,0},
		["p0"] = {85,0,0},
		["p1"] = {0,0,0},
		["p6"] = {20,0},
	},
    [-1667301416] = {
		[1] = {-1,0,0},
		[2] = {15,0,0},
		[3] = {14,0,0},
		[4] = {61,6,0},
		[5] = {45,5,0},
		[6] = {24,0,0},
		[7] = {7,2,2},
		[8] = {31,0,0},
		[9] = {24,0,0},
		[10] = {-1,0,0},
		[11] = {84,0,0},
		["p0"] = {84,0,0},
		["p1"] = {-1,0,0},
		["p6"] = {-1,0},
	}
}

local rpm1longa = {
    [1885233650] = {
        [1] = {-1,0,0},
		[2] = {73,0,0},
		[3] = {12,0,0},
		[4] = {31,2,0},
		[5] = {-1,0,0},
		[6] = {24,0,0},
		[7] = {0,0,2},
		[8] = {58,0,0},
		[9] = {22,0,0},
		[10] = {-1,0,0},
		[11] = {98,0,0},
		["p0"] = {85,0,0},
		["p1"] = {0,0,0},
		["p6"] = {20,0},
    },
    [-1667301416] = {
        [1] = {-1,0,0},
		[2] = {15,0,0},
		[3] = {14,0,0},
		[4] = {61,6,0},
		[5] = {45,5,0},
		[6] = {24,0,0},
		[7] = {8,2,2},
		[8] = {31,0,0},
		[9] = {24,0,0},
		[10] = {-1,0,0},
		[11] = {89,0,0},
		["p0"] = {84,0,0},
		["p1"] = {-1,0,0},
		["p6"] = {-1,0},
    }
}

local rpm2curta = {
    [1885233650] = {
        [1] = {-1,0,0},
		[2] = {73,0,0},
		[3] = {32,0,0},
		[4] = {31,0,0},
		[5] = {-1,0,0},
		[6] = {24,0,0},
		[7] = {0,0,2},
		[8] = {58,0,0},
		[9] = {3,0,0},
		[10] = {-1,0,0},
		[11] = {93,1,0},
		["p0"] = {85,0,0},
		["p1"] = {0,0,0},
		["p6"] = {20,0},
    },
    [-1667301416] = {
		[1] = {-1,0,0},
		[2] = {15,0,0},
		[3] = {33,0,0},
		[4] = {61,9,0},
		[5] = {45,5,0},
		[6] = {24,0,0},
		[7] = {8,2,2},
		[8] = {31,0,0},
		[9] = {16,0,0},
		[10] = {-1,0,0},
		[11] = {84,1,0},
		["p0"] = {84,0,0},
		["p1"] = {-1,0,0},
		["p6"] = {-1,0},
    }
}

local rpm2longa = {
    [1885233650] = {
        [1] = {-1,0,0},
		[2] = {73,0,0},
		[3] = {31,0,0},
		[4] = {31,0,0},
		[5] = {-1,0,0},
		[6] = {24,0,0},
		[7] = {0,0,2},
		[8] = {58,0,0},
		[9] = {3,0,0},
		[10] = {-1,0,0},
		[11] = {98,1,0},
		["p0"] = {85,0,0},
		["p1"] = {0,0,0},
		["p6"] = {20,0},
    },
    [-1667301416] = {
        [1] = {-1,0,0},
		[2] = {15,0,0},
		[3] = {33,0,0},
		[4] = {61,9,0},
		[5] = {45,5,0},
		[6] = {24,0,0},
		[7] = {8,2,2},
		[8] = {31,0,0},
		[9] = {16,0,0},
		[10] = {-1,0,0},
		[11] = {89,1,0},
		["p0"] = {84,0,0},
		["p1"] = {-1,0,0},
		["p6"] = {-1,0},

    }
}
-------------------------------
local got1curta = {
    [1885233650] = {
		[1] = {103,1,0},
		[2] = {73,0,0},
		[3] = {26,0,0},
		[4] = {106,0,0},
		[5] = {-1,0,0},
		[6] = {25,0,0},
		[7] = {33,0,2},
		[8] = {16,1,2},
		[9] = {15,0,0},
		[10] = {-1,0,0},
		[11] = {196,0,0},
		["p0"] = {57,0,0},
		["p1"] = {1,1,0},
		["p6"] = {20,0},
    },
    [-1667301416] = {
        [1] = {107,1,0},
		[2] = {2,0,0},
		[3] = {22,0,0},
		[4] = {113,0,0},
		[5] = {45,5,0},
		[6] = {25,0,0},
		[7] = {16,0,2},
		[8] = {119,0,2},
		[9] = {17,0,0},
		[10] = {-1,0,0},
		[11] = {200,0,0},
		["p0"] = {57,0,0},
		["p1"] = {-1,0,0},
		["p6"] = {10,2},
    }
}
local got1longa = {
    [1885233650] = {
        [1] = {103,1,0},
		[2] = {73,0,0},
		[3] = {28,0,0},
		[4] = {106,0,0},
		[5] = {-1,0,0},
		[6] = {25,0,0},
		[7] = {33,0,2},
		[8] = {16,1,2},
		[9] = {15,0,0},
		[10] = {-1,0,0},
		[11] = {198,0,0},
		["p0"] = {57,0,0},
		["p1"] = {1,1,0},
		["p6"] = {20,0},
    },
	[-1667301416] = {
        [1] = {107,1,0},
		[2] = {2,0,0},
		[3] = {22,0,0},
		[4] = {113,0,0},
		[5] = {45,5,0},
		[6] = {25,0,0},
		[7] = {16,0,2},
		[8] = {119,0,2},
		[9] = {17,0,0},
		[10] = {-1,0,0},
		[11] = {198,0,0},
		["p0"] = {57,0,0},
		["p1"] = {-1,0,0},
		["p6"] = {10,2},
    }
}

local got2curta = {
    [1885233650] = {
        [1] = {35,0,2},
		[2] = {73,0,0},
		[3] = {37,0,0},
		[4] = {106,1,0},
		[5] = {-1,0,0},
		[6] = {24,0,0},
		[7] = {33,0,2},
		[8] = {16,1,2},
		[9] = {15,0,0},
		[10] = {-1,0,0},
		[11] = {196,1,0},
		["p0"] = {41,0,0},
		["p1"] = {-1,0,0},
		["p6"] = {20,0},
    },
    [-1667301416] = {
        [1] = {52,10,0},
		[2] = {2,0,0},
		[3] = {22,0,0},
		[4] = {113,1,0},
		[5] = {45,5,0},
		[6] = {25,0,0},
		[7] = {16,0,2},
		[8] = {119,0,2},
		[9] = {17,0,0},
		[10] = {-1,0,0},
		[11] = {200,1,0},
		["p0"] = {40,0,0},
		["p1"] = {-1,0,0},
		["p6"] = {10,2},
    }
}

local got2longa = {
    [1885233650] = {
        [1] = {35,0,2},
		[2] = {73,0,0},
		[3] = {27,0,0},
		[4] = {106,1,0},
		[5] = {-1,0,0},
		[6] = {24,0,0},
		[7] = {33,0,2},
		[8] = {16,1,2},
		[9] = {15,0,0},
		[10] = {-1,0,0},
		[11] = {198,1,0},
		["p0"] = {41,0,0},
		["p1"] = {-1,0,0},
		["p6"] = {20,0},
    },
    [-1667301416] = {
		[1] = {52,10,0},
		[2] = {2,0,0},
		[3] = {22,0,0},
		[4] = {113,1,0},
		[5] = {45,5,0},
		[6] = {25,0,0},
		[7] = {16,0,2},
		[8] = {119,0,2},
		[9] = {17,0,0},
		[10] = {-1,0,0},
		[11] = {198,1,0},
		["p0"] = {40,0,0},
		["p1"] = {-1,0,0},
		["p6"] = {10,2},
    }
}

local gottatica = {
    [1885233650] = {
        [1] = {35,0,0},
		[2] = {73,0,0},
		[3] = {35,0,0},
		[4] = {33,0,0},
		[5] = {-1,0,0},
		[6] = {24,0,0},
		[7] = {33,0,2},
		[8] = {16,1,2},
		[9] = {24,0,0},
		[10] = {-1,0,0},
		[11] = {54,0,0},
		["p0"] = {58,0,0},
		["p1"] = {25,4,0},
		["p6"] = {20,0},
    },
    [-1667301416] = {
		[1] = {52,10,0},
		[2] = {2,0,0},
		[3] = {36,0,0},
		[4] = {115,2,0},
		[5] = {45,5,0},
		[6] = {25,0,0},
		[7] = {16,0,2},
		[8] = {119,0,2},
		[9] = {17,0,0},
		[10] = {-1,0,0},
		[11] = {42,0,0},
		["p0"] = {58,0,0},
		["p1"] = {27,4,0},
		["p6"] = {10,2},
    }
}

local gotcamuflado = {
    [1885233650] = {
        [1] = {52,3,0},
		[2] = {12,0,0},
		[3] = {167,0,0},
		[4] = {111,0,0},
		[5] = {-1,0,0},
		[6] = {62,1,0},
		[7] = {98,0,2},
		[8] = {11,0,2},
		[9] = {2,0,0},
		[10] = {-1,0,0},
		[11] = {194,0,0},
		["p0"] = {0,0,0},
		["p1"] = {1,1,0},
		["p6"] = {5,0},
    },
    [-1667301416] = {
		[1] = {107,1,0},
		[2] = {2,0,0},
		[3] = {207,2,0},
		[4] = {118,0,0},
		[5] = {45,5,0},
		[6] = {62,8,0},
		[7] = {14,0,2},
		[8] = {122,18,2},
		[9] = {32,6,0},
		[10] = {-1,0,0},
		[11] = {196,0,0},
		["p0"] = {-1,0,0},
		["p1"] = {-1,0,0},
		["p6"] = {10,2},
    }
}

local gotspeed = {
    [1885233650] = {
        [1] = {121,0,0},
		[2] = {73,0,0},
		[3] = {17,0,0},
		[4] = {87,4,0},
		[5] = {-1,0,0},
		[6] = {62,0,0},
		[7] = {44,0,2},
		[8] = {80,2,2},
		[9] = {15,1,0},
		[10] = {-1,0,0},
		[11] = {220,1,0},
		["p0"] = {106,4,0},
		["p1"] = {-1,0,0},
		["p6"] = {21,0},
    },
    [-1667301416] = {
		[1] = {121,0,0},
		[2] = {2,0,0},
		[3] = {36,0,0},
		[4] = {98,1,0},
		[5] = {45,5,0},
		[6] = {36,0,0},
		[7] = {16,0,2},
		[8] = {145,0,2},
		[9] = {17,1,0},
		[10] = {-1,0,0},
		[11] = {230,1,0},
		["p0"] = {105,4,0},
		["p1"] = {-1,0,0},
		["p6"] = {10,2},
    }
}
--------------
local gic1 = {
    [1885233650] = {
        [1] = {52,0,0},
		[2] = {73,0,0},
		[3] = {33,0,0},
		[4] = {10,0,0},
		[5] = {-1,0,0},
		[6] = {25,0,0},
		[7] = {97,0,2},
		[8] = {21,0,0},
		[9] = {30,0,0},
		[10] = {-1,0,0},
		[11] = {213,0,0},
		["p0"] = {-1,0,0},
		["p1"] = {-1,0,0},
		["p6"] = {20,0},
    },
    [-1667301416] = {
		[1] = {107,1,0},
		[2] = {2,0,0},
		[3] = {28,0,0},
		[4] = {30,0,0},
		[5] = {45,5,0},
		[6] = {40,0,0},
		[7] = {16,0,2},
		[8] = {181,1,0},
		[9] = {32,6,0},
		[10] = {-1,0,0},
		[11] = {218,0,0},
		["p0"] = {-1,0,0},
		["p1"] = {15,2,0},
		["p6"] = {10,2},
    }
}

local gic2 = {
    [1885233650] = {
		[1] = {52,0,0},
		[2] = {73,0,0},
		[3] = {33,0,0},
		[4] = {31,0,0},
		[5] = {-1,0,0},
		[6] = {25,0,0},
		[7] = {97,0,2},
		[8] = {16,1,0},
		[9] = {30,0,0},
		[10] = {-1,0,0},
		[11] = {214,0,0},
		["p0"] = {121,0,0},
		["p1"] = {-1,0,0},
		["p6"] = {20,0},
    },
    [-1667301416] = {
		[1] = {107,1,0},
		[2] = {2,0,0},
		[3] = {36,0,0},
		[4] = {30,0,0},
		[5] = {45,5,0},
		[6] = {25,0,0},
		[7] = {16,0,2},
		[8] = {35,0,0},
		[9] = {32,6,0},
		[10] = {-1,0,0},
		[11] = {217,0,0},
		["p0"] = {59,9,0},
		["p1"] = {27,4,0},
		["p6"] = {10,2},
    }
}

local gic3 = {
    [1885233650] = {
		[1] = {121,0,0},
		[2] = {73,0,0},
		[3] = {12,0,0},
		[4] = {47,0,0},
		[5] = {-1,0,0},
		[6] = {56,1,0},
		[7] = {97,0,2},
		[8] = {130,0,0},
		[9] = {30,0,0},
		[10] = {-1,0,0},
		[11] = {239,0,0},
		["p0"] = {-1,0,0},
		["p1"] = {1,1,0},
		["p6"] = {5,0},
    },
    [-1667301416] = {
		[1] = {107,1,0},
		[2] = {2,0,0},
		[3] = {7,0,0},
		[4] = {36,2,0},
		[5] = {45,5,0},
		[6] = {42,2,0},
		[7] = {16,0,2},
		[8] = {39,2,0},
		[9] = {32,6,0},
		[10] = {-1,0,0},
		[11] = {203,0,0},
		["p0"] = {-1,0,0},
		["p1"] = {-1,0,0},
		["p6"] = {10,2},
    }
}

local gtm = {
    [1885233650] = {
		[1] = {103,0,0},
		[2] = {73,0,0},
		[3] = {27,0,0},
		[4] = {87,1,0},
		[5] = {-1,0,0},
		[6] = {25,0,0},
		[7] = {9,0,2},
		[8] = {16,1,0},
		[9] = {15,2,0},
		[10] = {-1,0,0},
		[11] = {220,0,0},
		["p0"] = {86,0,0},
		["p1"] = {15,1,0},
		["p6"] = {20,0},
    },
    [-1667301416] = {
		[1] = {107,0,0},
		[2] = {15,0,0},
		[3] = {28,0,0},
		[4] = {98,0,0},
		[5] = {45,5,0},
		[6] = {25,0,0},
		[7] = {16,0,2},
		[8] = {121,0,0},
		[9] = {17,2,0},
		[10] = {-1,0,0},
		[11] = {230,0,0},
		["p0"] = {85,0,0},
		["p1"] = {25,6,0},
		["p6"] = {10,2},
    }
}

local gsa1 = {
    [1885233650] = {
		[1] = {121,0,0},
		[2] = {73,0,0},
		[3] = {53,0,0},
		[4] = {30,0,0},
		[5] = {-1,0,0},
		[6] = {24,0,0},
		[7] = {9,0,2},
		[8] = {80,2,0},
		[9] = {30,0,0},
		[10] = {-1,0,0},
		[11] = {48,0,0},
		["p0"] = {79,0,0},
		["p1"] = {5,7,0},
		["p6"] = {20,0},
    },
    [-1667301416] = {
		[1] = {-1,0,0},
		[2] = {15,0,0},
		[3] = {19,0,0},
		[4] = {29,0,0},
		[5] = {45,5,0},
		[6] = {27,0,0},
		[7] = {16,0,2},
		[8] = {34,0,0},
		[9] = {33,0,0},
		[10] = {-1,0,0},
		[11] = {41,0,0},
		["p0"] = {78,0,0},
		["p1"] = {-1,0,0},
		["p6"] = {10,2},
    }
}

local gsa2 = {
    [1885233650] = {
		[1] = {121,0,0},
		[2] = {73,0,0},
		[3] = {52,0,0},
		[4] = {30,0,0},
		[5] = {-1,0,0},
		[6] = {24,0,0},
		[7] = {9,0,2},
		[8] = {80,2,0},
		[9] = {18,0,0},
		[10] = {-1,0,0},
		[11] = {93,2,0},
		["p0"] = {85,0,0},
		["p1"] = {5,7,0},
		["p6"] = {20,0},
    },
    [-1667301416] = {
		[1] = {-1,0,0},
		[2] = {15,0,0},
		[3] = {46,0,0},
		[4] = {29,0,0},
		[5] = {45,5,0},
		[6] = {27,0,0},
		[7] = {16,0,2},
		[8] = {119,0,0},
		[9] = {20,0,0},
		[10] = {-1,0,0},
		[11] = {84,2,0},
		["p0"] = {84,0,0},
		["p1"] = {-1,0,0},
		["p6"] = {10,2},
    }
}

local aluno = {
    [1885233650] = {
		[1] = {-1,0,0},
		[2] = {73,0,0},
		[3] = {0,0,0},
		[4] = {14,1,0},
		[5] = {-1,0,0},
		[6] = {7,2,0},
		[7] = {0,0,2},
		[8] = {15,0,0},
		[9] = {33,0,0},
		[10] = {-1,0,0},
		[11] = {97,0,0},
		["p0"] = {85,0,0},
		["p1"] = {0,0,0},
		["p6"] = {20,0},
    },
    [-1667301416] = {
		[1] = {-1,0,0},
		[2] = {15,0,0},
		[3] = {14,0,0},
		[4] = {107,3,0},
		[5] = {45,5,0},
		[6] = {27,0,0},
		[7] = {8,2,2},
		[8] = {34,0,0},
		[9] = {33,0,0},
		[10] = {-1,0,0},
		[11] = {212,0,0},
		["p0"] = {84,0,0},
		["p1"] = {-1,0,0},
		["p6"] = {10,2},
    }
}

local instrutor = {
    [1885233650] = {
		[1] = {-1,0,0},
		[2] = {73,0,0},
		[3] = {0,0,0},
		[4] = {31,2,0},
		[5] = {-1,0,0},
		[6] = {24,0,0},
		[7] = {0,0,2},
		[8] = {15,0,0},
		[9] = {33,0,0},
		[10] = {-1,0,0},
		[11] = {97,1,0},
		["p0"] = {85,0,0},
		["p1"] = {0,0,0},
		["p6"] = {20,0},
    },
    [-1667301416] = {
		[1] = {-1,0,0},
		[2] = {15,0,0},
		[3] = {14,0,0},
		[4] = {61,6,0},
		[5] = {45,5,0},
		[6] = {24,0,0},
		[7] = {8,2,2},
		[8] = {34,0,0},
		[9] = {33,0,0},
		[10] = {-1,0,0},
		[11] = {212,1,0},
		["p0"] = {84,0,0},
		["p1"] = {-1,0,0},
		["p6"] = {10,2},
    }
}

local comando = {
    [1885233650] = {
		[1] = {0,0,0},
		[2] = {73,0,0},
		[3] = {4,0,0},
		[4] = {24,0,0},
		[5] = {-1,0,0},
		[6] = {10,0,0},
		[7] = {57,0,2},
		[8] = {57,0,2},
		[9] = {29,0,0},
		[10] = {-1,0,0},
		[11] = {252,0,0},
		["p0"] = {114,3,0},
		["p1"] = {-1,0,0},
		["p6"] = {20,0},
    },
    [-1667301416] = {
		[1] = {0,0,0},
		[2] = {2,0,0},
		[3] = {3,0,0},
		[4] = {7,2,0},
		[5] = {45,5,0},
		[6] = {42,2,0},
		[7] = {14,0,2},
		[8] = {14,0,2},
		[9] = {33,0,0},
		[10] = {-1,0,0},
		[11] = {260,0,0},
		["p0"] = {-1,0,0},
		["p1"] = {-1,0,0},
		["p6"] = {10,2},
    }
}

RegisterServerEvent("rpm1curta")
AddEventHandler("rpm1curta",function()
	local source = source
    local user_id = vRP.getUserId(source)
    local custom = rpm1curta
    if custom and vRP.hasPermission(user_id,"rpm.permissao") or vRP.hasPermission(user_id,"pm.permissao") then
		TriggerClientEvent("progress",source,5000,"vestindo")
		vCLIENT.closeMenu(source)
		TriggerClientEvent('cancelando',source,true)
		vRPclient._playAnim(source,false,{{"clothingshirt","try_shirt_positive_d"}},true)
		SetTimeout(5000,function()

			vRPclient._stopAnim(source,false)
			TriggerClientEvent('cancelando',source,false)
			local old_custom = vRPclient.getCustomization(source)
			local idle_copy = {}

			idle_copy = vRP.save_idle_custom(source,old_custom)
			idle_copy.modelhash = nil

			for k,v in pairs(custom[old_custom.modelhash]) do
				idle_copy[k] = v
			end
			vRPclient._setCustomization(source,idle_copy)
        end)
	else
        TriggerClientEvent("Notify",source,"negado","Você não é da organição!",5000)
    end
end)

RegisterServerEvent("rpm1longa")
AddEventHandler("rpm1longa",function()
	local source = source
    local user_id = vRP.getUserId(source)
    local custom = rpm1longa
	if custom and vRP.hasPermission(user_id,"rpm.permissao") or vRP.hasPermission(user_id,"pm.permissao") then
		TriggerClientEvent("progress",source,5000,"vestindo")
		vCLIENT.closeMenu(source)
		TriggerClientEvent('cancelando',source,true)
		vRPclient._playAnim(source,false,{{"clothingshirt","try_shirt_positive_d"}},true)
		SetTimeout(5000,function()

			vRPclient._stopAnim(source,false)
			TriggerClientEvent('cancelando',source,false)
			local old_custom = vRPclient.getCustomization(source)
			local idle_copy = {}

			idle_copy = vRP.save_idle_custom(source,old_custom)
			idle_copy.modelhash = nil

			for k,v in pairs(custom[old_custom.modelhash]) do
				idle_copy[k] = v
			end
			vRPclient._setCustomization(source,idle_copy)
        end)
	else
        TriggerClientEvent("Notify",source,"negado","Você não é da organição!",5000)
    end
end)

RegisterServerEvent("rpm2curta")
AddEventHandler("rpm2curta",function()
	local source = source
    local user_id = vRP.getUserId(source)
    local custom = rpm2curta
    if custom and vRP.hasPermission(user_id,"rpm1.permissao") or vRP.hasPermission(user_id,"pm.permissao") then
		TriggerClientEvent("progress",source,5000,"vestindo")
		vCLIENT.closeMenu(source)
		TriggerClientEvent('cancelando',source,true)
		vRPclient._playAnim(source,false,{{"clothingshirt","try_shirt_positive_d"}},true)
		SetTimeout(5000,function()

			vRPclient._stopAnim(source,false)
			TriggerClientEvent('cancelando',source,false)
			local old_custom = vRPclient.getCustomization(source)
			local idle_copy = {}

			idle_copy = vRP.save_idle_custom(source,old_custom)
			idle_copy.modelhash = nil

			for k,v in pairs(custom[old_custom.modelhash]) do
				idle_copy[k] = v
			end
			vRPclient._setCustomization(source,idle_copy)
        end)
	else
        TriggerClientEvent("Notify",source,"negado","Você não é da organição!",5000)
    end
end)

RegisterServerEvent("rpm2longa")
AddEventHandler("rpm2longa",function()
	local source = source
    local user_id = vRP.getUserId(source)
    local custom = rpm2longa
    if custom and vRP.hasPermission(user_id,"rpm1.permissao") or vRP.hasPermission(user_id,"pm.permissao") then
		TriggerClientEvent("progress",source,5000,"vestindo")
		vCLIENT.closeMenu(source)
		TriggerClientEvent('cancelando',source,true)
		vRPclient._playAnim(source,false,{{"clothingshirt","try_shirt_positive_d"}},true)
		SetTimeout(5000,function()

			vRPclient._stopAnim(source,false)
			TriggerClientEvent('cancelando',source,false)
			local old_custom = vRPclient.getCustomization(source)
			local idle_copy = {}

			idle_copy = vRP.save_idle_custom(source,old_custom)
			idle_copy.modelhash = nil

			for k,v in pairs(custom[old_custom.modelhash]) do
				idle_copy[k] = v
			end
			vRPclient._setCustomization(source,idle_copy)
        end)
	else
        TriggerClientEvent("Notify",source,"negado","Você não é da organição!",5000) 
    end
end)

RegisterServerEvent("got1curta")
AddEventHandler("got1curta",function()
	local source = source
    local user_id = vRP.getUserId(source)
    local custom = got1curta
	if custom and vRP.hasPermission(user_id,"got.permissao") or vRP.hasPermission(user_id,"pm.permissao") then
		TriggerClientEvent("progress",source,5000,"vestindo")
		vCLIENT.closeMenu(source)
		TriggerClientEvent('cancelando',source,true)
		vRPclient._playAnim(source,false,{{"clothingshirt","try_shirt_positive_d"}},true)
		SetTimeout(5000,function()

			vRPclient._stopAnim(source,false)
			TriggerClientEvent('cancelando',source,false)
			local old_custom = vRPclient.getCustomization(source)
			local idle_copy = {}

			idle_copy = vRP.save_idle_custom(source,old_custom)
			idle_copy.modelhash = nil

			for k,v in pairs(custom[old_custom.modelhash]) do
				idle_copy[k] = v
			end
			vRPclient._setCustomization(source,idle_copy)
        end)
	else
        TriggerClientEvent("Notify",source,"negado","Você não é da organição!",5000)
    end
end)

RegisterServerEvent("got1longa")
AddEventHandler("got1longa",function()
	local source = source
    local user_id = vRP.getUserId(source)
    local custom = got1longa
	if custom and vRP.hasPermission(user_id,"got.permissao") or vRP.hasPermission(user_id,"pm.permissao") then
		TriggerClientEvent("progress",source,5000,"vestindo")
		vCLIENT.closeMenu(source)
		TriggerClientEvent('cancelando',source,true)
		vRPclient._playAnim(source,false,{{"clothingshirt","try_shirt_positive_d"}},true)
		SetTimeout(5000,function()

			vRPclient._stopAnim(source,false)
			TriggerClientEvent('cancelando',source,false)
			local old_custom = vRPclient.getCustomization(source)
			local idle_copy = {}

			idle_copy = vRP.save_idle_custom(source,old_custom)
			idle_copy.modelhash = nil

			for k,v in pairs(custom[old_custom.modelhash]) do
				idle_copy[k] = v
			end
			vRPclient._setCustomization(source,idle_copy)
        end)
	else
        TriggerClientEvent("Notify",source,"negado","Você não é da organição!",5000)
    end
end)

RegisterServerEvent("got2curta")
AddEventHandler("got2curta",function()
	local source = source
    local user_id = vRP.getUserId(source)
    local custom = got2curta
    if custom and vRP.hasPermission(user_id,"got1.permissao") or vRP.hasPermission(user_id,"pm.permissao") then
		TriggerClientEvent("progress",source,5000,"vestindo") 
		vCLIENT.closeMenu(source)
		TriggerClientEvent('cancelando',source,true)
		vRPclient._playAnim(source,false,{{"clothingshirt","try_shirt_positive_d"}},true)
		SetTimeout(5000,function()

			vRPclient._stopAnim(source,false)
			TriggerClientEvent('cancelando',source,false)
			local old_custom = vRPclient.getCustomization(source)
			local idle_copy = {}

			idle_copy = vRP.save_idle_custom(source,old_custom)
			idle_copy.modelhash = nil

			for k,v in pairs(custom[old_custom.modelhash]) do
				idle_copy[k] = v
			end
			vRPclient._setCustomization(source,idle_copy)
        end)
	else
        TriggerClientEvent("Notify",source,"negado","Você não é da organição!",5000)
    end
end)

RegisterServerEvent("got2longa")
AddEventHandler("got2longa",function()
	local source = source
    local user_id = vRP.getUserId(source)
    local custom = got2longa
    if custom and vRP.hasPermission(user_id,"got1.permissao") or vRP.hasPermission(user_id,"pm.permissao") then
		TriggerClientEvent("progress",source,5000,"vestindo") 
		vCLIENT.closeMenu(source)
		TriggerClientEvent('cancelando',source,true)
		vRPclient._playAnim(source,false,{{"clothingshirt","try_shirt_positive_d"}},true)
		SetTimeout(5000,function()

			vRPclient._stopAnim(source,false)
			TriggerClientEvent('cancelando',source,false)
			local old_custom = vRPclient.getCustomization(source)
			local idle_copy = {}

			idle_copy = vRP.save_idle_custom(source,old_custom)
			idle_copy.modelhash = nil

			for k,v in pairs(custom[old_custom.modelhash]) do
				idle_copy[k] = v
			end
			vRPclient._setCustomization(source,idle_copy)
        end)
	else
        TriggerClientEvent("Notify",source,"negado","Você não é da organição!",5000)
    end
end)

RegisterServerEvent("gottatica")
AddEventHandler("gottatica",function()
	local source = source
    local user_id = vRP.getUserId(source)
    local custom = gottatica
    if custom and vRP.hasPermission(user_id,"got.permissao") or vRP.hasPermission(user_id,"pm.permissao") then
		TriggerClientEvent("progress",source,5000,"vestindo")
		vCLIENT.closeMenu(source)
		TriggerClientEvent('cancelando',source,true)
		vRPclient._playAnim(source,false,{{"clothingshirt","try_shirt_positive_d"}},true)
		SetTimeout(5000,function()

			vRPclient._stopAnim(source,false)
			TriggerClientEvent('cancelando',source,false)
			local old_custom = vRPclient.getCustomization(source)
			local idle_copy = {}

			idle_copy = vRP.save_idle_custom(source,old_custom)
			idle_copy.modelhash = nil

			for k,v in pairs(custom[old_custom.modelhash]) do
				idle_copy[k] = v
			end
			vRPclient._setCustomization(source,idle_copy)
        end)
	else
        TriggerClientEvent("Notify",source,"negado","Você não é da organição!",5000)
    end
end)

RegisterServerEvent("gotcamuflado")
AddEventHandler("gotcamuflado",function()
	local source = source
    local user_id = vRP.getUserId(source)
    local custom = gotcamuflado
    if custom and vRP.hasPermission(user_id,"got.permissao") or vRP.hasPermission(user_id,"pm.permissao") then
		TriggerClientEvent("progress",source,5000,"vestindo")
		vCLIENT.closeMenu(source)
		TriggerClientEvent('cancelando',source,true)
		vRPclient._playAnim(source,false,{{"clothingshirt","try_shirt_positive_d"}},true)
		SetTimeout(5000,function()

			vRPclient._stopAnim(source,false)
			TriggerClientEvent('cancelando',source,false)
			local old_custom = vRPclient.getCustomization(source)
			local idle_copy = {}

			idle_copy = vRP.save_idle_custom(source,old_custom)
			idle_copy.modelhash = nil

			for k,v in pairs(custom[old_custom.modelhash]) do
				idle_copy[k] = v
			end
			vRPclient._setCustomization(source,idle_copy)
        end)
	else
        TriggerClientEvent("Notify",source,"negado","Você não é da organição!",5000)
    end
end)

RegisterServerEvent("gotspeed")
AddEventHandler("gotspeed",function()
	local source = source
    local user_id = vRP.getUserId(source)
    local custom = gotspeed
    if custom and vRP.hasPermission(user_id,"got.permissao") or vRP.hasPermission(user_id,"pm.permissao") then
		TriggerClientEvent("progress",source,5000,"vestindo")
		vCLIENT.closeMenu(source)
		TriggerClientEvent('cancelando',source,true)
		vRPclient._playAnim(source,false,{{"clothingshirt","try_shirt_positive_d"}},true)
		SetTimeout(5000,function()

			vRPclient._stopAnim(source,false)
			TriggerClientEvent('cancelando',source,false)
			local old_custom = vRPclient.getCustomization(source)
			local idle_copy = {}

			idle_copy = vRP.save_idle_custom(source,old_custom)
			idle_copy.modelhash = nil

			for k,v in pairs(custom[old_custom.modelhash]) do
				idle_copy[k] = v
			end
			vRPclient._setCustomization(source,idle_copy)
        end)
	else
        TriggerClientEvent("Notify",source,"negado","Você não é da organição!",5000)
    end
end)

RegisterServerEvent("gtm")
AddEventHandler("gtm",function()
	local source = source
    local user_id = vRP.getUserId(source)
    local custom = gtm
    if custom and vRP.hasPermission(user_id,"gtm.permissao") or vRP.hasPermission(user_id,"pm.permissao") then
		TriggerClientEvent("progress",source,5000,"vestindo")
		vCLIENT.closeMenu(source)
		TriggerClientEvent('cancelando',source,true)
		vRPclient._playAnim(source,false,{{"clothingshirt","try_shirt_positive_d"}},true)
		SetTimeout(5000,function()

			vRPclient._stopAnim(source,false)
			TriggerClientEvent('cancelando',source,false)
			local old_custom = vRPclient.getCustomization(source)
			local idle_copy = {}

			idle_copy = vRP.save_idle_custom(source,old_custom)
			idle_copy.modelhash = nil

			for k,v in pairs(custom[old_custom.modelhash]) do
				idle_copy[k] = v
			end
			vRPclient._setCustomization(source,idle_copy)
        end)
	else
        TriggerClientEvent("Notify",source,"negado","Você não é da organição!",5000)
    end
end)

RegisterServerEvent("gsa1")
AddEventHandler("gsa1",function()
	local source = source
    local user_id = vRP.getUserId(source)
    local custom = gsa1
    if custom and vRP.hasPermission(user_id,"gsa.permissao") or vRP.hasPermission(user_id,"pm.permissao") then
		TriggerClientEvent("progress",source,5000,"vestindo")
		vCLIENT.closeMenu(source)
		TriggerClientEvent('cancelando',source,true)
		vRPclient._playAnim(source,false,{{"clothingshirt","try_shirt_positive_d"}},true)
		SetTimeout(5000,function()

			vRPclient._stopAnim(source,false)
			TriggerClientEvent('cancelando',source,false)
			local old_custom = vRPclient.getCustomization(source)
			local idle_copy = {}

			idle_copy = vRP.save_idle_custom(source,old_custom)
			idle_copy.modelhash = nil

			for k,v in pairs(custom[old_custom.modelhash]) do
				idle_copy[k] = v
			end
			vRPclient._setCustomization(source,idle_copy)
        end)
	else
        TriggerClientEvent("Notify",source,"negado","Você não é da organição!",5000)
    end
end)

RegisterServerEvent("gsa2")
AddEventHandler("gsa2",function()
	local source = source
    local user_id = vRP.getUserId(source)
    local custom = gsa2
    if custom and vRP.hasPermission(user_id,"gsa.permissao") or vRP.hasPermission(user_id,"pm.permissao") then
		TriggerClientEvent("progress",source,5000,"vestindo")
		vCLIENT.closeMenu(source)
		TriggerClientEvent('cancelando',source,true)
		vRPclient._playAnim(source,false,{{"clothingshirt","try_shirt_positive_d"}},true)
		SetTimeout(5000,function()

			vRPclient._stopAnim(source,false)
			TriggerClientEvent('cancelando',source,false)
			local old_custom = vRPclient.getCustomization(source)
			local idle_copy = {}

			idle_copy = vRP.save_idle_custom(source,old_custom)
			idle_copy.modelhash = nil

			for k,v in pairs(custom[old_custom.modelhash]) do
				idle_copy[k] = v
			end
			vRPclient._setCustomization(source,idle_copy)
        end)
	else
        TriggerClientEvent("Notify",source,"negado","Você não é da organição!",5000)
    end
end)

RegisterServerEvent("gic1")
AddEventHandler("gic1",function()
	local source = source
    local user_id = vRP.getUserId(source)
    local custom = gic1
    if custom and vRP.hasPermission(user_id,"gic.permissao") or vRP.hasPermission(user_id,"pm.permissao") then
		TriggerClientEvent("progress",source,5000,"vestindo")
		vCLIENT.closeMenu(source)
		TriggerClientEvent('cancelando',source,true)
		vRPclient._playAnim(source,false,{{"clothingshirt","try_shirt_positive_d"}},true)
		SetTimeout(5000,function()

			vRPclient._stopAnim(source,false)
			TriggerClientEvent('cancelando',source,false)
			local old_custom = vRPclient.getCustomization(source)
			local idle_copy = {}

			idle_copy = vRP.save_idle_custom(source,old_custom)
			idle_copy.modelhash = nil

			for k,v in pairs(custom[old_custom.modelhash]) do
				idle_copy[k] = v
			end
			vRPclient._setCustomization(source,idle_copy)
        end)
	else
        TriggerClientEvent("Notify",source,"negado","Você não é da organição!",5000)
    end
end)

RegisterServerEvent("gic2")
AddEventHandler("gic2",function()
	local source = source
    local user_id = vRP.getUserId(source)
    local custom = gic2
    if custom and vRP.hasPermission(user_id,"gic.permissao") or vRP.hasPermission(user_id,"pm.permissao") then
		TriggerClientEvent("progress",source,5000,"vestindo")
		vCLIENT.closeMenu(source)
		TriggerClientEvent('cancelando',source,true)
		vRPclient._playAnim(source,false,{{"clothingshirt","try_shirt_positive_d"}},true)
		SetTimeout(5000,function()

			vRPclient._stopAnim(source,false)
			TriggerClientEvent('cancelando',source,false)
			local old_custom = vRPclient.getCustomization(source)
			local idle_copy = {}

			idle_copy = vRP.save_idle_custom(source,old_custom)
			idle_copy.modelhash = nil

			for k,v in pairs(custom[old_custom.modelhash]) do
				idle_copy[k] = v
			end
			vRPclient._setCustomization(source,idle_copy)
        end)
	else
		TriggerClientEvent("Notify",source,"negado","Você não é da organição!",5000)
	end
    
end)

RegisterServerEvent("gic3")
AddEventHandler("gic3",function()
	local source = source
    local user_id = vRP.getUserId(source)
    local custom = gic3
    if custom and vRP.hasPermission(user_id,"gic.permissao") or vRP.hasPermission(user_id,"pm.permissao") then
		TriggerClientEvent("progress",source,5000,"vestindo")
		vCLIENT.closeMenu(source)
		TriggerClientEvent('cancelando',source,true)
		vRPclient._playAnim(source,false,{{"clothingshirt","try_shirt_positive_d"}},true)
		SetTimeout(5000,function()

			vRPclient._stopAnim(source,false)
			TriggerClientEvent('cancelando',source,false)
			local old_custom = vRPclient.getCustomization(source)
			local idle_copy = {}

			idle_copy = vRP.save_idle_custom(source,old_custom)
			idle_copy.modelhash = nil

			for k,v in pairs(custom[old_custom.modelhash]) do
				idle_copy[k] = v
			end
			vRPclient._setCustomization(source,idle_copy)
        end)
	else
		TriggerClientEvent("Notify",source,"negado","Você não é da organição!",5000)
	end
    
end)

RegisterServerEvent("aluno")
AddEventHandler("aluno",function()
	local source = source
    local user_id = vRP.getUserId(source)
    local custom = aluno
    if custom and vRP.hasPermission(user_id,"rpm.permissao") or vRP.hasPermission(user_id,"pm.permissao") then
		TriggerClientEvent("progress",source,5000,"vestindo")
		vCLIENT.closeMenu(source)
		TriggerClientEvent('cancelando',source,true)
		vRPclient._playAnim(source,false,{{"clothingshirt","try_shirt_positive_d"}},true)
		SetTimeout(5000,function()

			vRPclient._stopAnim(source,false)
			TriggerClientEvent('cancelando',source,false)
			local old_custom = vRPclient.getCustomization(source)
			local idle_copy = {}

			idle_copy = vRP.save_idle_custom(source,old_custom)
			idle_copy.modelhash = nil

			for k,v in pairs(custom[old_custom.modelhash]) do
				idle_copy[k] = v
			end
			vRPclient._setCustomization(source,idle_copy)
        end)
	else
		TriggerClientEvent("Notify",source,"negado","Você não é da organição!",5000)
	end
    
end)

RegisterServerEvent("instrutor")
AddEventHandler("instrutor",function()
	local source = source
    local user_id = vRP.getUserId(source)
    local custom = instrutor
    if custom and vRP.hasPermission(user_id,"rpm.permissao") or vRP.hasPermission(user_id,"pm.permissao") then
		TriggerClientEvent("progress",source,5000,"vestindo")
		vCLIENT.closeMenu(source)
		TriggerClientEvent('cancelando',source,true)
		vRPclient._playAnim(source,false,{{"clothingshirt","try_shirt_positive_d"}},true)
		SetTimeout(5000,function()

			vRPclient._stopAnim(source,false)
			TriggerClientEvent('cancelando',source,false)
			local old_custom = vRPclient.getCustomization(source)
			local idle_copy = {}

			idle_copy = vRP.save_idle_custom(source,old_custom)
			idle_copy.modelhash = nil

			for k,v in pairs(custom[old_custom.modelhash]) do
				idle_copy[k] = v
			end
			vRPclient._setCustomization(source,idle_copy)
        end)
	else
		TriggerClientEvent("Notify",source,"negado","Você não é da organição!",5000)
	end
    
end)

RegisterServerEvent("comando")
AddEventHandler("comando",function()
	local source = source
    local user_id = vRP.getUserId(source)
    local custom = comando
    if custom and vRP.hasPermission(user_id,"pm.permissao") then
		TriggerClientEvent("progress",source,5000,"vestindo")
		vCLIENT.closeMenu(source)
		TriggerClientEvent('cancelando',source,true)
		vRPclient._playAnim(source,false,{{"clothingshirt","try_shirt_positive_d"}},true)
		SetTimeout(5000,function()

			vRPclient._stopAnim(source,false)
			TriggerClientEvent('cancelando',source,false)
			local old_custom = vRPclient.getCustomization(source)
			local idle_copy = {}

			idle_copy = vRP.save_idle_custom(source,old_custom)
			idle_copy.modelhash = nil

			for k,v in pairs(custom[old_custom.modelhash]) do
				idle_copy[k] = v
			end
			vRPclient._setCustomization(source,idle_copy)
        end)
	else
		TriggerClientEvent("Notify",source,"negado","Você não é da organição!",5000)
	end
    
end)




RegisterServerEvent("off-uniform")
AddEventHandler("off-uniform",function()
	local source = source
	local user_id = vRP.getUserId(source)
	TriggerClientEvent("progress",source,2000,"Retirando")
	vCLIENT.closeMenu(source)
	TriggerClientEvent('cancelando',source,true)
	vRPclient._playAnim(source,false,{{"clothingshirt","try_shirt_positive_d"}},true)
	SetTimeout(2000,function()
		TriggerClientEvent('cancelando',source,false)
		vRPclient._stopAnim(source,false)
		vRP.removeCloak(source)
	end)
end)

function vRPex.checkOfficer()
	local source = source
	local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"policia.permissao") or vRP.hasPermission(user_id,"admin.permissao") then
        return true
	end
end
