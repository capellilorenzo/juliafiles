using HomotopyContinuation
using JLD2
using Plots
using LaTeXStrings
@var x1 y1 x2 y2 x3 y3 x4 y4 x5 y5 u1 u2 u3 u4 u5

#IMPOSTAZIONE DEI PARAMETRI

s1=[0.03,0,0.03,0,0.4,1,
  2.56,-2.16,3.19,-20,-15,75,
  2.56,2.16,3.19,20,-15,75,
  22.96,-19.44,17.29,-186,-248,2100,
  22.96,19.44,17.29,186,-248,2100];

#=s1=[10124547/662488724,8554609/755781377,5860508/2798943247,-251402893/1016797750,-25443962/277938473,1,
  520811/1788018449,2183697/542440933,9030222/652429049,-12680955/370629407,-24872323/105706890,1,
  6537193/241535591,-7424602/363844915,6264373/1630169777,13097677/39806827,-29825861/240478169,1,
  13173269/2284890206,4510030/483147459,2224435/588965799,33318719/219393000,92891037/755709662,1,
  8275097/452566634,-19174153/408565940,5184916/172253855,-23713234/87670601,28246737/81404569,1];=#

#CARICAMENTO DELLE SOLUZIONI SALVATE

d=load("D:/Cartelle Desktop/Università/Magistrale/Seminario/3264.jld2");
s0=d["s0"];
soluzioni=d["soluzioni"];

#EQUAZIONI DELLE 5 CONICHE DI G

g1 = s0[1]*x1^2+s0[2]*x1*y1+s0[3]*y1^2+s0[4]*x1+s0[5]*y1+s0[6];
g2 = s0[7]*x2^2+s0[8]*x2*y2+s0[9]*y2^2+s0[10]*x2+s0[11]*y2+s0[12];
g3 = s0[13]*x3^2+s0[14]*x3*y3+s0[15]*y3^2+s0[16]*x3+s0[17]*y3+s0[18];
g4 = s0[19]*x4^2+s0[20]*x4*y4+s0[21]*y4^2+s0[22]*x4+s0[23]*y4+s0[24];
g5 = s0[25]*x5^2+s0[26]*x5*y5+s0[27]*y5^2+s0[28]*x5+s0[29]*y5+s0[30];

#EQUAZIONI DELLA CONICA SOLUZIONE DI G

g6 = u1*x1^2+u2*x1*y1+u3*y1^2+u4*x1+u5*y1+1;
g7 = u1*x2^2+u2*x2*y2+u3*y2^2+u4*x2+u5*y2+1;
g8 = u1*x3^2+u2*x3*y3+u3*y3^2+u4*x3+u5*y3+1;
g9 = u1*x4^2+u2*x4*y4+u3*y4^2+u4*x4+u5*y4+1;
g10 = u1*x5^2+u2*x5*y5+u3*y5^2+u4*x5+u5*y5+1;

#EQUAZIONI SULLA TANGENZA DI G

g11 = (2*s0[1]*u2-2*s0[2]*u1)*x1^2+(4*s0[1]*u3-4*s0[3]*u1)*x1*y1+(2*s0[2]*u3-2*s0[3]*u2)*y1^2+(2*s0[1]*u5+s0[4]*u2-s0[2]*u4-2*s0[5]*u1)*x1+(s0[2]*u5+2*s0[4]*u3-2*s0[3]*u4-s0[5]*u2)*y1+(s0[4]*u5-s0[5]*u4);
g12 = (2*s0[7]*u2-2*s0[8]*u1)*x2^2+(4*s0[7]*u3-4*s0[9]*u1)*x2*y2+(2*s0[8]*u3-2*s0[9]*u2)*y2^2+(2*s0[7]*u5+s0[10]*u2-s0[8]*u4-2*s0[11]*u1)*x2+(s0[8]*u5+2*s0[10]*u3-2*s0[9]*u4-s0[11]*u2)*y2+(s0[10]*u5-s0[11]*u4);
g13 = (2*s0[13]*u2-2*s0[14]*u1)*x3^2+(4*s0[13]*u3-4*s0[15]*u1)*x3*y3+(2*s0[14]*u3-2*s0[15]*u2)*y3^2+(2*s0[13]*u5+s0[16]*u2-s0[14]*u4-2*s0[17]*u1)*x3+(s0[14]*u5+2*s0[16]*u3-2*s0[15]*u4-s0[17]*u2)*y3+(s0[16]*u5-s0[17]*u4);
g14 = (2*s0[19]*u2-2*s0[20]*u1)*x4^2+(4*s0[19]*u3-4*s0[21]*u1)*x4*y4+(2*s0[20]*u3-2*s0[21]*u2)*y4^2+(2*s0[19]*u5+s0[22]*u2-s0[20]*u4-2*s0[23]*u1)*x4+(s0[20]*u5+2*s0[22]*u3-2*s0[21]*u4-s0[23]*u2)*y4+(s0[22]*u5-s0[23]*u4);
g15 = (2*s0[25]*u2-2*s0[26]*u1)*x5^2+(4*s0[25]*u3-4*s0[27]*u1)*x5*y5+(2*s0[26]*u3-2*s0[27]*u2)*y5^2+(2*s0[25]*u5+s0[28]*u2-s0[26]*u4-2*s0[29]*u1)*x5+(s0[26]*u5+2*s0[28]*u3-2*s0[27]*u4-s0[29]*u2)*y5+(s0[28]*u5-s0[29]*u4);

#EQUAZIONI DELLE CONICHE DI F

f1 = s1[1]*x1^2+s1[2]*x1*y1+s1[3]*y1^2+s1[4]*x1+s1[5]*y1+s1[6];
f2 = s1[7]*x2^2+s1[8]*x2*y2+s1[9]*y2^2+s1[10]*x2+s1[11]*y2+s1[12];
f3 = s1[13]*x3^2+s1[14]*x3*y3+s1[15]*y3^2+s1[16]*x3+s1[17]*y3+s1[18];
f4 = s1[19]*x4^2+s1[20]*x4*y4+s1[21]*y4^2+s1[22]*x4+s1[23]*y4+s1[24];
f5 = s1[25]*x5^2+s1[26]*x5*y5+s1[27]*y5^2+s1[28]*x5+s1[29]*y5+s1[30];

#EQUAZIONI DELLA CONICA SOLUZIONE DI F

f6 = u1*x1^2+u2*x1*y1+u3*y1^2+u4*x1+u5*y1+1;
f7 = u1*x2^2+u2*x2*y2+u3*y2^2+u4*x2+u5*y2+1;
f8 = u1*x3^2+u2*x3*y3+u3*y3^2+u4*x3+u5*y3+1;
f9 = u1*x4^2+u2*x4*y4+u3*y4^2+u4*x4+u5*y4+1;
f10 = u1*x5^2+u2*x5*y5+u3*y5^2+u4*x5+u5*y5+1;

#EQUAZIONI SULLA TANGENZA DI F

f11 = (2*s1[1]*u2-2*s1[2]*u1)*x1^2+(4*s1[1]*u3-4*s1[3]*u1)*x1*y1+(2*s1[2]*u3-2*s1[3]*u2)*y1^2+(2*s1[1]*u5+s1[4]*u2-s1[2]*u4-2*s1[5]*u1)*x1+(s1[2]*u5+2*s1[4]*u3-2*s1[3]*u4-s1[5]*u2)*y1+(s1[4]*u5-s1[5]*u4);
f12 = (2*s1[7]*u2-2*s1[8]*u1)*x2^2+(4*s1[7]*u3-4*s1[9]*u1)*x2*y2+(2*s1[8]*u3-2*s1[9]*u2)*y2^2+(2*s1[7]*u5+s1[10]*u2-s1[8]*u4-2*s1[11]*u1)*x2+(s1[8]*u5+2*s1[10]*u3-2*s1[9]*u4-s1[11]*u2)*y2+(s1[10]*u5-s1[11]*u4);
f13 = (2*s1[13]*u2-2*s1[14]*u1)*x3^2+(4*s1[13]*u3-4*s1[15]*u1)*x3*y3+(2*s1[14]*u3-2*s1[15]*u2)*y3^2+(2*s1[13]*u5+s1[16]*u2-s1[14]*u4-2*s1[17]*u1)*x3+(s1[14]*u5+2*s1[16]*u3-2*s1[15]*u4-s1[17]*u2)*y3+(s1[16]*u5-s1[17]*u4);
f14 = (2*s1[19]*u2-2*s1[20]*u1)*x4^2+(4*s1[19]*u3-4*s1[21]*u1)*x4*y4+(2*s1[20]*u3-2*s1[21]*u2)*y4^2+(2*s1[19]*u5+s1[22]*u2-s1[20]*u4-2*s1[23]*u1)*x4+(s1[20]*u5+2*s1[22]*u3-2*s1[21]*u4-s1[23]*u2)*y4+(s1[22]*u5-s1[23]*u4);
f15 = (2*s1[25]*u2-2*s1[26]*u1)*x5^2+(4*s1[25]*u3-4*s1[27]*u1)*x5*y5+(2*s1[26]*u3-2*s1[27]*u2)*y5^2+(2*s1[25]*u5+s1[28]*u2-s1[26]*u4-2*s1[29]*u1)*x5+(s1[26]*u5+2*s1[28]*u3-2*s1[27]*u4-s1[29]*u2)*y5+(s1[28]*u5-s1[29]*u4);

#CREAZIONE DEI DUE SISTEMI

F=System([f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14,f15], variables = [x1,y1,x2,y2,x3,y3,x4,y4,x5,y5,u1,u2,u3,u4,u5]);
G=System([g1,g2,g3,g4,g5,g6,g7,g8,g9,g10,g11,g12,g13,g14,g15], variables = [x1,y1,x2,y2,x3,y3,x4,y4,x5,y5,u1,u2,u3,u4,u5]);

#SOLUZIONE DEL SISTEMA USANDO UN'OMOTOPIA TRA F E G

result=solve(G,F,soluzioni);

#IDENTIFICAZIONE DEL NUMERO DI IPERBOLI, ELLISSI E PARABOLE

soluzionireali=solutions(result; only_nonsingular = true, only_real = true);
global nellissi=0;
global nparabole=0;
global niperboli=0;
for i=1:length(soluzionireali)
  delta=soluzionireali[i][12].re^2-4*soluzionireali[i][11].re*soluzionireali[i][13].re
  if delta>0
    global niperboli=niperboli+1;
  elseif delta<0
    global nellissi=nellissi+1;
  else
    global nparabole=nparabole+1;
  end
end
println("DELLE 3264 SOLUZIONI, ", length(soluzionireali), " SONO REALI.");
println("DI CUI: ", nellissi, " ELLISSI, ", nparabole, " PARABOLE E ", niperboli, " IPERBOLI.");

#GRAFICO DELLE SOLUZIONI REALI

global ax=-20;
global bx=20;
global ay=-20;
global by=20;

@var x y
c1(x,y)=s1[1]*x^2+s1[2]*x*y+s1[3]*y^2+s1[4]*x+s1[5]*y+s1[6];
c2(x,y)=s1[7]*x^2+s1[8]*x*y+s1[9]*y^2+s1[10]*x+s1[11]*y+s1[12];
c3(x,y)=s1[13]*x^2+s1[14]*x*y+s1[15]*y^2+s1[16]*x+s1[17]*y+s1[18];
c4(x,y)=s1[19]*x^2+s1[20]*x*y+s1[21]*y^2+s1[22]*x+s1[23]*y+s1[24];
c5(x,y)=s1[25]*x^2+s1[26]*x*y+s1[27]*y^2+s1[28]*x+s1[29]*y+s1[30];
for n=1:length(soluzionireali)
  p=Plots.contour(ax:0.1:bx,ay:0.1:by,c1, levels=[0], color = "blue", legend = :none, aspect_ratio=:equal )
  Plots.contour!(ax:0.1:bx,ay:0.1:by,c2, levels=[0], color = "blue", legend = :none)
  Plots.contour!(ax:0.1:bx,ay:0.1:by,c3, levels=[0], color = "blue", legend = :none)
  Plots.contour!(ax:0.1:bx,ay:0.1:by,c4, levels=[0], color = "blue", legend = :none)
  Plots.contour!(ax:0.1:bx,ay:0.1:by,c5, levels=[0], color = "blue", legend = :none)
  if soluzionireali[n][1].re>=ax && soluzionireali[n][1].re<=bx && soluzionireali[n][2].re>=ay && soluzionireali[n][2].re<=by
    Plots.scatter!([soluzionireali[n][1].re],[soluzionireali[n][2].re], label="", color="black")
  end
  if soluzionireali[n][3].re>=ax && soluzionireali[n][3].re<=bx && soluzionireali[n][4].re>=ay && soluzionireali[n][4].re<=by
    Plots.scatter!([soluzionireali[n][3].re],[soluzionireali[n][4].re], label="", color="black")
  end
  if soluzionireali[n][5].re>=ax && soluzionireali[n][5].re<=bx && soluzionireali[n][6].re>=ay && soluzionireali[n][6].re<=by
    Plots.scatter!([soluzionireali[n][5].re],[soluzionireali[n][6].re], label="", color="black")
  end
  if soluzionireali[n][7].re>=ax && soluzionireali[n][7].re<=bx && soluzionireali[n][8].re>=ay && soluzionireali[n][8].re<=by
    Plots.scatter!([soluzionireali[n][7].re],[soluzionireali[n][8].re], label="", color="black")
  end
  if soluzionireali[n][9].re>=ax && soluzionireali[n][9].re<=bx && soluzionireali[n][10].re>=ay && soluzionireali[n][10].re<=by
    Plots.scatter!([soluzionireali[n][9].re],[soluzionireali[n][10].re], label="", color="black")
  end
  s_p(x,y)=soluzionireali[n][11].re*x^2+soluzionireali[n][12].re*x*y+soluzionireali[n][13].re*y^2+soluzionireali[n][14].re*x+soluzionireali[n][15].re*y+1;
  Plots.contour!(ax:0.1:bx, ay:0.1:by, s_p, levels=[0], color ="red", legend = :none);
  s_t=string(round(soluzionireali[n][11].re,digits=3))*"x^2";
  if(soluzionireali[n][12].re>=0)
    s_t=s_t*"+";
  end
  s_t=s_t*string(round(soluzionireali[n][12].re,digits=3))*"xy";
  if(soluzionireali[n][13].re>=0)
    s_t=s_t*"+";
  end
  s_t=s_t*string(round(soluzionireali[n][13].re,digits=3))*"y^2";
  if(soluzionireali[n][14].re>=0)
    s_t=s_t*"+";
  end
  s_t=s_t*string(round(soluzionireali[n][14].re,digits=3))*"x";
  if(soluzionireali[n][15].re>=0)
    s_t=s_t*"+";
  end
  s_t=s_t*string(round(soluzionireali[n][15].re,digits=3))*"y";
  annotate!(0, -by+1, text(L"%$s_t +1 = 0", :black, :center, 12))
  display(p)
end