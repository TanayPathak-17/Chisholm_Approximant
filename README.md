# Chrisholm_Approximant
A Mathematica package to find diagonal approximants of bivariate series which are called the Chrisholm approximants.

**Installation**

After setting the path, The ***ChisholmD.wl*** package can be called using the following command
```
<<ChisholmD.wl
```
The package one command : *ChisholmD*. The description of the same can be found using the following command
```
?ChisholmD
```

**Example file**
If we store the series of Exp[x+y] in a variable ```Expseries``` then we can find its first order Chisholm approximant as follows:
```
ChisholmD[Expseries,{0,0,1},{x,y}]
```

