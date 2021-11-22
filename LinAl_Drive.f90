program LinAl_Driver
   use LinAl, only: readMat
   implicit none

   !DeclareStringsforFileNamesandFunctions
   character(len=99)::Amatfile,Bmatfile

   !DeclareIntegersandRealMatrices
   integer::i,j,k,A_msize,A_nsize,B_msize,B_nsize
   integer,dimension(:,:),allocatable::A_mat,B_mat
   real,dimension(:),allocatable::norm_err

   !GettheMatrices
   Amatfile="Amat.dat"
   Bmatfile="Bmat.dat"
   call readMat(Amatfile)
   call readMat(Bmatfile)
end program LinAl_Driver
