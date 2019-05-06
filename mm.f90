		program example_blas
		implicit none
		integer,parameter :: m=3, k=2, n=5
		real :: a(m,k) = reshape((/1.3,3.6,3.05,2.5,-2.0,-0.03/),(/m,k/))
		real :: b(k,n) = reshape((/2.0,12.4,-0.2,2.7,3.4,-7.1,38.9,1.2,23.9,2.4/),(/k,n/))
		real :: c(m,n) = 0.0, c_blas(m,n) = 0.0, alpha, beta
		integer :: i, j, ii, lda, ldb, ldc
		
		do i = 1, m
		do j = 1, n
		 do ii = 1, k
		 c(i,j) = c(i,j) + a(i,ii)*b(ii,j)
		 end do
		end do
		end do
		write(*,*) 'Hand crafted:', (c(i,i), i=1,min(m,n))
		
		alpha = 1.0
		beta = 0.0
		lda = m
		ldb = k
		ldc = m
		call sgemm('N','N',m,n,k,alpha,a,lda,b,ldb,beta,c_blas,ldc)
		write(*,*) 'BLAS sgemm: ', (c_blas(i,i), i=1,min(m,n))
		
		write(*,*) 'Max error:', maxval(abs(c-c_blas))
		end program
