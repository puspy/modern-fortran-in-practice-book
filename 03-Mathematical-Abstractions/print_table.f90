program print_table

    use automatic_differentiation
    
    implicit none
    
    type(autoderiv) :: x, y
    
    integer         :: i, ufile
    
    open(newunit=ufile, file="result.csv", status='NEW')
    
    do i=0,10
        x%v = 0.1 * i
        x%dv = 1.0
        y = f(x)
        write(ufile,'(E10.4,A,E10.4,A,E10.4)') x%v,';',y%v,';', y%dv
    enddo
    
    close(ufile)
    
    contains
    
    function f(x) result(z)
        type(autoderiv), intent(in) :: x
        type(autoderiv)             :: z   
        z = ( x / (1.0-x**2.0)**2.0 ) - ((exp((-1.0)*x))/(1.0 + (cos(x))**2.0))
    end function
    
end program
