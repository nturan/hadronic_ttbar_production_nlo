C$Modified: Thu Jan 11 10:48:04 2007 by puwer $
c ----------------------------------------------------------------------
c
      subroutine hvsxxx(vc,sc,g,smass,swidth , hvs)
c
c this subroutine computes an off-shell scalar current from the vector- 
c scalar-scalar coupling.  the coupling is absent in the minimal sm in  
c unitary gauge.                                                        
c                                                                       
c input:                                                                
c       double complex vc(6)          : input vector                          v
c       double complex sc(3)          : input scalar                          s
c       double complex g              : coupling constant (s charge)           
c       double precision    smass          : mass  of output scalar s'              
c       double precision    swidth         : width of output scalar s'              
c                                                                       
c examples of the coupling constant g for susy particles are as follows:
c   -----------------------------------------------------------         
c   |    s1    | (q,i3) of s1  ||   v=a   |   v=z   |   v=w   |         
c   -----------------------------------------------------------         
c   | nu~_l    | (  0  , +1/2) ||   ---   |  gzn(1) |  gwf(1) |         
c   | e~_l     | ( -1  , -1/2) ||  gal(1) |  gzl(1) |  gwf(1) |         
c   | u~_l     | (+2/3 , +1/2) ||  gau(1) |  gzu(1) |  gwf(1) |         
c   | d~_l     | (-1/3 , -1/2) ||  gad(1) |  gzd(1) |  gwf(1) |         
c   -----------------------------------------------------------         
c   | e~_r-bar | ( +1  ,  0  ) || -gal(2) | -gzl(2) | -gwf(2) |         
c   | u~_r-bar | (-2/3 ,  0  ) || -gau(2) | -gzu(2) | -gwf(2) |         
c   | d~_r-bar | (+1/3 ,  0  ) || -gad(2) | -gzd(2) | -gwf(2) |         
c   -----------------------------------------------------------         
c where the sc charge is defined by the flowing-out quantum number.     
c                                                                       
c output:                                                               
c       double complex hvs(3)         : scalar current                j(s':v,s)
c
      implicit none
      double complex vc(6),sc(3),hvs(3),dg,qvv,qpv,g
      double precision qv(0:3),qp(0:3),qa(0:3),smass,swidth,q2
c
      hvs(2) = vc(5)+sc(2)
      hvs(3) = vc(6)+sc(3)
c
      qv(0)=dble(  vc(5))
      qv(1)=dble(  vc(6))
      qv(2)=dimag( vc(6))
      qv(3)=dimag( vc(5))
      qp(0)=dble(  sc(2))
      qp(1)=dble(  sc(3))
      qp(2)=dimag( sc(3))
      qp(3)=dimag( sc(2))
      qa(0)=dble( hvs(2))
      qa(1)=dble( hvs(3))
      qa(2)=dimag(hvs(3))
      qa(3)=dimag(hvs(2))
      q2=qa(0)**2-(qa(1)**2+qa(2)**2+qa(3)**2)
c
      dg=-g/dcmplx( q2-smass**2 , max(dsign( smass*swidth ,q2),0d0) )
      qvv=qv(0)*vc(1)-qv(1)*vc(2)-qv(2)*vc(3)-qv(3)*vc(4)
      qpv=qp(0)*vc(1)-qp(1)*vc(2)-qp(2)*vc(3)-qp(3)*vc(4)
c
      hvs(1) = dg*(2d0*qpv+qvv)*sc(1)
c
      return
      end
