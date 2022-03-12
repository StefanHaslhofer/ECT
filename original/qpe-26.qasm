OPENQASM 2.0;
include "qelib1.inc";
qreg q[26];
qreg psi[1];
creg c[26];
rz(pi/2) q[0];
sx q[0];
rz(pi/2) q[0];
rz(pi/2) q[1];
sx q[1];
rz(pi/2) q[1];
rz(pi/2) q[2];
sx q[2];
rz(pi/2) q[2];
rz(pi/2) q[3];
sx q[3];
rz(pi/2) q[3];
rz(pi/2) q[4];
sx q[4];
rz(pi/2) q[4];
rz(pi/2) q[5];
sx q[5];
rz(pi/2) q[5];
rz(pi/2) q[6];
sx q[6];
rz(pi/2) q[6];
rz(pi/2) q[7];
sx q[7];
rz(pi/2) q[7];
rz(pi/2) q[8];
sx q[8];
rz(pi/2) q[8];
rz(pi/2) q[9];
sx q[9];
rz(pi/2) q[9];
rz(pi/2) q[10];
sx q[10];
rz(pi/2) q[10];
rz(pi/2) q[11];
sx q[11];
rz(pi/2) q[11];
rz(pi/2) q[12];
sx q[12];
rz(pi/2) q[12];
rz(pi/2) q[13];
sx q[13];
rz(pi/2) q[13];
rz(pi/2) q[14];
sx q[14];
rz(pi/2) q[14];
rz(pi/2) q[15];
sx q[15];
rz(pi/2) q[15];
rz(pi/2) q[16];
sx q[16];
rz(pi/2) q[16];
rz(pi/2) q[17];
sx q[17];
rz(pi/2) q[17];
rz(pi/2) q[18];
sx q[18];
rz(pi/2) q[18];
rz(pi/2) q[19];
sx q[19];
rz(pi/2) q[19];
rz(pi/2) q[20];
sx q[20];
rz(pi/2) q[20];
rz(pi/2) q[21];
sx q[21];
rz(pi/2) q[21];
rz(pi/2) q[22];
sx q[22];
rz(pi/2) q[22];
rz(pi/2) q[23];
sx q[23];
rz(pi/2) q[23];
rz(pi/2) q[24];
sx q[24];
rz(pi/2) q[24];
rz(pi/2) q[25];
sx q[25];
rz(pi/2) q[25];
x psi[0];
rz(0.63924127162767408) psi[0];
cx psi[0],q[0];
rz(0.639241271627675) q[0];
cx psi[0],q[0];
cx psi[0],q[1];
rz(-0.639241271627675) q[0];
cx q[0],q[25];
rz(1.27848254325535) q[1];
cx psi[0],q[1];
cx psi[0],q[2];
rz(-1.27848254325535) q[1];
rz(-0.584627567079095) q[2];
cx psi[0],q[2];
cx psi[0],q[3];
rz(0.584627567079094) q[2];
cx q[25],q[0];
cx q[0],q[25];
rz(pi/2) q[0];
sx q[0];
rz(pi/2) q[0];
rz(-1.16925513415819) q[3];
cx psi[0],q[3];
cx psi[0],q[4];
rz(1.16925513415819) q[3];
rz(0.803082385273415) q[4];
cx psi[0],q[4];
cx psi[0],q[5];
rz(-0.803082385273415) q[4];
rz(-1.53542788304297) q[5];
cx psi[0],q[5];
cx psi[0],q[6];
rz(1.53542788304296) q[5];
rz(0.070736887503867) q[6];
cx psi[0],q[6];
cx psi[0],q[7];
rz(-0.0707368875038672) q[6];
rz(0.141473775007735) q[7];
cx psi[0],q[7];
cx psi[0],q[8];
rz(-0.141473775007734) q[7];
rz(0.282947550015469) q[8];
cx psi[0],q[8];
cx psi[0],q[9];
rz(-0.282947550015469) q[8];
rz(0.565895100030935) q[9];
cx psi[0],q[9];
cx psi[0],q[10];
rz(1.13179020006187) q[10];
cx psi[0],q[10];
cx psi[0],q[11];
rz(-1.13179020006187) q[10];
rz(-0.878012253466045) q[11];
cx psi[0],q[11];
cx psi[0],q[12];
rz(0.878012253466044) q[11];
rz(1.38556814665771) q[12];
cx psi[0],q[12];
cx psi[0],q[13];
rz(-1.38556814665771) q[12];
rz(-0.370456360274383) q[13];
cx psi[0],q[13];
cx psi[0],q[14];
rz(0.370456360274382) q[13];
cx q[12],q[13];
cx q[13],q[12];
cx q[12],q[13];
rz(0.00038349519697145062) q[12];
rz(0.00019174759848583633) q[13];
rz(-0.740912720548765) q[14];
cx psi[0],q[14];
cx psi[0],q[15];
rz(0.740912720548765) q[14];
cx q[11],q[14];
cx q[14],q[11];
cx q[11],q[14];
rz(0.00076699039394290125) q[11];
rz(9.5873799242918167e-05) q[14];
rz(-1.48182544109753) q[15];
cx psi[0],q[15];
cx psi[0],q[16];
rz(1.48182544109753) q[15];
cx q[10],q[15];
cx q[15],q[10];
cx q[10],q[15];
rz(0.0015339807878855805) q[10];
rz(4.7936899621348061e-05) q[15];
rz(29*pi/512) q[16];
cx psi[0],q[16];
cx psi[0],q[17];
rz(-29*pi/512) q[16];
rz(29*pi/256) q[17];
cx psi[0],q[17];
cx psi[0],q[18];
rz(-29*pi/256) q[17];
rz(29*pi/128) q[18];
cx psi[0],q[18];
cx psi[0],q[19];
rz(-29*pi/128) q[18];
rz(29*pi/64) q[19];
cx psi[0],q[19];
cx psi[0],q[20];
rz(-29*pi/64) q[19];
rz(-3*pi/32) q[20];
cx psi[0],q[20];
cx psi[0],q[21];
rz(3*pi/32) q[20];
rz(-3*pi/16) q[21];
cx psi[0],q[21];
cx psi[0],q[22];
rz(3*pi/16) q[21];
rz(-3*pi/8) q[22];
cx psi[0],q[22];
cx psi[0],q[23];
rz(3*pi/8) q[22];
rz(pi/4) q[23];
cx psi[0],q[23];
cx psi[0],q[24];
rz(-pi/4) q[23];
cx q[2],q[23];
cx q[23],q[2];
cx q[2],q[23];
rz(pi/8) q[2];
rz(-pi/2) q[24];
cx psi[0],q[24];
rz(pi/2) q[24];
cx q[1],q[24];
cx q[24],q[1];
cx q[1],q[24];
rz(pi/4) q[1];
cx q[1],q[0];
rz(pi/4) q[0];
cx q[1],q[0];
rz(-pi/4) q[0];
sx q[1];
rz(pi/2) q[1];
cx q[2],q[0];
rz(pi/8) q[0];
cx q[2],q[0];
rz(-pi/8) q[0];
cx q[2],q[1];
rz(pi/4) q[1];
cx q[2],q[1];
rz(-pi/4) q[1];
sx q[2];
rz(pi/2) q[2];
cx q[3],q[22];
cx q[22],q[3];
cx q[3],q[22];
rz(pi/16) q[3];
cx q[3],q[0];
rz(pi/16) q[0];
cx q[3],q[0];
rz(-pi/16) q[0];
cx q[3],q[1];
rz(pi/8) q[1];
cx q[3],q[1];
rz(-pi/8) q[1];
cx q[3],q[2];
rz(pi/4) q[2];
cx q[3],q[2];
rz(-pi/4) q[2];
sx q[3];
rz(pi/2) q[3];
cx q[4],q[21];
cx q[21],q[4];
cx q[4],q[21];
rz(1*pi/32) q[4];
cx q[4],q[0];
rz(1*pi/32) q[0];
cx q[4],q[0];
rz(-1*pi/32) q[0];
cx q[4],q[1];
rz(pi/16) q[1];
cx q[4],q[1];
rz(-pi/16) q[1];
cx q[4],q[2];
rz(pi/8) q[2];
cx q[4],q[2];
rz(-pi/8) q[2];
cx q[4],q[3];
rz(pi/4) q[3];
cx q[4],q[3];
rz(-pi/4) q[3];
sx q[4];
rz(pi/2) q[4];
cx q[5],q[20];
cx q[20],q[5];
cx q[5],q[20];
rz(1*pi/64) q[5];
cx q[5],q[0];
rz(1*pi/64) q[0];
cx q[5],q[0];
rz(-1*pi/64) q[0];
cx q[5],q[1];
rz(1*pi/32) q[1];
cx q[5],q[1];
rz(-1*pi/32) q[1];
cx q[5],q[2];
rz(pi/16) q[2];
cx q[5],q[2];
rz(-pi/16) q[2];
cx q[5],q[3];
rz(pi/8) q[3];
cx q[5],q[3];
rz(-pi/8) q[3];
cx q[5],q[4];
rz(pi/4) q[4];
cx q[5],q[4];
rz(-pi/4) q[4];
sx q[5];
rz(pi/2) q[5];
cx q[6],q[19];
cx q[19],q[6];
cx q[6],q[19];
rz(1*pi/128) q[6];
cx q[6],q[0];
rz(1*pi/128) q[0];
cx q[6],q[0];
rz(-1*pi/128) q[0];
cx q[6],q[1];
rz(1*pi/64) q[1];
cx q[6],q[1];
rz(-1*pi/64) q[1];
cx q[6],q[2];
rz(1*pi/32) q[2];
cx q[6],q[2];
rz(-1*pi/32) q[2];
cx q[6],q[3];
rz(pi/16) q[3];
cx q[6],q[3];
rz(-pi/16) q[3];
cx q[6],q[4];
rz(pi/8) q[4];
cx q[6],q[4];
rz(-pi/8) q[4];
cx q[6],q[5];
rz(pi/4) q[5];
cx q[6],q[5];
rz(-pi/4) q[5];
sx q[6];
rz(pi/2) q[6];
cx q[7],q[18];
cx q[18],q[7];
cx q[7],q[18];
rz(1*pi/256) q[7];
cx q[7],q[0];
rz(1*pi/256) q[0];
cx q[7],q[0];
rz(-1*pi/256) q[0];
cx q[7],q[1];
rz(1*pi/128) q[1];
cx q[7],q[1];
rz(-1*pi/128) q[1];
cx q[7],q[2];
rz(1*pi/64) q[2];
cx q[7],q[2];
rz(-1*pi/64) q[2];
cx q[7],q[3];
rz(1*pi/32) q[3];
cx q[7],q[3];
rz(-1*pi/32) q[3];
cx q[7],q[4];
rz(pi/16) q[4];
cx q[7],q[4];
rz(-pi/16) q[4];
cx q[7],q[5];
rz(pi/8) q[5];
cx q[7],q[5];
rz(-pi/8) q[5];
cx q[7],q[6];
rz(pi/4) q[6];
cx q[7],q[6];
rz(-pi/4) q[6];
sx q[7];
rz(pi/2) q[7];
cx q[8],q[17];
cx q[17],q[8];
cx q[8],q[17];
rz(1.1984224905337015e-05) q[17];
rz(1*pi/512) q[8];
cx q[8],q[0];
rz(1*pi/512) q[0];
cx q[8],q[0];
rz(-1*pi/512) q[0];
cx q[8],q[1];
rz(1*pi/256) q[1];
cx q[8],q[1];
rz(-1*pi/256) q[1];
cx q[8],q[2];
rz(1*pi/128) q[2];
cx q[8],q[2];
rz(-1*pi/128) q[2];
cx q[8],q[3];
rz(1*pi/64) q[3];
cx q[8],q[3];
rz(-1*pi/64) q[3];
cx q[8],q[4];
rz(1*pi/32) q[4];
cx q[8],q[4];
rz(-1*pi/32) q[4];
cx q[8],q[5];
rz(pi/16) q[5];
cx q[8],q[5];
rz(-pi/16) q[5];
cx q[8],q[6];
rz(pi/8) q[6];
cx q[8],q[6];
rz(-pi/8) q[6];
cx q[8],q[7];
rz(pi/4) q[7];
cx q[8],q[7];
rz(-pi/4) q[7];
sx q[8];
rz(pi/2) q[8];
rz(-0.565895100030937) q[9];
cx q[9],q[16];
cx q[16],q[9];
cx q[9],q[16];
rz(2.3968449810674031e-05) q[16];
rz(0.0030679615757711609) q[9];
cx q[9],q[0];
rz(0.00306796157577128) q[0];
cx q[9],q[0];
rz(-0.00306796157577128) q[0];
cx q[10],q[0];
rz(0.00153398078788564) q[0];
cx q[10],q[0];
rz(-0.00153398078788564) q[0];
cx q[11],q[0];
rz(0.00076699039394282) q[0];
cx q[11],q[0];
rz(-0.000766990393942821) q[0];
cx q[12],q[0];
rz(0.000383495196971411) q[0];
cx q[12],q[0];
rz(-0.00038349519697141) q[0];
cx q[13],q[0];
rz(0.000191747598485705) q[0];
cx q[13],q[0];
rz(-0.000191747598485705) q[0];
cx q[14],q[0];
rz(9.58737992428525e-5) q[0];
cx q[14],q[0];
rz(-9.58737992428526e-5) q[0];
cx q[15],q[0];
rz(4.79368996214263e-5) q[0];
cx q[15],q[0];
rz(-4.79368996214263e-5) q[0];
cx q[16],q[0];
rz(2.39684498107132e-5) q[0];
cx q[16],q[0];
rz(-2.39684498107131e-5) q[0];
cx q[17],q[0];
rz(1.19842249053565e-5) q[0];
cx q[17],q[0];
rz(-1.19842249053566e-5) q[0];
cx q[9],q[1];
rz(1*pi/512) q[1];
cx q[9],q[1];
rz(-1*pi/512) q[1];
cx q[10],q[1];
rz(0.00306796157577128) q[1];
cx q[10],q[1];
rz(-0.00306796157577128) q[1];
cx q[11],q[1];
rz(0.00153398078788564) q[1];
cx q[11],q[1];
rz(-0.00153398078788564) q[1];
cx q[12],q[1];
rz(0.00076699039394282) q[1];
cx q[12],q[1];
rz(-0.000766990393942821) q[1];
cx q[13],q[1];
rz(0.000383495196971411) q[1];
cx q[13],q[1];
rz(-0.00038349519697141) q[1];
cx q[14],q[1];
rz(0.000191747598485705) q[1];
cx q[14],q[1];
rz(-0.000191747598485705) q[1];
cx q[15],q[1];
rz(9.58737992428525e-5) q[1];
cx q[15],q[1];
rz(-9.58737992428526e-5) q[1];
cx q[16],q[1];
rz(4.79368996214263e-5) q[1];
cx q[16],q[1];
rz(-4.79368996214263e-5) q[1];
cx q[17],q[1];
rz(2.39684498107132e-5) q[1];
cx q[17],q[1];
rz(-2.39684498107131e-5) q[1];
cx q[18],q[1];
rz(1.19842249053565e-5) q[1];
cx q[18],q[1];
rz(-1.19842249053566e-5) q[1];
cx q[9],q[2];
rz(1*pi/256) q[2];
cx q[9],q[2];
rz(-1*pi/256) q[2];
cx q[10],q[2];
rz(1*pi/512) q[2];
cx q[10],q[2];
rz(-1*pi/512) q[2];
cx q[11],q[2];
rz(0.00306796157577128) q[2];
cx q[11],q[2];
rz(-0.00306796157577128) q[2];
cx q[12],q[2];
rz(0.00153398078788564) q[2];
cx q[12],q[2];
rz(-0.00153398078788564) q[2];
cx q[13],q[2];
rz(0.00076699039394282) q[2];
cx q[13],q[2];
rz(-0.000766990393942821) q[2];
cx q[14],q[2];
rz(0.000383495196971411) q[2];
cx q[14],q[2];
rz(-0.00038349519697141) q[2];
cx q[15],q[2];
rz(0.000191747598485705) q[2];
cx q[15],q[2];
rz(-0.000191747598485705) q[2];
cx q[16],q[2];
rz(9.58737992428525e-5) q[2];
cx q[16],q[2];
rz(-9.58737992428526e-5) q[2];
cx q[17],q[2];
rz(4.79368996214263e-5) q[2];
cx q[17],q[2];
rz(-4.79368996214263e-5) q[2];
cx q[18],q[2];
rz(2.39684498107132e-5) q[2];
cx q[18],q[2];
rz(-2.39684498107131e-5) q[2];
cx q[19],q[2];
rz(1.19842249053565e-5) q[2];
cx q[19],q[2];
rz(-1.19842249053566e-5) q[2];
cx q[9],q[3];
rz(1*pi/128) q[3];
cx q[9],q[3];
rz(-1*pi/128) q[3];
cx q[10],q[3];
rz(1*pi/256) q[3];
cx q[10],q[3];
rz(-1*pi/256) q[3];
cx q[11],q[3];
rz(1*pi/512) q[3];
cx q[11],q[3];
rz(-1*pi/512) q[3];
cx q[12],q[3];
rz(0.00306796157577128) q[3];
cx q[12],q[3];
rz(-0.00306796157577128) q[3];
cx q[13],q[3];
rz(0.00153398078788564) q[3];
cx q[13],q[3];
rz(-0.00153398078788564) q[3];
cx q[14],q[3];
rz(0.00076699039394282) q[3];
cx q[14],q[3];
rz(-0.000766990393942821) q[3];
cx q[15],q[3];
rz(0.000383495196971411) q[3];
cx q[15],q[3];
rz(-0.00038349519697141) q[3];
cx q[16],q[3];
rz(0.000191747598485705) q[3];
cx q[16],q[3];
rz(-0.000191747598485705) q[3];
cx q[17],q[3];
rz(9.58737992428525e-5) q[3];
cx q[17],q[3];
rz(-9.58737992428526e-5) q[3];
cx q[18],q[3];
rz(4.79368996214263e-5) q[3];
cx q[18],q[3];
rz(-4.79368996214263e-5) q[3];
cx q[19],q[3];
rz(2.39684498107132e-5) q[3];
cx q[19],q[3];
rz(-2.39684498107131e-5) q[3];
cx q[20],q[3];
rz(1.19842249053565e-5) q[3];
cx q[20],q[3];
rz(-1.19842249053566e-5) q[3];
cx q[9],q[4];
rz(1*pi/64) q[4];
cx q[9],q[4];
rz(-1*pi/64) q[4];
cx q[10],q[4];
rz(1*pi/128) q[4];
cx q[10],q[4];
rz(-1*pi/128) q[4];
cx q[11],q[4];
rz(1*pi/256) q[4];
cx q[11],q[4];
rz(-1*pi/256) q[4];
cx q[12],q[4];
rz(1*pi/512) q[4];
cx q[12],q[4];
rz(-1*pi/512) q[4];
cx q[13],q[4];
rz(0.00306796157577128) q[4];
cx q[13],q[4];
rz(-0.00306796157577128) q[4];
cx q[14],q[4];
rz(0.00153398078788564) q[4];
cx q[14],q[4];
rz(-0.00153398078788564) q[4];
cx q[15],q[4];
rz(0.00076699039394282) q[4];
cx q[15],q[4];
rz(-0.000766990393942821) q[4];
cx q[16],q[4];
rz(0.000383495196971411) q[4];
cx q[16],q[4];
rz(-0.00038349519697141) q[4];
cx q[17],q[4];
rz(0.000191747598485705) q[4];
cx q[17],q[4];
rz(-0.000191747598485705) q[4];
cx q[18],q[4];
rz(9.58737992428525e-5) q[4];
cx q[18],q[4];
rz(-9.58737992428526e-5) q[4];
cx q[19],q[4];
rz(4.79368996214263e-5) q[4];
cx q[19],q[4];
rz(-4.79368996214263e-5) q[4];
cx q[20],q[4];
rz(2.39684498107132e-5) q[4];
cx q[20],q[4];
rz(-2.39684498107131e-5) q[4];
cx q[21],q[4];
rz(1.19842249053565e-5) q[4];
cx q[21],q[4];
rz(-1.19842249053566e-5) q[4];
cx q[9],q[5];
rz(1*pi/32) q[5];
cx q[9],q[5];
rz(-1*pi/32) q[5];
cx q[10],q[5];
rz(1*pi/64) q[5];
cx q[10],q[5];
rz(-1*pi/64) q[5];
cx q[11],q[5];
rz(1*pi/128) q[5];
cx q[11],q[5];
rz(-1*pi/128) q[5];
cx q[12],q[5];
rz(1*pi/256) q[5];
cx q[12],q[5];
rz(-1*pi/256) q[5];
cx q[13],q[5];
rz(1*pi/512) q[5];
cx q[13],q[5];
rz(-1*pi/512) q[5];
cx q[14],q[5];
rz(0.00306796157577128) q[5];
cx q[14],q[5];
rz(-0.00306796157577128) q[5];
cx q[15],q[5];
rz(0.00153398078788564) q[5];
cx q[15],q[5];
rz(-0.00153398078788564) q[5];
cx q[16],q[5];
rz(0.00076699039394282) q[5];
cx q[16],q[5];
rz(-0.000766990393942821) q[5];
cx q[17],q[5];
rz(0.000383495196971411) q[5];
cx q[17],q[5];
rz(-0.00038349519697141) q[5];
cx q[18],q[5];
rz(0.000191747598485705) q[5];
cx q[18],q[5];
rz(-0.000191747598485705) q[5];
cx q[19],q[5];
rz(9.58737992428525e-5) q[5];
cx q[19],q[5];
rz(-9.58737992428526e-5) q[5];
cx q[20],q[5];
rz(4.79368996214263e-5) q[5];
cx q[20],q[5];
rz(-4.79368996214263e-5) q[5];
cx q[21],q[5];
rz(2.39684498107132e-5) q[5];
cx q[21],q[5];
rz(-2.39684498107131e-5) q[5];
cx q[22],q[5];
rz(1.19842249053565e-5) q[5];
cx q[22],q[5];
rz(-1.19842249053566e-5) q[5];
cx q[9],q[6];
rz(pi/16) q[6];
cx q[9],q[6];
rz(-pi/16) q[6];
cx q[10],q[6];
rz(1*pi/32) q[6];
cx q[10],q[6];
rz(-1*pi/32) q[6];
cx q[11],q[6];
rz(1*pi/64) q[6];
cx q[11],q[6];
rz(-1*pi/64) q[6];
cx q[12],q[6];
rz(1*pi/128) q[6];
cx q[12],q[6];
rz(-1*pi/128) q[6];
cx q[13],q[6];
rz(1*pi/256) q[6];
cx q[13],q[6];
rz(-1*pi/256) q[6];
cx q[14],q[6];
rz(1*pi/512) q[6];
cx q[14],q[6];
rz(-1*pi/512) q[6];
cx q[15],q[6];
rz(0.00306796157577128) q[6];
cx q[15],q[6];
rz(-0.00306796157577128) q[6];
cx q[16],q[6];
rz(0.00153398078788564) q[6];
cx q[16],q[6];
rz(-0.00153398078788564) q[6];
cx q[17],q[6];
rz(0.00076699039394282) q[6];
cx q[17],q[6];
rz(-0.000766990393942821) q[6];
cx q[18],q[6];
rz(0.000383495196971411) q[6];
cx q[18],q[6];
rz(-0.00038349519697141) q[6];
cx q[19],q[6];
rz(0.000191747598485705) q[6];
cx q[19],q[6];
rz(-0.000191747598485705) q[6];
cx q[20],q[6];
rz(9.58737992428525e-5) q[6];
cx q[20],q[6];
rz(-9.58737992428526e-5) q[6];
cx q[21],q[6];
rz(4.79368996214263e-5) q[6];
cx q[21],q[6];
rz(-4.79368996214263e-5) q[6];
cx q[22],q[6];
rz(2.39684498107132e-5) q[6];
cx q[22],q[6];
rz(-2.39684498107131e-5) q[6];
cx q[23],q[6];
rz(1.19842249053565e-5) q[6];
cx q[23],q[6];
rz(-1.19842249053566e-5) q[6];
cx q[9],q[7];
rz(pi/8) q[7];
cx q[9],q[7];
rz(-pi/8) q[7];
cx q[10],q[7];
rz(pi/16) q[7];
cx q[10],q[7];
rz(-pi/16) q[7];
cx q[11],q[7];
rz(1*pi/32) q[7];
cx q[11],q[7];
rz(-1*pi/32) q[7];
cx q[12],q[7];
rz(1*pi/64) q[7];
cx q[12],q[7];
rz(-1*pi/64) q[7];
cx q[13],q[7];
rz(1*pi/128) q[7];
cx q[13],q[7];
rz(-1*pi/128) q[7];
cx q[14],q[7];
rz(1*pi/256) q[7];
cx q[14],q[7];
rz(-1*pi/256) q[7];
cx q[15],q[7];
rz(1*pi/512) q[7];
cx q[15],q[7];
rz(-1*pi/512) q[7];
cx q[16],q[7];
rz(0.00306796157577128) q[7];
cx q[16],q[7];
rz(-0.00306796157577128) q[7];
cx q[17],q[7];
rz(0.00153398078788564) q[7];
cx q[17],q[7];
rz(-0.00153398078788564) q[7];
cx q[18],q[7];
rz(0.00076699039394282) q[7];
cx q[18],q[7];
rz(-0.000766990393942821) q[7];
cx q[19],q[7];
rz(0.000383495196971411) q[7];
cx q[19],q[7];
rz(-0.00038349519697141) q[7];
cx q[20],q[7];
rz(0.000191747598485705) q[7];
cx q[20],q[7];
rz(-0.000191747598485705) q[7];
cx q[21],q[7];
rz(9.58737992428525e-5) q[7];
cx q[21],q[7];
rz(-9.58737992428526e-5) q[7];
cx q[22],q[7];
rz(4.79368996214263e-5) q[7];
cx q[22],q[7];
rz(-4.79368996214263e-5) q[7];
cx q[23],q[7];
rz(2.39684498107132e-5) q[7];
cx q[23],q[7];
rz(-2.39684498107131e-5) q[7];
cx q[24],q[7];
rz(1.19842249053565e-5) q[7];
cx q[24],q[7];
rz(-1.19842249053566e-5) q[7];
cx q[9],q[8];
rz(pi/4) q[8];
cx q[9],q[8];
rz(-pi/4) q[8];
cx q[10],q[8];
rz(pi/8) q[8];
cx q[10],q[8];
rz(-pi/8) q[8];
cx q[11],q[8];
rz(pi/16) q[8];
cx q[11],q[8];
rz(-pi/16) q[8];
cx q[12],q[8];
rz(1*pi/32) q[8];
cx q[12],q[8];
rz(-1*pi/32) q[8];
cx q[13],q[8];
rz(1*pi/64) q[8];
cx q[13],q[8];
rz(-1*pi/64) q[8];
cx q[14],q[8];
rz(1*pi/128) q[8];
cx q[14],q[8];
rz(-1*pi/128) q[8];
cx q[15],q[8];
rz(1*pi/256) q[8];
cx q[15],q[8];
rz(-1*pi/256) q[8];
cx q[16],q[8];
rz(1*pi/512) q[8];
cx q[16],q[8];
rz(-1*pi/512) q[8];
cx q[17],q[8];
rz(0.00306796157577128) q[8];
cx q[17],q[8];
rz(-0.00306796157577128) q[8];
cx q[18],q[8];
rz(0.00153398078788564) q[8];
cx q[18],q[8];
rz(-0.00153398078788564) q[8];
cx q[19],q[8];
rz(0.00076699039394282) q[8];
cx q[19],q[8];
rz(-0.000766990393942821) q[8];
cx q[20],q[8];
rz(0.000383495196971411) q[8];
cx q[20],q[8];
rz(-0.00038349519697141) q[8];
cx q[21],q[8];
rz(0.000191747598485705) q[8];
cx q[21],q[8];
rz(-0.000191747598485705) q[8];
cx q[22],q[8];
rz(9.58737992428525e-5) q[8];
cx q[22],q[8];
rz(-9.58737992428526e-5) q[8];
cx q[23],q[8];
rz(4.79368996214263e-5) q[8];
cx q[23],q[8];
rz(-4.79368996214263e-5) q[8];
cx q[24],q[8];
rz(2.39684498107132e-5) q[8];
cx q[24],q[8];
rz(-2.39684498107131e-5) q[8];
cx q[25],q[8];
rz(1.19842249053565e-5) q[8];
cx q[25],q[8];
rz(-1.19842249053566e-5) q[8];
sx q[9];
rz(pi/2) q[9];
cx q[10],q[9];
rz(pi/4) q[9];
cx q[10],q[9];
sx q[10];
rz(pi/2) q[10];
rz(-pi/4) q[9];
cx q[11],q[9];
rz(pi/8) q[9];
cx q[11],q[9];
cx q[11],q[10];
rz(pi/4) q[10];
cx q[11],q[10];
rz(-pi/4) q[10];
sx q[11];
rz(pi/2) q[11];
rz(-pi/8) q[9];
cx q[12],q[9];
rz(pi/16) q[9];
cx q[12],q[9];
cx q[12],q[10];
rz(pi/8) q[10];
cx q[12],q[10];
rz(-pi/8) q[10];
cx q[12],q[11];
rz(pi/4) q[11];
cx q[12],q[11];
rz(-pi/4) q[11];
sx q[12];
rz(pi/2) q[12];
rz(-pi/16) q[9];
cx q[13],q[9];
rz(1*pi/32) q[9];
cx q[13],q[9];
cx q[13],q[10];
rz(pi/16) q[10];
cx q[13],q[10];
rz(-pi/16) q[10];
cx q[13],q[11];
rz(pi/8) q[11];
cx q[13],q[11];
rz(-pi/8) q[11];
cx q[13],q[12];
rz(pi/4) q[12];
cx q[13],q[12];
rz(-pi/4) q[12];
sx q[13];
rz(pi/2) q[13];
rz(-1*pi/32) q[9];
cx q[14],q[9];
rz(1*pi/64) q[9];
cx q[14],q[9];
cx q[14],q[10];
rz(1*pi/32) q[10];
cx q[14],q[10];
rz(-1*pi/32) q[10];
cx q[14],q[11];
rz(pi/16) q[11];
cx q[14],q[11];
rz(-pi/16) q[11];
cx q[14],q[12];
rz(pi/8) q[12];
cx q[14],q[12];
rz(-pi/8) q[12];
cx q[14],q[13];
rz(pi/4) q[13];
cx q[14],q[13];
rz(-pi/4) q[13];
sx q[14];
rz(pi/2) q[14];
rz(-1*pi/64) q[9];
cx q[15],q[9];
rz(1*pi/128) q[9];
cx q[15],q[9];
cx q[15],q[10];
rz(1*pi/64) q[10];
cx q[15],q[10];
rz(-1*pi/64) q[10];
cx q[15],q[11];
rz(1*pi/32) q[11];
cx q[15],q[11];
rz(-1*pi/32) q[11];
cx q[15],q[12];
rz(pi/16) q[12];
cx q[15],q[12];
rz(-pi/16) q[12];
cx q[15],q[13];
rz(pi/8) q[13];
cx q[15],q[13];
rz(-pi/8) q[13];
cx q[15],q[14];
rz(pi/4) q[14];
cx q[15],q[14];
rz(-pi/4) q[14];
sx q[15];
rz(pi/2) q[15];
rz(-1*pi/128) q[9];
cx q[16],q[9];
rz(1*pi/256) q[9];
cx q[16],q[9];
cx q[16],q[10];
rz(1*pi/128) q[10];
cx q[16],q[10];
rz(-1*pi/128) q[10];
cx q[16],q[11];
rz(1*pi/64) q[11];
cx q[16],q[11];
rz(-1*pi/64) q[11];
cx q[16],q[12];
rz(1*pi/32) q[12];
cx q[16],q[12];
rz(-1*pi/32) q[12];
cx q[16],q[13];
rz(pi/16) q[13];
cx q[16],q[13];
rz(-pi/16) q[13];
cx q[16],q[14];
rz(pi/8) q[14];
cx q[16],q[14];
rz(-pi/8) q[14];
cx q[16],q[15];
rz(pi/4) q[15];
cx q[16],q[15];
rz(-pi/4) q[15];
sx q[16];
rz(pi/2) q[16];
rz(-1*pi/256) q[9];
cx q[17],q[9];
rz(1*pi/512) q[9];
cx q[17],q[9];
cx q[17],q[10];
rz(1*pi/256) q[10];
cx q[17],q[10];
rz(-1*pi/256) q[10];
cx q[17],q[11];
rz(1*pi/128) q[11];
cx q[17],q[11];
rz(-1*pi/128) q[11];
cx q[17],q[12];
rz(1*pi/64) q[12];
cx q[17],q[12];
rz(-1*pi/64) q[12];
cx q[17],q[13];
rz(1*pi/32) q[13];
cx q[17],q[13];
rz(-1*pi/32) q[13];
cx q[17],q[14];
rz(pi/16) q[14];
cx q[17],q[14];
rz(-pi/16) q[14];
cx q[17],q[15];
rz(pi/8) q[15];
cx q[17],q[15];
rz(-pi/8) q[15];
cx q[17],q[16];
rz(pi/4) q[16];
cx q[17],q[16];
rz(-pi/4) q[16];
sx q[17];
rz(pi/2) q[17];
rz(-1*pi/512) q[9];
cx q[18],q[9];
rz(0.00306796157577128) q[9];
cx q[18],q[9];
cx q[18],q[10];
rz(1*pi/512) q[10];
cx q[18],q[10];
rz(-1*pi/512) q[10];
cx q[18],q[11];
rz(1*pi/256) q[11];
cx q[18],q[11];
rz(-1*pi/256) q[11];
cx q[18],q[12];
rz(1*pi/128) q[12];
cx q[18],q[12];
rz(-1*pi/128) q[12];
cx q[18],q[13];
rz(1*pi/64) q[13];
cx q[18],q[13];
rz(-1*pi/64) q[13];
cx q[18],q[14];
rz(1*pi/32) q[14];
cx q[18],q[14];
rz(-1*pi/32) q[14];
cx q[18],q[15];
rz(pi/16) q[15];
cx q[18],q[15];
rz(-pi/16) q[15];
cx q[18],q[16];
rz(pi/8) q[16];
cx q[18],q[16];
rz(-pi/8) q[16];
cx q[18],q[17];
rz(pi/4) q[17];
cx q[18],q[17];
rz(-pi/4) q[17];
sx q[18];
rz(pi/2) q[18];
rz(-0.00306796157577128) q[9];
cx q[19],q[9];
rz(0.00153398078788564) q[9];
cx q[19],q[9];
cx q[19],q[10];
rz(0.00306796157577128) q[10];
cx q[19],q[10];
rz(-0.00306796157577128) q[10];
cx q[19],q[11];
rz(1*pi/512) q[11];
cx q[19],q[11];
rz(-1*pi/512) q[11];
cx q[19],q[12];
rz(1*pi/256) q[12];
cx q[19],q[12];
rz(-1*pi/256) q[12];
cx q[19],q[13];
rz(1*pi/128) q[13];
cx q[19],q[13];
rz(-1*pi/128) q[13];
cx q[19],q[14];
rz(1*pi/64) q[14];
cx q[19],q[14];
rz(-1*pi/64) q[14];
cx q[19],q[15];
rz(1*pi/32) q[15];
cx q[19],q[15];
rz(-1*pi/32) q[15];
cx q[19],q[16];
rz(pi/16) q[16];
cx q[19],q[16];
rz(-pi/16) q[16];
cx q[19],q[17];
rz(pi/8) q[17];
cx q[19],q[17];
rz(-pi/8) q[17];
cx q[19],q[18];
rz(pi/4) q[18];
cx q[19],q[18];
rz(-pi/4) q[18];
sx q[19];
rz(pi/2) q[19];
rz(-0.00153398078788564) q[9];
cx q[20],q[9];
rz(0.00076699039394282) q[9];
cx q[20],q[9];
cx q[20],q[10];
rz(0.00153398078788564) q[10];
cx q[20],q[10];
rz(-0.00153398078788564) q[10];
cx q[20],q[11];
rz(0.00306796157577128) q[11];
cx q[20],q[11];
rz(-0.00306796157577128) q[11];
cx q[20],q[12];
rz(1*pi/512) q[12];
cx q[20],q[12];
rz(-1*pi/512) q[12];
cx q[20],q[13];
rz(1*pi/256) q[13];
cx q[20],q[13];
rz(-1*pi/256) q[13];
cx q[20],q[14];
rz(1*pi/128) q[14];
cx q[20],q[14];
rz(-1*pi/128) q[14];
cx q[20],q[15];
rz(1*pi/64) q[15];
cx q[20],q[15];
rz(-1*pi/64) q[15];
cx q[20],q[16];
rz(1*pi/32) q[16];
cx q[20],q[16];
rz(-1*pi/32) q[16];
cx q[20],q[17];
rz(pi/16) q[17];
cx q[20],q[17];
rz(-pi/16) q[17];
cx q[20],q[18];
rz(pi/8) q[18];
cx q[20],q[18];
rz(-pi/8) q[18];
cx q[20],q[19];
rz(pi/4) q[19];
cx q[20],q[19];
rz(-pi/4) q[19];
sx q[20];
rz(pi/2) q[20];
rz(-0.000766990393942821) q[9];
cx q[21],q[9];
rz(0.000383495196971411) q[9];
cx q[21],q[9];
cx q[21],q[10];
rz(0.00076699039394282) q[10];
cx q[21],q[10];
rz(-0.000766990393942821) q[10];
cx q[21],q[11];
rz(0.00153398078788564) q[11];
cx q[21],q[11];
rz(-0.00153398078788564) q[11];
cx q[21],q[12];
rz(0.00306796157577128) q[12];
cx q[21],q[12];
rz(-0.00306796157577128) q[12];
cx q[21],q[13];
rz(1*pi/512) q[13];
cx q[21],q[13];
rz(-1*pi/512) q[13];
cx q[21],q[14];
rz(1*pi/256) q[14];
cx q[21],q[14];
rz(-1*pi/256) q[14];
cx q[21],q[15];
rz(1*pi/128) q[15];
cx q[21],q[15];
rz(-1*pi/128) q[15];
cx q[21],q[16];
rz(1*pi/64) q[16];
cx q[21],q[16];
rz(-1*pi/64) q[16];
cx q[21],q[17];
rz(1*pi/32) q[17];
cx q[21],q[17];
rz(-1*pi/32) q[17];
cx q[21],q[18];
rz(pi/16) q[18];
cx q[21],q[18];
rz(-pi/16) q[18];
cx q[21],q[19];
rz(pi/8) q[19];
cx q[21],q[19];
rz(-pi/8) q[19];
cx q[21],q[20];
rz(pi/4) q[20];
cx q[21],q[20];
rz(-pi/4) q[20];
sx q[21];
rz(pi/2) q[21];
rz(-0.00038349519697141) q[9];
cx q[22],q[9];
rz(0.000191747598485705) q[9];
cx q[22],q[9];
cx q[22],q[10];
rz(0.000383495196971411) q[10];
cx q[22],q[10];
rz(-0.00038349519697141) q[10];
cx q[22],q[11];
rz(0.00076699039394282) q[11];
cx q[22],q[11];
rz(-0.000766990393942821) q[11];
cx q[22],q[12];
rz(0.00153398078788564) q[12];
cx q[22],q[12];
rz(-0.00153398078788564) q[12];
cx q[22],q[13];
rz(0.00306796157577128) q[13];
cx q[22],q[13];
rz(-0.00306796157577128) q[13];
cx q[22],q[14];
rz(1*pi/512) q[14];
cx q[22],q[14];
rz(-1*pi/512) q[14];
cx q[22],q[15];
rz(1*pi/256) q[15];
cx q[22],q[15];
rz(-1*pi/256) q[15];
cx q[22],q[16];
rz(1*pi/128) q[16];
cx q[22],q[16];
rz(-1*pi/128) q[16];
cx q[22],q[17];
rz(1*pi/64) q[17];
cx q[22],q[17];
rz(-1*pi/64) q[17];
cx q[22],q[18];
rz(1*pi/32) q[18];
cx q[22],q[18];
rz(-1*pi/32) q[18];
cx q[22],q[19];
rz(pi/16) q[19];
cx q[22],q[19];
rz(-pi/16) q[19];
cx q[22],q[20];
rz(pi/8) q[20];
cx q[22],q[20];
rz(-pi/8) q[20];
cx q[22],q[21];
rz(pi/4) q[21];
cx q[22],q[21];
rz(-pi/4) q[21];
sx q[22];
rz(pi/2) q[22];
rz(-0.000191747598485705) q[9];
cx q[23],q[9];
rz(9.58737992428525e-5) q[9];
cx q[23],q[9];
cx q[23],q[10];
rz(0.000191747598485705) q[10];
cx q[23],q[10];
rz(-0.000191747598485705) q[10];
cx q[23],q[11];
rz(0.000383495196971411) q[11];
cx q[23],q[11];
rz(-0.00038349519697141) q[11];
cx q[23],q[12];
rz(0.00076699039394282) q[12];
cx q[23],q[12];
rz(-0.000766990393942821) q[12];
cx q[23],q[13];
rz(0.00153398078788564) q[13];
cx q[23],q[13];
rz(-0.00153398078788564) q[13];
cx q[23],q[14];
rz(0.00306796157577128) q[14];
cx q[23],q[14];
rz(-0.00306796157577128) q[14];
cx q[23],q[15];
rz(1*pi/512) q[15];
cx q[23],q[15];
rz(-1*pi/512) q[15];
cx q[23],q[16];
rz(1*pi/256) q[16];
cx q[23],q[16];
rz(-1*pi/256) q[16];
cx q[23],q[17];
rz(1*pi/128) q[17];
cx q[23],q[17];
rz(-1*pi/128) q[17];
cx q[23],q[18];
rz(1*pi/64) q[18];
cx q[23],q[18];
rz(-1*pi/64) q[18];
cx q[23],q[19];
rz(1*pi/32) q[19];
cx q[23],q[19];
rz(-1*pi/32) q[19];
cx q[23],q[20];
rz(pi/16) q[20];
cx q[23],q[20];
rz(-pi/16) q[20];
cx q[23],q[21];
rz(pi/8) q[21];
cx q[23],q[21];
rz(-pi/8) q[21];
cx q[23],q[22];
rz(pi/4) q[22];
cx q[23],q[22];
rz(-pi/4) q[22];
sx q[23];
rz(pi/2) q[23];
rz(-9.58737992428526e-5) q[9];
cx q[24],q[9];
rz(4.79368996214263e-5) q[9];
cx q[24],q[9];
cx q[24],q[10];
rz(9.58737992428525e-5) q[10];
cx q[24],q[10];
rz(-9.58737992428526e-5) q[10];
cx q[24],q[11];
rz(0.000191747598485705) q[11];
cx q[24],q[11];
rz(-0.000191747598485705) q[11];
cx q[24],q[12];
rz(0.000383495196971411) q[12];
cx q[24],q[12];
rz(-0.00038349519697141) q[12];
cx q[24],q[13];
rz(0.00076699039394282) q[13];
cx q[24],q[13];
rz(-0.000766990393942821) q[13];
cx q[24],q[14];
rz(0.00153398078788564) q[14];
cx q[24],q[14];
rz(-0.00153398078788564) q[14];
cx q[24],q[15];
rz(0.00306796157577128) q[15];
cx q[24],q[15];
rz(-0.00306796157577128) q[15];
cx q[24],q[16];
rz(1*pi/512) q[16];
cx q[24],q[16];
rz(-1*pi/512) q[16];
cx q[24],q[17];
rz(1*pi/256) q[17];
cx q[24],q[17];
rz(-1*pi/256) q[17];
cx q[24],q[18];
rz(1*pi/128) q[18];
cx q[24],q[18];
rz(-1*pi/128) q[18];
cx q[24],q[19];
rz(1*pi/64) q[19];
cx q[24],q[19];
rz(-1*pi/64) q[19];
cx q[24],q[20];
rz(1*pi/32) q[20];
cx q[24],q[20];
rz(-1*pi/32) q[20];
cx q[24],q[21];
rz(pi/16) q[21];
cx q[24],q[21];
rz(-pi/16) q[21];
cx q[24],q[22];
rz(pi/8) q[22];
cx q[24],q[22];
rz(-pi/8) q[22];
cx q[24],q[23];
rz(pi/4) q[23];
cx q[24],q[23];
rz(-pi/4) q[23];
sx q[24];
rz(pi/2) q[24];
rz(-4.79368996214263e-5) q[9];
cx q[25],q[9];
rz(2.39684498107132e-5) q[9];
cx q[25],q[9];
cx q[25],q[10];
rz(4.79368996214263e-5) q[10];
cx q[25],q[10];
rz(-4.79368996214263e-5) q[10];
cx q[25],q[11];
rz(9.58737992428525e-5) q[11];
cx q[25],q[11];
rz(-9.58737992428526e-5) q[11];
cx q[25],q[12];
rz(0.000191747598485705) q[12];
cx q[25],q[12];
rz(-0.000191747598485705) q[12];
cx q[25],q[13];
rz(0.000383495196971411) q[13];
cx q[25],q[13];
rz(-0.00038349519697141) q[13];
cx q[25],q[14];
rz(0.00076699039394282) q[14];
cx q[25],q[14];
rz(-0.000766990393942821) q[14];
cx q[25],q[15];
rz(0.00153398078788564) q[15];
cx q[25],q[15];
rz(-0.00153398078788564) q[15];
cx q[25],q[16];
rz(0.00306796157577128) q[16];
cx q[25],q[16];
rz(-0.00306796157577128) q[16];
cx q[25],q[17];
rz(1*pi/512) q[17];
cx q[25],q[17];
rz(-1*pi/512) q[17];
cx q[25],q[18];
rz(1*pi/256) q[18];
cx q[25],q[18];
rz(-1*pi/256) q[18];
cx q[25],q[19];
rz(1*pi/128) q[19];
cx q[25],q[19];
rz(-1*pi/128) q[19];
cx q[25],q[20];
rz(1*pi/64) q[20];
cx q[25],q[20];
rz(-1*pi/64) q[20];
cx q[25],q[21];
rz(1*pi/32) q[21];
cx q[25],q[21];
rz(-1*pi/32) q[21];
cx q[25],q[22];
rz(pi/16) q[22];
cx q[25],q[22];
rz(-pi/16) q[22];
cx q[25],q[23];
rz(pi/8) q[23];
cx q[25],q[23];
rz(-pi/8) q[23];
cx q[25],q[24];
rz(pi/4) q[24];
cx q[25],q[24];
rz(-pi/4) q[24];
sx q[25];
rz(pi/2) q[25];
rz(-2.39684498107131e-5) q[9];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
measure q[3] -> c[3];
measure q[4] -> c[4];
measure q[5] -> c[5];
measure q[6] -> c[6];
measure q[7] -> c[7];
measure q[8] -> c[8];
measure q[9] -> c[9];
measure q[10] -> c[10];
measure q[11] -> c[11];
measure q[12] -> c[12];
measure q[13] -> c[13];
measure q[14] -> c[14];
measure q[15] -> c[15];
measure q[16] -> c[16];
measure q[17] -> c[17];
measure q[18] -> c[18];
measure q[19] -> c[19];
measure q[20] -> c[20];
measure q[21] -> c[21];
measure q[22] -> c[22];
measure q[23] -> c[23];
measure q[24] -> c[24];
measure q[25] -> c[25];
