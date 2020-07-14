		  *==============================================================
          *          Financial Econometrics for MSc Programme
          *==============================================================

		  * Binzhi Chen
		  * University of Birmingham Business School, Department of Economics
		  * Email: Rickchen0910@163.com

          *==============================================================

use http://www.stata-press.com/data/r15/wpi1,clear

tsset t

g dln_wpi = D.ln_wpi

g sqdln_wpi = dln_wpi^2

line sqdln_wpi t

reg dln_wpi

estat archlm,lags(1)

predict e1,resid

g e2 = e1^2

varsoc e2

arch dln_wpi , arch(1/2)

arch dln_wpi, arch(1/2) nolog

arch dln_wpi, arch(1) garch(1) nolog 

arch dln_wpi, ar(1) ma(1) arch(1) garch(1) nolog 

arch dln_wpi, ar(1) ma(1) earch(1) egarch(1) nolog
