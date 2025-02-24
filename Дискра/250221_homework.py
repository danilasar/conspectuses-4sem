#!python
from math import comb, perm

solutions = {
    1: perm(5, 3),
    2: comb(5, 3),
    3: 2**10,
    4: 30 * 29,
    5: comb(30, 2),
    6: comb(10, 2)*20 + 10*comb(20, 2),
    7: comb(3,1) * comb(30,3),
    8: 30**3 * 10**3,
    9: (perm(5,5), perm(7,7) // (perm(3,3)*perm(2,2))),
    10: perm(4,4),
    11: perm(4,4) // 2,
    12: perm(3,3),
    13: 4*3,
    14: None,  # Requires specific n value
    15: {
        'i': comb(36,5),
        'ii': comb(4,4)*comb(32,1),
        'iii': comb(9,5),
        'iv': 4*comb(9,5)
    },
    16: 4**2,
    17: comb(3,1)*comb(5,2)*comb(30,3),
    18: 10**5,
    19: 1,
    20: comb(5,2)*comb(31,3),
    21: 7**4,
    22: perm(7,4),
    23: comb(6,2),
    24: perm(9,9) // (perm(3,3)*perm(2,2)*perm(3,3)),
    25: (comb(7,4), comb(3,2)*comb(4,2)),
    26: perm(5,5),
    27: perm(6,6) // (perm(3,3)*perm(3,3)),
    28: None,  # Requires m, n, p
    29: comb(7,3),
    30: 96,
    31: 499,
    32: comb(12,8) - comb(10,8),
    33: comb(10,2) + comb(13,2),
    34: 10*13,
    35: comb(10,2)*comb(13,2),
    36: 4*4 + comb(4,2),
    37: {
        'а': perm(4,4),
        'б': 2**4 - 1,
        'в': perm(4,2)
    },
    38: comb(4,2)*comb(5,1),
    39: {
        1: 11,
        2: 11*10*3,
        3: perm(11,3),
        4: 11**3
    },
    40: perm(11,11) // (perm(3,3)*perm(3,3)*perm(2,2)),
    41: perm(7,7) // (perm(4,4)*perm(2,2)),
    42: comb(7,5),
    43: comb(6,3),
    44: (12**3)*(10**3 - 1)
}

for key, value in solutions.items():
    print(f"{key}\t{value}")
