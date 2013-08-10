︠3739685f-03c2-4080-8d85-ce87200a9104i︠
%md
OLS vs RLM
==========

The following shows a comparison between ordinary least squares and a robust linear model
in [statsmodels](http://statsmodels.sourceforge.net/).
︡fef17a12-e399-41d2-886f-59187c8a4549︡{"html":"<h1>OLS vs RLM</h1>\n\n<p>The following shows a comparison between ordinary least squares and a robust linear model\nin <a href=\"http://statsmodels.sourceforge.net/\">statsmodels</a>.</p>\n"}︡
︠439486c1-a19b-4f9b-8cba-af4d47f36d7fa︠
%auto
import statsmodels.api as sm
import numpy as np
import matplotlib.pyplot as plt
︡86d99eec-d76c-4705-9f11-5622de01911d︡{"auto":true}︡
︠f19525d8-e5b5-495a-a388-aeae0989083f︠
%python
COEFF = .7654321 # inclination
OFFSET = 3.1415  # offset
EPS = 3.         # amout of disturbance
xl = -5.         # lower bound
xu = 5.          # upper bound
nb = 100         # number of data points
︡b7d5dc54-a08b-4213-9be0-61bfa7b87c8e︡
︠b6f29afd-3401-4f06-ab85-9d00fb200aa5︠
xx = np.linspace(xl,xu,nb) + ((xu-xl) / nb / 2.) * np.random.randn(nb)
yy = COEFF * xx + OFFSET + (5. / nb * xx * np.random.randn(nb))
randsel = np.random.choice(np.arange(nb / 2), nb / 10, replace=False)
yy[randsel] += np.random.random() * EPS
xx[randsel] -= np.random.random() * EPS
randsel = np.random.choice(np.arange(nb / 2) + nb/2, nb / 10, replace=False)
yy[randsel] -= np.random.random() * EPS
xx[randsel] += np.random.random() * EPS
︡2a203bac-0b7e-467e-81a7-46a1b1756c2f︡
︠79d9ace6-c69a-4d3a-b3a2-0b60864f81f3︠
omodel = sm.OLS(yy, np.c_[np.ones(nb), xx])
ofit = omodel.fit()
rmodel = sm.RLM(yy, np.c_[np.ones(nb), xx], M=sm.robust.norms.HuberT())
rfit = rmodel.fit()
︡b4792479-e17b-49f0-9438-f593cc690471︡
︠67681809-a71a-466a-a639-ec7b916da328︠
true = np.array([OFFSET, COEFF])
print 'True: %s' % true
print 'OLS:  %s (%.5f)' % (ofit.params, np.linalg.norm(ofit.params - true))
print 'RLS:  %s (%.5f)' % (rfit.params, np.linalg.norm(rfit.params - true))
︡207d5073-14fa-4688-b963-c9e3fd5b9403︡{"stdout":"True: [ 3.1415     0.7654321]\n"}︡{"stdout":"OLS:  [ 2.98291851  0.54040196] (0.27529)\n"}︡{"stdout":"RLS:  [ 3.16574147  0.71206504] (0.05861)\n"}︡
︠75b5c3cd-8792-4061-8017-939bbefe146c︠
print rfit.summary()
︡17c2dffa-ef8a-4c5f-a991-d639faaf3d7b︡{"stdout":"                    Robust linear Model Regression Results                    \n==============================================================================\nDep. Variable:                      y   No. Observations:                  100\nModel:                            RLM   Df Residuals:                       98\nMethod:                          IRLS   Df Model:                            1\nNorm:                          HuberT                                         \nScale Est.:                       mad                                         \nCov Type:                          H1                                         \nDate:                Sat, 10 Aug 2013                                         \nTime:                        10:42:24                                         \nNo. Iterations:                    41                                         \n==============================================================================\n                 coef    std err          z      P>|z|      [95.0% Conf. Int.]\n------------------------------------------------------------------------------\nconst          3.1657      0.025    126.649      0.000         3.117     3.215\nx1             0.7121      0.008     92.485      0.000         0.697     0.727\n==============================================================================\n\nIf the model instance has been used for another fit with different fit\nparameters, then the fit options might not be the correct ones anymore .\n"}︡
︠247ed753-1c09-4228-8ffe-2c98465e6606︠
plt.clf()
_ = plt.plot(xx, yy, 'k.')
_ = plt.plot(xx, ofit.fittedvalues, 'r-', linewidth=2)
_= plt.plot(xx, rfit.fittedvalues, 'g-', linewidth=2)
plt.show()
︡69d62187-04c1-4c76-813f-febbae62a4f1︡{"file":{"show":true,"uuid":"e801a012-d5d1-4bbe-bdc5-f3a21ce76a31","filename":"a6403a02-144e-4370-a131-bc219bfb8026.png"}}︡
︠7313b504-7cdb-4b44-af14-43572dcbab2f︠









