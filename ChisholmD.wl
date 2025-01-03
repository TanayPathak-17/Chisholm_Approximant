(* ::Package:: *)

BeginPackage["ChisholmD`"]


Print["ChisholmD.wl 1.0\n","Authors : Souvik Bera & Tanay Pathak"];


ChisholmD::usage="The command gives the Chisholm approximant in two-variables.
 ChisholmD[series,{a,b,order},{variable 1, variable 2]";



Begin["`Private`"]


sortF[lst_]:=SortBy[lst,{Max@#,Total@#}&[Exponent[#,Variables[lst]]]&]


ChisholmD[series_,{X_,Y_,order_},{var1_,var2_}]:= Module[{s0,o0,dseries,nseries,x0,y0,listcoeff1,listcoeff2,coefflist,eqns1,eqns2,conlist,valconst,approx,i,j,
eqnstotal,a,b,c,s,lhs,coefflist2,eqnp,X0,Y0,seriesm},
X0=X;Y0=Y;
o0= order;x0=var1;y0=var2;
(*s= Expand[Normal[Series[series,{x0,X0,2o0},{y0,Y0,2o0}]]/.{x0-> x0+X0, y0-> y0+Y0}];*)
s=Expand[Total[Normal[Map[Series[#,{x0,X0,2o0},{y0,Y0,2o0}]&,(List@@(series))]]]/.{x0-> x0+X0, y0-> y0+Y0}];
(*Print[s];*)
s0=s/(s/.{x0->0,y0->0});
(*Print[s0];*)
coefflist=MonomialList[Total[Complement[Flatten[Table[x0^i y0^j Boole[i+j<= 2 o0+1],{i,0,2 o0},{j,0,2 o0}]],{1,0}]],"NegativeDegreeLexicographic"];
coefflist2=Flatten[Partition[sortF[Complement[Flatten[Table[x0^i y0^j Boole[i+j== 2 o0+1],{i,0,2 o0},{j,0,2 o0}]],{1,0}]],2],1];
Array[a,{o0,o0}];
Array[b,{o0,o0}];
Array[c,{o0,o0}];
a[0,0]=1;b[0,0]=1;eqns2={};
conlist=Complement[Flatten[Table[{a[i,j],b[i,j]}Boole[i+j=!=0],{i,0,o0},{j,0,o0}]],{0}];
nseries=Sum[a[i,j](-1)^i x0^i y0^j,{i,0,o0},{j,0,o0}];
dseries=Sum[b[i,j](-1)^j x0^i y0^j,{i,0,o0},{j,0,o0}];
lhs= Expand[dseries s0];
(*Print[lhs];*)
listcoeff1= DeleteCases[MonomialList[(lhs/.{x0^i_. y0^j_.-> If[i+j==2o0+1 ||i+j>2o0+1,0,x0^i y0^j]}/.{x0^i_.-> If[i==2o0+1||i>2o0+1,0,x0^i]}/.{y0^i_-> If[i==2o0+1||i>2o0+1,0,y0^i]}),{x0,y0}
,"NegativeDegreeLexicographic"]/.{x0->1,y0->1},1];
listcoeff2= Coefficient[Expand[nseries],coefflist]/.{x0->0,y0->0};
eqns1= Table[listcoeff1[[i]]==listcoeff2[[i]],{i,1,Length[listcoeff1]}];
(*Print[eqns2= (Total[#]==0)&/@Partition[(Coefficient[lhs,#])&/@coefflist2,2]//AbsoluteTiming];*)
eqns2= ((Total[#]/.{x0->1,y0->1})==0)&/@Partition[sortF[MonomialList[Total[DeleteCases[Complement[List@@(lhs),List@@(lhs/.{x0^i_. y0^j_.-> If[i+j==2o0+1,0,x0^i y0^j]}/.{x0^i_.-> If[i==2o0+1||i>2o0+1,0,x0^i]}/.{y0^i_-> If[i==2o0+1||i>2o0+1,0,y0^i]})]
/.{x0^i_. y0^j_.-> If[i+j==2o0+1,x0^i y0^j,0]}/.{x0^i_.-> If[i==2o0+1||i>2o0+1,0,x0^i]}/.{y0^i_-> If[i==2o0+1||i>2o0+1,0,y0^i]},0]],{x0,y0},"Lexicographic"]],2];
(*Print[Flatten[eqns1]//TableForm];*)
(*Print[coefflist];*)
eqnstotal= Join[eqns1,Flatten[eqns2]];
valconst=Flatten[Solve[eqnstotal,conlist]];
approx=(s/.{x0->0,y0->0}) (nseries/.valconst)/(dseries/.valconst)/.{x0-> x0-X0, y0-> y0-Y0};
(*Print[listcoeff1//Length];
Print[listcoeff2//Length];*)
(*Print[eqns1//TableForm];*)
(*Print[eqnstotal//TableForm];*)
(*Print[valconst];
Print[nseries];*)
Return[approx];
]


End[]


EndPackage[]
