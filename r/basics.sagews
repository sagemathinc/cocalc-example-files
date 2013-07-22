︠f09e8dd2-8098-4a54-8ff3-54f8c8744aa6i︠
%md
R Basics
--------

Just a demo, how R can be called from Sage to do something useful.
︡7f0d7814-e2dd-4b6b-ab19-7baa8569332b︡{"html":"<h2>R Basics</h2>\n\n<p>Just a demo, how R can be called from Sage to do something useful.</p>\n"}︡
︠9bc1495a-b023-418a-a05f-f6fbdc30ee2b︠
print r
︡edd9f56c-2c8a-41df-8710-30ca4967bfd9︡{"stdout":"R Interpreter\n"}︡
︠d7e14cf3-59c9-49cf-98a9-9fa562b5028f︠
x = r.c((1,2,3,-1, 2,2.2))
print x
type(x)
print x.summary()
︡b423b35e-4b6c-4514-9f2e-b3374d60b0eb︡{"stdout":"[1]  1.0  2.0  3.0 -1.0  2.0  2.2\n"}︡{"stdout":"<class 'sage.interfaces.r.RElement'>\n"}︡{"stdout":"   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. \n -1.000   1.250   2.000   1.533   2.150   3.000 \n"}︡
︠d5ce0640-6ddf-4026-99fe-c5890fa99f80︠
%r
x <- c(1,4,3,4,3,2,3,2,3,6,3)
summary(x)
︡b98d8297-7ff3-441a-890e-299d991e4cf3︡{"stdout":"\n   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. \n  1.000   2.500   3.000   3.091   3.500   6.000 \n"}︡
︠635e9bd6-4ea8-43ac-a439-cb25d76a1f08︠
%r
x[1]
x[2]
︡49838ebb-4a33-4e55-a814-eaa6dd86e70f︡{"stdout":"[1] 1\n[1] 4\n"}︡
︠9c10d845-42a6-4165-9e30-2cf1f7100609︠
%r
z <- sample(-5:5, 30, replace=T)
z
summary(z)
︡7030302f-22e4-42c6-bb65-9c42ae3605f9︡{"stdout":"\n [1]  2  1  3  0  4  3 -4  2  4  2  5  1 -3  0  2 -1  0 -3  4 -2  1  5  2  1  4  5 -2 -2 -3  2\n   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. \n  -4.00   -0.75    1.50    1.10    3.00    5.00 \n"}︡
︠bbc2bcdd-1b14-44e0-b943-0f4540cefdd3︠
z2 = r.sample(range(-5,5), 10, replace=False)
z2
︡32328cd9-9022-4887-a6fa-808588a3ed09︡{"stdout":" [1]  1  3 -2 -3  2 -4  0  4 -5 -1\n"}︡
︠1780e941-3433-40db-97a4-9d48d3fe3616︠
%r
plot(-5:5, sample(-5:5, 11, replace=F))
︡15e21cd7-3203-4602-b4a0-966b61989a6a︡{"stdout":"Error in X11(paste(\"png::\", filename, sep = \"\"), g$width, g$height, pointsize,  : \n  unable to start device PNG\nIn addition: Warning message:\nIn png() : unable to open connection to X11 display ''\n"}︡
︠0b590cf1-31dc-449a-b987-d5d915f02899i︠
%md
Linear Regression
-----------------
︡612ce6f7-d3f4-4081-936d-c2da7e4c0dcd︡{"html":"<h2>Linear Regression</h2>\n"}︡
︠62845916-965e-40d0-b5e7-81d1a0d6a353︠
%r
X <- sort(runif(100, -5,5))
Y <- -2 + 1.1 * X + rnorm(100, 0, 5)
lmobj <- lm(Y ~ X)
summary(lmobj)
︡a89c9d32-4fe7-4823-a7f3-1707b67dd9c2︡{"stdout":"\n\n\n\nCall:\nlm(formula = Y ~ X)\n\nResiduals:\n     Min       1Q   Median       3Q      Max \n-17.0795  -3.9465   0.1472   3.4433  15.4053 \n\nCoefficients:\n            Estimate Std. Error t value Pr(>|t|)    \n(Intercept)  -1.9661     0.5837  -3.369  0.00108 ** \nX             0.9109     0.1950   4.670 9.56e-06 ***\n---\nSignif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1 \n\nResidual standard error: 5.798 on 98 degrees of freedom\nMultiple R-squared: 0.1821,\tAdjusted R-squared: 0.1737 \nF-statistic: 21.81 on 1 and 98 DF,  p-value: 9.565e-06 \n\n"}︡
︠6572ca5a-3897-4b71-8162-e9faf1d407bd︠









