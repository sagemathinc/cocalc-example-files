︠f09e8dd2-8098-4a54-8ff3-54f8c8744aa6i︠
%md
R Basics
--------

Just a demo, how R can be called from Sage to do something useful.
︡937c46bd-d0cc-4dbc-828d-1967a4e5af22︡{"html":"<h2>R Basics</h2>\n\n<p>Just a demo, how R can be called from Sage to do something useful.</p>\n"}︡
︠9bc1495a-b023-418a-a05f-f6fbdc30ee2b︠
print r
︡295f9594-452e-4425-a1ce-16761ded1f8e︡{"stdout":"R Interpreter\n"}︡
︠d7e14cf3-59c9-49cf-98a9-9fa562b5028f︠
x = r.c((1,2,3,-1, 2,2.2))
print x
type(x)
print x.summary()
︡bd855375-ba11-4fc7-bee3-c8133336e719︡{"stdout":"[1]  1.0  2.0  3.0 -1.0  2.0  2.2\n"}︡{"stdout":"<class 'sage.interfaces.r.RElement'>\n"}︡{"stdout":"   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. \n -1.000   1.250   2.000   1.533   2.150   3.000 \n"}︡
︠d5ce0640-6ddf-4026-99fe-c5890fa99f80︠
%r
x <- c(1,4,3,4,3,2,3,2,3,6,3)
summary(x)
︡8706fd64-4854-4ace-b27e-603d77fd0c44︡{"stdout":"\n   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. \n  1.000   2.500   3.000   3.091   3.500   6.000 \n"}︡
︠635e9bd6-4ea8-43ac-a439-cb25d76a1f08︠
%r
x[1]
x[2]
︡f203a916-6759-4221-a3f0-49da05609131︡{"stdout":"[1] 1\n[1] 4\n"}︡
︠9c10d845-42a6-4165-9e30-2cf1f7100609︠
%r
z <- sample(-5:5, 30, replace=T)
z
summary(z)
︡47d6d99c-0b7c-4bf9-b024-27457f7a110c︡{"stdout":"\n [1]  0  1  4  3 -3 -4  4  1  1  0  0 -1 -2  2  3  1  2  2  2  1  2  4 -4  4  0  5 -3  1 -5 -1\n   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. \n-5.0000 -0.7500  1.0000  0.6667  2.0000  5.0000 \n"}︡
︠bbc2bcdd-1b14-44e0-b943-0f4540cefdd3︠
z2 = r.sample(range(-5,5), 10, replace=False)
z2
︡1cce5468-5fb1-40db-bd4d-9c9e913f5720︡{"stdout":" [1]  3 -4 -1  2 -2  0 -5 -3  1  4\n"}︡
︠1780e941-3433-40db-97a4-9d48d3fe3616︠
%r
plot(-5:5, sample(-5:5, 11, replace=F))
︡96860c76-5ce3-4de2-97fa-900ed8819f52︡{"stdout":"Error in X11(paste(\"png::\", filename, sep = \"\"), g$width, g$height, pointsize,  : \n  unable to start device PNG\nIn addition: Warning message:\nIn png() : unable to open connection to X11 display ''\n"}︡
︠0b590cf1-31dc-449a-b987-d5d915f02899i︠
%md
Linear Regression
-----------------
︡26f02842-9bec-452d-96fc-d5383412f7ce︡{"html":"<h2>Linear Regression</h2>\n"}︡
︠62845916-965e-40d0-b5e7-81d1a0d6a353︠
%r
X <- sort(runif(100, -5,5))
Y <- -2 + 1.1 * X + rnorm(100, 0, 2)
lmobj <- lm(Y ~ X)
summary(lmobj)
︡d6d4821a-5553-487f-9006-9ccca1d10940︡{"stdout":"\n\n\n\nCall:\nlm(formula = Y ~ X)\n\nResiduals:\n    Min      1Q  Median      3Q     Max \n-5.8008 -1.6917  0.0212  1.5768  7.2443 \n\nCoefficients:\n            Estimate Std. Error t value Pr(>|t|)    \n(Intercept) -2.22457    0.25088  -8.867 3.47e-14 ***\nX            1.04077    0.08592  12.113  < 2e-16 ***\n---\nSignif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1 \n\nResidual standard error: 2.503 on 98 degrees of freedom\nMultiple R-squared: 0.5996,\tAdjusted R-squared: 0.5955 \nF-statistic: 146.7 on 1 and 98 DF,  p-value: < 2.2e-16 \n"}︡{"stdout":"\n"}︡
︠98f9d9d7-2ef0-41ac-b007-ef41bcc486a4︠
%r
new <- data.frame(x = seq(-5, 5, .5))
predict(lmobj, new)
︡d3967e11-fa8c-493d-bdf4-f420291c8429︡{"stdout":"\n          1           2           3           4           5           6           7           8 \n-7.35792156 -7.24598048 -7.08570249 -6.86947263 -6.86682718 -6.81599251 -6.60220973 -6.51291145 \n          9          10          11          12          13          14          15          16 \n-6.34852276 -6.26734233 -6.25260767 -6.22319957 -6.13097065 -6.07794990 -5.95446768 -5.94037418 \n         17          18          19          20          21          22          23          24 \n-5.88326654 -5.85987169 -5.69287732 -5.42268964 -5.33316071 -5.33011805 -5.31741435 -5.28997582 \n         25          26          27          28          29          30          31          32 \n-5.24308769 -5.20838759 -5.11397074 -5.10087665 -4.97900180 -4.95471939 -4.91351692 -4.89716543 \n         33          34          35          36          37          38          39          40 \n-4.83991851 -4.83745612 -4.72159150 -4.63985010 -4.25629127 -4.23419036 -4.21868050 -3.97808149 \n         41          42          43          44          45          46          47          48 \n-3.48519720 -3.34665057 -3.33864739 -3.12071204 -3.05243883 -3.04018300 -2.86075932 -2.64767083 \n         49          50          51          52          53          54          55          56 \n-2.64015502 -2.43036964 -2.36709020 -2.28510530 -1.99450613 -1.96636909 -1.94689214 -1.91033795 \n         57          58          59          60          61          62          63          64 \n-1.88975700 -1.79023130 -1.57174332 -1.42609888 -1.30155579 -1.26396447 -1.09102586 -1.04826453 \n         65          66          67          68          69          70          71          72 \n-1.01718755 -0.91997556 -0.91732667 -0.67266824 -0.48240040 -0.44729511 -0.14577711 -0.10573073 \n         73          74          75          76          77          78          79          80 \n-0.08135420 -0.07304863  0.09022063  0.20753495  0.21590866  0.23658294  0.36515252  0.53744984 \n         81          82          83          84          85          86          87          88 \n 0.96127649  1.01058754  1.10464894  1.36899884  1.43283836  1.58354384  1.64377726  1.70958125 \n         89          90          91          92          93          94          95          96 \n 1.75227964  1.79491882  1.80179302  1.95798303  2.12749006  2.33231413  2.35510579  2.54155125 \n         97          98          99         100 \n 2.54728040  2.60653062  2.64387491  2.96163532 \nWarning message:\n'newdata' had 21 rows but variable(s) found have 100 rows \n"}︡
︠060f3cb5-40c5-4af9-b60d-c7e2012d8699︠









