	subroutine studentt(var,idf,ilin,ipar,s95,s99,s9995)
c	Calculates Student's t distribution, using data table from CRC.
	implicit double precision (a-h,j-z)
	real*8 t600(34),t750(34),t900(34),t950(34),t975(34),t990(34)
	real*8 t995(34),t999(34),t9995(34),var(165,165)
	real*8 s95(165),s99(165),s9995(165)
	integer*4ilin,idf(165),idf2(165),ipar
	data t600/.325,.289,.277,.271,.267,.265,.263,.262,.261,2*.260,
     2    2*.259,3*.258,5*.257,9*.256,.255,2*.254,.253/
	data t750/1.000,.816,.765,.741,.727,.718,.711,.706,.703,.700,
     2    .697,.695,.694,.692,.691,.690,.689,2*.688,.687,2*.686,
     3    2*.685,.684,.684,.684,.683,.683,.683,.681,.679,.677,.674/
	data t900/3.078,1.886,1.638,1.533,1.476,1.440,1.415,1.397,1.383,
     2    1.372,1.363,1.356,1.30,1.345,1.341,1.337,1.333,1.330,1.328,
     3    1.325,1.323,1.321,1.319,1.318,1.316,1.315,1.314,1.313,1.311,
     4    1.310,1.303,1.296,1.289,1.282/
	data t950/6.314,2.920,2.353,2.132,2.015,1.943,1.895,1.860,1.833,
     2    1.812,1.796,1.782,1.771,1.761,1.753,1.746,1.740,1.734,1.729,
     3    1.725,1.721,1.717,1.714,1.711,1.708,1.706,1.703,1.701,1.699,
     4    1.697,1.684,1.671,1.658,1.645/
	data t975/12.706,4.303,3.182,2.776,2.571,2.447,2.365,2.306,2.262,
     2    2.228,2.201,2.179,2.160,2.145,2.131,2.120,2.110,2.101,2.093,
     3    2.086,2.080,2.074,2.069,2.064,2.060,2.056,2.052,2.048,2.045,
     4    2.042,2.021,2.000,1.980,1.960/
	data t990/31.821,6.965,4.541,3.747,3.365,3.143,2.998,2.896,2.821,
     2    2.764,2.718,2.681,2.650,2.624,2.602,2.583,2.567,2.552,2.539,
     3    2.528,2.518,2.508,2.500,2.492,2.485,2.479,2.473,2.467,2.462,
     4    2.457,2.423,2.390,2.358,2.326/
	data t995/63.657,9.925,5.841,4.604,4.032,3.707,3.499,3.355,3.250,
     2    3.169,3.106,3.055,3.012,2.977,2.947,2.921,2.898,2.878,2.861,
     3    2.845,2.831,2.819,2.807,2.797,2.787,2.779,2.771,2.763,2.756,
     4    2.750,2.704,2.660,2.617,2.576/
	data t999/318.0,22.30,10.20,7.173,5.893,5.208,4.785,4.501,4.297,
     2    4.144,4.025,3.930,3.852,3.787,3.733,3.686,3.646,3.610,3.579,
     3    3.552,3.527,3.505,3.485,3.467,3.450,3.435,3.421,3.408,3.396,
     4    3.385,3.307,3.232,3.160,3.090/
	data t9995/636.619,31.598,12.924,8.610,6.869,5.959,5.408,5.041,
     2    4.781,4.587,4.437,4.318,4.221,4.140,4.073,4.015,3.965,3.922,
     3    3.883,3.850,3.819,3.792,3.767,3.745,3.725,3.707,3.690,3.674,
     4    3.659,3.646,3.551,3.460,3.373,3.291/

c	initialize
	do i1=1,ipar
	  s95(i1)=0d0
	  s99(i1)=0d0
	  s9995(i1)=0d0
	enddo

	do100i1=1,ipar
	 idf2(i1)=idf(i1)
	 if(idf2(i1).le.0)goto100
	 if((idf(i1).ge.30).and.(idf(i1).le.39))idf2(i1)=30
	 if((idf(i1).ge.40).and.(idf(i1).le.59))idf2(i1)=31
	 if((idf(i1).ge.60).and.(idf(i1).le.119))idf2(i1)=32
	 if((idf(i1).ge.120).and.(idf(i1).le.499))idf2(i1)=33
	 if(idf(i1).ge.500)idf2(i1)=34
	 s95(i1)=dsqrt(var(i1,i1))*t950(idf2(i1))/dsqrt(dfloat(idf(i1)))
	 s99(i1)=dsqrt(var(i1,i1))*t990(idf2(i1))/dsqrt(dfloat(idf(i1)))
	 s9995(i1)=dsqrt(var(i1,i1))*t9995(idf2(i1))/
     2      dsqrt(dfloat(idf(i1)))
100	continue
	return
	end

