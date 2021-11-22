program Hw0
	!AlwaysDeclaretoTreatAllVariablesasRealArguments
	implicit none

	!InputTerms,DeclareDoublePrecision
	real(kind=8)::thres1,thres2,thres3,thres4
	real(kind=8)::n,dif

	!InputThresholds
	thres1=1.e-4
	thres2=1.e-8
	thres3=1.e-12
	thres4=1.e-16

	!InputInitialVariables
	n=0
	dif=thres1*2 !MakeSureDifLargerThanInitialThreshold

	!RunThroughSubroutines
	!Findfor1rstThreshold
	call dif_calc(n,dif,thres1)
	Print *, "1.e-4 Threshold Results:"
	Print *,"N = ",n,"Dif = ",dif

	!Findfor2ndThreshold
	call dif_calc(n,dif,thres2)
	Print *, "1.e-8 ThresholdResults:"
	Print *,"N = ",n,"Dif = ",dif

	!Findfor3rdThreshold
	call dif_calc(n,dif,thres3)
	Print *, "1.e-14 Threshold Results:"
	Print *,"N = ",n,"Dif = ",dif

	!Findfor4thThreshold
	call dif_calc(n,dif,thres4)
	Print *, "1.e-16 Threshold Results:"
	Print *,"N = ",n,"Dif = ",dif
	
contains 
    subroutine dif_calc(n,dif,thres)
	!AlwaysDeclaretoTreatAllVariablesasRealArguments
	implicit none

	!DeclareVariables
	real(kind=8)::dif,thres,num,pi_act,num_new
	real(kind=8)::f1,f2,f3,f4
	real(kind=8)::f11,f22,f33,f44,f5,n
	pi_act=dacos(-1.D0)

	!InputInitialVariables
	num=0	!SumisInitiallyZero
	n=-1	!StartLoopAtZero,GiveIntialNegative1Value
	dif=thres*2 !MakeSureDifLargerThanInitialThreshold

	!InputNumerators
	f1=4
	f2=-2
	f3=-1
	f4=-1

	!RunLoopUntilDifferenceisLessthanThreshold
	do while(dif>thres)        
		!Change"n"terms
		n=n+1
		f5=16**(-1*n)

		!InputDemoninators
		!AdjustforIntegerandDouble-PrecisionMerge
		f11=8.d0*n+1.d0
		f22=8.d0*n+4.d0
		f33=8.d0*n+5.d0
		f44=8.d0*n+6.d0

		!CalculateSumandDifference
		num_new=f5*(f1/f11+f2/f22+f3/f33+f4/f44)
		num=num+num_new
		dif=abs(num-pi_act)
	end do
	end subroutine dif_calc
end program Hw0
