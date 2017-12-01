︠f09e8dd2-8098-4a54-8ff3-54f8c8744aa6i︠
%md
R Basics
--------

Just a demo, how R can be called from Sage to do something useful.

**Note: every block of code starts with `%r` to switch to R-mode.** Use `%default_mode r` in a single bock to switch `r` to be the default.
︡f6cdcb20-ffe0-42b4-b77e-4f6f46e1be55︡{"done":true,"md":"R Basics\n--------\n\nJust a demo, how R can be called from Sage to do something useful.\n\n**Note: every block of code starts with `%r` to switch to R-mode.** Use `%default_mode r` in a single bock to switch `r` to be the default."}
︠9bc1495a-b023-418a-a05f-f6fbdc30ee2bs︠
%r
x <- c(1,4,3,4,3,2,3,2,3,6,3)
summary(x)
︡3fe0356d-33d8-4ed6-b02d-457926a3890c︡{"stdout":"   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. \n  1.000   2.500   3.000   3.091   3.500   6.000 "}︡{"done":true}︡
︠635e9bd6-4ea8-43ac-a439-cb25d76a1f08s︠
%r
x[1]
x[2]
︡6d09689d-f487-4377-8ad8-bca4a56fb2f2︡{"html":"1"}︡{"html":"4"}︡{"done":true}︡
︠9c10d845-42a6-4165-9e30-2cf1f7100609s︠
%r
z <- sample(-5:5, 30, replace=T)
z
summary(z)
︡1f23e821-e0a4-4ef9-9ab3-e383be2860d7︡{"html":"<ol class=list-inline>\n\t<li>5</li>\n\t<li>2</li>\n\t<li>3</li>\n\t<li>-1</li>\n\t<li>-1</li>\n\t<li>-1</li>\n\t<li>2</li>\n\t<li>-5</li>\n\t<li>-4</li>\n\t<li>-5</li>\n\t<li>0</li>\n\t<li>-5</li>\n\t<li>-3</li>\n\t<li>2</li>\n\t<li>5</li>\n\t<li>1</li>\n\t<li>5</li>\n\t<li>5</li>\n\t<li>2</li>\n\t<li>3</li>\n\t<li>3</li>\n\t<li>3</li>\n\t<li>5</li>\n\t<li>-2</li>\n\t<li>-1</li>\n\t<li>-1</li>\n\t<li>-5</li>\n\t<li>2</li>\n\t<li>3</li>\n\t<li>-5</li>\n</ol>\n"}︡{"stdout":"   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. \n  -5.00   -1.75    1.50    0.40    3.00    5.00 "}︡{"done":true}︡
︠bbc2bcdd-1b14-44e0-b943-0f4540cefdd3s︠
%r
plot(-5:5, sample(-5:5, 11, replace=F))
︡06c82160-e426-46d4-8505-131ee675b0e7︡{"file":{"filename":"/tmp/tmpQE6EHh.png","show":false,"text":null,"uuid":"64e72d68-1ba5-4d16-b5c3-dfea34408365"},"once":false}︡{"html":"<img src=\"/blobs//tmp/tmpQE6EHh.png?uuid=64e72d68-1ba5-4d16-b5c3-dfea34408365\" smc-image-scaling=\"0.5\" />"}︡{"done":true}︡
︠0b590cf1-31dc-449a-b987-d5d915f02899i︠
%md
Linear Regression
-----------------
︡28be9462-47df-404a-88cd-d47d79572c00︡{"done":true,"md":"Linear Regression\n-----------------"}
︠62845916-965e-40d0-b5e7-81d1a0d6a353s︠
%r
X <- sort(runif(100, -5,5))
Y <- -2 + 1.1 * X + rnorm(100, 0, 5)
lmobj <- lm(Y ~ X)
summary(lmobj)
︡127ef386-380b-4893-892a-5697dd7aa64a︡{"stdout":"\nCall:\nlm(formula = Y ~ X)\n\nResiduals:\n     Min       1Q   Median       3Q      Max \n-10.3505  -3.1704  -0.1131   3.0550  14.0648 \n\nCoefficients:\n            Estimate Std. Error t value Pr(>|t|)    \n(Intercept)  -1.3877     0.5326  -2.606   0.0106 *  \nX             1.0741     0.1821   5.900  5.2e-08 ***\n---\nSignif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1\n\nResidual standard error: 5.323 on 98 degrees of freedom\nMultiple R-squared:  0.2621,\tAdjusted R-squared:  0.2546 \nF-statistic: 34.81 on 1 and 98 DF,  p-value: 5.199e-08\n"}︡{"done":true}︡
︠e5aafc80-c433-4e20-a395-0303cd2e9606i︠
%md
It is also possible to `plot` the R-object `lmobj` to learn more about the linear regression.
︡a5171f8a-93ca-463b-9efc-7cf0b0dd14c8︡{"done":true,"md":"It is also possible to `plot` the R-object `lmobj` to learn more about the linear regression."}
︠6572ca5a-3897-4b71-8162-e9faf1d407bds︠
%r
plot(lmobj)
︡d17b2846-38d2-4e22-b90b-5e5874d133ca︡{"file":{"filename":"/tmp/tmpes7qU4.png","show":false,"text":null,"uuid":"b8af6c24-bcab-4672-a02f-c3a9879dcb78"},"once":false}︡{"html":"<img src=\"/blobs//tmp/tmpes7qU4.png?uuid=b8af6c24-bcab-4672-a02f-c3a9879dcb78\" smc-image-scaling=\"0.5\" />"}︡{"file":{"filename":"/tmp/tmpUwu66O.png","show":false,"text":null,"uuid":"7161b3ee-e1b6-4d8c-bb24-fc0667611102"},"once":false}︡{"html":"<img src=\"/blobs//tmp/tmpUwu66O.png?uuid=7161b3ee-e1b6-4d8c-bb24-fc0667611102\" smc-image-scaling=\"0.5\" />"}︡{"file":{"filename":"/tmp/tmp4ht2NL.png","show":false,"text":null,"uuid":"efdc28d7-5ba7-4037-8d4d-b183778dcb5f"},"once":false}︡{"html":"<img src=\"/blobs//tmp/tmp4ht2NL.png?uuid=efdc28d7-5ba7-4037-8d4d-b183778dcb5f\" smc-image-scaling=\"0.5\" />"}︡{"file":{"filename":"/tmp/tmpgshuz6.png","show":false,"text":null,"uuid":"53b3d40d-d5d8-4c1b-9b30-9fde0112bee3"},"once":false}︡{"html":"<img src=\"/blobs//tmp/tmpgshuz6.png?uuid=53b3d40d-d5d8-4c1b-9b30-9fde0112bee3\" smc-image-scaling=\"0.5\" />"}︡{"done":true}︡









