︠3739685f-03c2-4080-8d85-ce87200a9104i︠
%md
OLS vs RLM
==========

The following shows a comparison between ordinary least squares and a robust linear model
in [statsmodels](http://statsmodels.sourceforge.net/).
︡9cf99d05-06dd-4cf2-8a0a-9f76090870de︡{"html":"<h1>OLS vs RLM</h1>\n\n<p>The following shows a comparison between ordinary least squares and a robust linear model\nin <a href=\"http://statsmodels.sourceforge.net/\">statsmodels</a>.</p>\n"}︡
︠439486c1-a19b-4f9b-8cba-af4d47f36d7fa︠
%auto
import statsmodels.api as sm
import numpy as np
import matplotlib.pyplot as plt
︡c59b2822-c490-42d6-80c6-f11e91b28a4e︡{"auto":true}︡
︠f19525d8-e5b5-495a-a388-aeae0989083f︠
%python
COEFF = .7654321 # inclination
OFFSET = 3.1415  # offset
EPS = 3.         # amout of disturbance
xl = -5.         # lower bound
xu = 5.          # upper bound
nb = 100         # number of data points
︡28ad5a3d-2aa4-4d91-a927-964031f1aee1︡
︠b6f29afd-3401-4f06-ab85-9d00fb200aa5︠
xx = np.linspace(xl,xu,nb) + ((xu-xl) / nb / 2.) * np.random.randn(nb)
yy = COEFF * xx + OFFSET + (5. / nb * xx * np.random.randn(nb))
selsize = nb / 10
randsel = np.random.choice(np.arange(nb / 2), selsize, replace=False)
yy[randsel] += np.random.random(selsize) * EPS
xx[randsel] -= np.random.random(selsize) * EPS
randsel = np.random.choice(np.arange(nb / 2) + nb/2, selsize, replace=False)
yy[randsel] -= np.random.random(selsize) * EPS
xx[randsel] += np.random.random(selsize) * EPS
︡f6ec8784-3113-44f5-addd-d5e9e2e4fb71︡
︠79d9ace6-c69a-4d3a-b3a2-0b60864f81f3︠
omodel = sm.OLS(yy, np.c_[np.ones(nb), xx])
ofit = omodel.fit()
rmodel = sm.RLM(yy, np.c_[np.ones(nb), xx], M=sm.robust.norms.HuberT())
rfit = rmodel.fit()
︡2f9b1124-caff-4105-bc6b-b490e01bbeac︡
︠67681809-a71a-466a-a639-ec7b916da328︠
true = np.array([OFFSET, COEFF])
print 'True: %s' % true
print 'OLS:  %s (%.5f)' % (ofit.params, np.linalg.norm(ofit.params - true))
print 'RLS:  %s (%.5f)' % (rfit.params, np.linalg.norm(rfit.params - true))
︡438d64ed-137b-48a6-931b-ac3bbc6f708d︡{"stdout":"True: [ 3.1415     0.7654321]\n"}︡{"stdout":"OLS:  [ 3.18771324  0.54335458] (0.22683)\n"}︡{"stdout":"RLS:  [ 3.1702073   0.73458569] (0.04214)\n"}︡
︠75b5c3cd-8792-4061-8017-939bbefe146c︠
print rfit.summary()
︡b03d42bc-04cd-48d0-b194-fc0781bd198e︡{"stdout":"                    Robust linear Model Regression Results                    \n==============================================================================\nDep. Variable:                      y   No. Observations:                  100\nModel:                            RLM   Df Residuals:                       98\nMethod:                          IRLS   Df Model:                            1\nNorm:                          HuberT                                         \nScale Est.:                       mad                                         \nCov Type:                          H1                                         \nDate:                Sun, 11 Aug 2013                                         \nTime:                        10:07:26                                         \nNo. Iterations:                    29                                         \n==============================================================================\n                 coef    std err          z      P>|z|      [95.0% Conf. Int.]\n------------------------------------------------------------------------------\nconst          3.1702      0.025    126.952      0.000         3.121     3.219\nx1             0.7346      0.008     97.298      0.000         0.720     0.749\n==============================================================================\n\nIf the model instance has been used for another fit with different fit\nparameters, then the fit options might not be the correct ones anymore .\n"}︡
︠247ed753-1c09-4228-8ffe-2c98465e6606︠
plt.clf()
_ = plt.plot(xx, yy, 'k.')
_ = plt.plot(xx, ofit.fittedvalues, 'r-', linewidth=2)
_= plt.plot(xx, rfit.fittedvalues, 'g-', linewidth=2)
plt.show()
︡5f8a743d-e14c-47ed-a0c1-8f3c92f2489d︡{"file":{"show":true,"uuid":"7da6e6c7-7dbf-4f1e-a522-1ad7443eca4c","filename":"8d033e92-ef98-46b5-8467-0df2d0e56c7a.png"}}︡
︠7313b504-7cdb-4b44-af14-43572dcbab2f︠









