c************************************************
		program Pgderivatives_i
c************************************************

c Pgderivatives_i calculate Pg, and its derivatives versus T & Pe
c from T and Pe
c Basilio Ruiz 8 May 2017
c _______________________________________________________________


        real*4 T,Pg,pe,dPg,ddPg
        real p(99),dp(99),ddp(99)
        character*100 fichabun
        common/fichabun/fichabun
        
        fichabun='THEVENIN'
              
        print*,'give me T and Pe'
        read*,T,pe
        
        theta=5040./T
        call gasb(theta,pe,p,dp,ddp)
        Pg=p(84)
        dPg=dp(84)     ! dPg is the derivative of logPg versus T 
        ddPg=ddp(84)   ! ddPg is the derivative of logPg versus pe 
           
	open(2,file='output_Pgderivatives_i')
	write(2,1002)'Pg','dlogPg/dT','dlogPg/pe'
        
        write(2,1001)Pg,dpg,ddpg
        
        close(2)
        
1001     format(1x,3(1pe10.3,1x))
1002     format(1x,3(a10,1x))	

        end 

