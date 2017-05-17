︠f09e8dd2-8098-4a54-8ff3-54f8c8744aa6i︠
%md
R Basics
--------

Just a demo, how R can be called from Sage to do something useful.
︡f6cdcb20-ffe0-42b4-b77e-4f6f46e1be55︡{"html":"<h2>R Basics</h2>\n\n<p>Just a demo, how R can be called from Sage to do something useful.</p>\n"}︡
︠9bc1495a-b023-418a-a05f-f6fbdc30ee2bs︠
%r
x <- c(1,4,3,4,3,2,3,2,3,6,3)
summary(x)
︡969e5af9-39b2-44c0-b595-1c340d6494c7︡{"stdout":"   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. \n  1.000   2.500   3.000   3.091   3.500   6.000 "}︡{"done":true}︡
︠635e9bd6-4ea8-43ac-a439-cb25d76a1f08s︠
%r
x[1]
x[2]
︡3da7356b-784e-46b3-951d-952ab0d994b6︡{"html":"1"}︡{"html":"4"}︡{"done":true}︡
︠9c10d845-42a6-4165-9e30-2cf1f7100609s︠
%r
z <- sample(-5:5, 30, replace=T)
z
summary(z)
︡3534bc0c-b9b9-471b-b117-2e6253aec8bf︡{"html":"<ol class=list-inline>\n\t<li>2</li>\n\t<li>0</li>\n\t<li>-5</li>\n\t<li>2</li>\n\t<li>-2</li>\n\t<li>1</li>\n\t<li>2</li>\n\t<li>1</li>\n\t<li>-2</li>\n\t<li>0</li>\n\t<li>1</li>\n\t<li>-5</li>\n\t<li>4</li>\n\t<li>0</li>\n\t<li>-5</li>\n\t<li>4</li>\n\t<li>0</li>\n\t<li>-2</li>\n\t<li>-3</li>\n\t<li>2</li>\n\t<li>0</li>\n\t<li>-3</li>\n\t<li>3</li>\n\t<li>-4</li>\n\t<li>0</li>\n\t<li>2</li>\n\t<li>-5</li>\n\t<li>3</li>\n\t<li>1</li>\n\t<li>0</li>\n</ol>\n"}︡{"stdout":"   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. \n-5.0000 -2.0000  0.0000 -0.2667  2.0000  4.0000 "}︡{"done":true}︡
︠bbc2bcdd-1b14-44e0-b943-0f4540cefdd3s︠
%r
plot(-5:5, sample(-5:5, 11, replace=F))
︡905a81f2-6099-420c-8779-eb10ae37f786︡{"file":{"filename":"/tmp/tmpFBELEn.png","show":false,"text":null,"uuid":"498577d4-27e6-4248-99ec-f1da43ee49ad"},"once":false}︡{"html":"<img src=\"/blobs//tmp/tmpFBELEn.png?uuid=498577d4-27e6-4248-99ec-f1da43ee49ad\" smc-image-scaling=\"0.5\" />"}︡{"done":true}︡
︠0b590cf1-31dc-449a-b987-d5d915f02899i︠
%md
Linear Regression
-----------------
︡28be9462-47df-404a-88cd-d47d79572c00︡{"html":"<h2>Linear Regression</h2>\n"}︡
︠62845916-965e-40d0-b5e7-81d1a0d6a353s︠
%r
X <- sort(runif(100, -5,5))
Y <- -2 + 1.1 * X + rnorm(100, 0, 5)
lmobj <- lm(Y ~ X)
summary(lmobj)
︡602a8ff7-7075-4358-820c-7b447709af5a︡{"stdout":"\nCall:\nlm(formula = Y ~ X)\n\nResiduals:\n     Min       1Q   Median       3Q      Max \n-10.8981  -2.7457   0.1564   2.8784  11.6248 \n\nCoefficients:\n            Estimate Std. Error t value Pr(>|t|)    \n(Intercept)  -1.6343     0.4371  -3.739 0.000311 ***\nX             0.8292     0.1447   5.730 1.11e-07 ***\n---\nSignif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1\n\nResidual standard error: 4.355 on 98 degrees of freedom\nMultiple R-squared:  0.2509,\tAdjusted R-squared:  0.2433 \nF-statistic: 32.83 on 1 and 98 DF,  p-value: 1.11e-07\n"}︡{"done":true}︡
︠6572ca5a-3897-4b71-8162-e9faf1d407bd︠










