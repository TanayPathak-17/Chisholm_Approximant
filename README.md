# Chisholm Approximant
A Mathematica package to find a diagonal approximant of a bivariate series, called the Chisholm approximant. The work is based on the following work

[ChisholmD.wl- Automated rational approximant for bi-variate series](https://arxiv.org/abs/2309.07687).

**Installation**

To install the package one can copy and paste the package at the desired ***location***. After that one can set the path for the directory as follows 
```
SetDirectory[Path of the location]
```
After setting the path, The ***ChisholmD.wl*** package can be called using the following command
```
<<ChisholmD.wl
```

The package has one command: ***ChisholmD***. The description of the same can be found using the following command
```
?ChisholmD
```
The syntax of the command is as follows:
```
ChrislholmD[Series,{x0,y0,order},{x,y}]
```

**Example**

As an example, consider that we have stored the series of ```Exp[x+y]``` in a variable ```Expseries```, then we can find its first order Chisholm approximant around point ```(0,0)``` as follows:
```
ChisholmD[Expseries,{0,0,1},{x,y}]
```
A detailed demonstration of the package and various applications are presented in the paper.

The repository also contains various notebooks of the examples and applications.
