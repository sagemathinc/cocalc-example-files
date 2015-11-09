︠f09e8dd2-8098-4a54-8ff3-54f8c8744aa6i︠
%md
R Basics
--------

Just a demo, how R can be called from Sage to do something useful.
︡f6cdcb20-ffe0-42b4-b77e-4f6f46e1be55︡{"html":"<h2>R Basics</h2>\n\n<p>Just a demo, how R can be called from Sage to do something useful.</p>\n"}︡
︠9bc1495a-b023-418a-a05f-f6fbdc30ee2bs︠
print r
︡e77aec36-708d-4c1b-8379-e92c772e84d4︡︡{"stdout":"R Interpreter\n","done":false}︡{"done":true}
︠d7e14cf3-59c9-49cf-98a9-9fa562b5028f︠
x = r.c((1,2,3,-1, 2,2.2))
print x
type(x)
print x.summary()
︡b564f637-f2fc-4d32-9065-5999b245de80︡{"stdout":"[1]  1.0  2.0  3.0 -1.0  2.0  2.2\n"}︡{"stdout":"<class 'sage.interfaces.r.RElement'>\n"}︡{"stdout":"   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. \n -1.000   1.250   2.000   1.533   2.150   3.000 \n"}︡
︠d5ce0640-6ddf-4026-99fe-c5890fa99f80︠
%r
x <- c(1,4,3,4,3,2,3,2,3,6,3)
summary(x)
︡1fdcc654-7522-49dd-8cd0-cc24b9f8c69c︡{"stdout":"\n   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. \n  1.000   2.500   3.000   3.091   3.500   6.000 \n"}︡
︠635e9bd6-4ea8-43ac-a439-cb25d76a1f08︠
%r
x[1]
x[2]
︡943efaae-1408-49ed-9887-dd887bbabc9b︡{"stdout":"[1] 1\n[1] 4\n"}︡
︠9c10d845-42a6-4165-9e30-2cf1f7100609︠
%r
z <- sample(-5:5, 30, replace=T)
z
summary(z)
︡446940e7-147c-4712-ac0f-8b4916c33648︡{"stdout":"\n [1]  5  5 -2  5 -5 -4 -3 -4  1 -1 -1 -3  0  0 -2  1 -4 -2 -2 -2 -5 -5 -4  1  1  4 -2 -1  0 -4\n   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. \n  -5.00   -3.75   -2.00   -1.10    0.75    5.00 \n"}︡
︠bbc2bcdd-1b14-44e0-b943-0f4540cefdd3︠
z2 = r.sample(range(-5,5), 10, replace=False)
z2
︡b6cd6f5c-df40-4b56-a3f1-20bb90475b51︡{"stdout":" [1]  0  4 -1 -5  2 -2 -3 -4  3  1\n"}︡
︠1780e941-3433-40db-97a4-9d48d3fe3616︠
%r
plot(-5:5, sample(-5:5, 11, replace=F))
︡d8a21539-2fd9-426c-b043-2192e3f44573︡{"once":false,"file":{"show":true,"uuid":"fbfa3f97-a2a7-46b3-be1a-d0f7ac1a7113","filename":"/tmp/c5c7f755-974e-47df-859a-ff883b61933a.png"}}︡{"stdout":"\n"}︡
︠0b590cf1-31dc-449a-b987-d5d915f02899i︠
%md
Linear Regression
-----------------
︡28be9462-47df-404a-88cd-d47d79572c00︡{"html":"<h2>Linear Regression</h2>\n"}︡
︠62845916-965e-40d0-b5e7-81d1a0d6a353︠
%r
X <- sort(runif(100, -5,5))
Y <- -2 + 1.1 * X + rnorm(100, 0, 5)
lmobj <- lm(Y ~ X)
summary(lmobj)
︡f5c75fb9-3dd1-4c58-8442-128680422ff1︡{"stdout":"\n\n\n\nCall:\nlm(formula = Y ~ X)\n\nResiduals:\n    Min      1Q  Median      3Q     Max \n-9.8958 -3.1144 -0.4075  2.8230 12.4266 \n\nCoefficients:\n            Estimate Std. Error t value Pr(>|t|)    \n(Intercept)  -1.6632     0.4948  -3.361  0.00111 ** \nX             1.3158     0.1904   6.909 4.94e-10 ***\n---\nSignif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1 \n\nResidual standard error: 4.945 on 98 degrees of freedom\nMultiple R-squared: 0.3276,\tAdjusted R-squared: 0.3207 \nF-statistic: 47.74 on 1 and 98 DF,  p-value: 4.941e-10 \n\n"}︡
︠6572ca5a-3897-4b71-8162-e9faf1d407bd︠









