module automatic_differentiation
      
    implicit none
    
    type autoderiv
            real :: v
            real :: dv
    end type autoderiv
    
    interface operator(+)
        module procedure :: add_sv
        module procedure :: add_vs
        module procedure :: add_vv
    end interface
    
    interface operator(-)
        module procedure :: rest_sv
        module procedure :: rest_vs
        module procedure :: rest_vv
    end interface

    interface operator(*)
        module procedure :: mult_sv
        module procedure :: mult_vs
        module procedure :: mult_vv
    end interface
    
    interface operator(/)
        module procedure :: div_vv
    end interface
    
    interface operator(**)
        module procedure :: up_vv
    end interface
    
    interface cos
        module procedure :: cos_vv
    end interface
    
    interface sin
        module procedure :: sin_vv
    end interface
    
    interface exp
        module procedure :: exp_vv
    end interface
	
    contains
	
    function add_sv(n, x) result(z)
        real, intent(in)            :: n
        type(autoderiv), intent(in) :: x
        type(autoderiv)             :: z
        z%v = x%v + n
        z%dv = x%dv
    end function
    
    function add_vs(x, n) result(z)
        type(autoderiv), intent(in) :: x
        real, intent(in)            :: n
        type(autoderiv)             :: z
        z%v = x%v + n
        z%dv = x%dv
    end function
    
    function add_vv(x, y) result(z)
        type(autoderiv), intent(in) :: x, y
        type(autoderiv)             :: z
        z%v = x%v + y%v
        z%dv = x%dv + y%dv
    end function
    
     function rest_sv(n, x) result(z)
        real, intent(in)            :: n
        type(autoderiv), intent(in) :: x
        type(autoderiv)             :: z
        z%v = x%v - n
        z%dv = x%dv
    end function
    
    function rest_vs(x, n) result(z)
        type(autoderiv), intent(in) :: x
        real, intent(in)            :: n
        type(autoderiv)             :: z
        z%v = x%v - n
        z%dv = x%dv
    end function
    
    function rest_vv(x, y) result(z)
        type(autoderiv), intent(in) :: x, y
        type(autoderiv)             :: z
        z%v = x%v - y%v
        z%dv = x%dv - y%dv
    end function   
    
    function mult_sv(n, x) result(z)
        real, intent(in)            :: n
        type(autoderiv), intent(in) :: x
        type(autoderiv)             :: z
        z%v = n * x%v
        z%dv = n * x%dv
    end function

    function mult_vs(x, n) result(z)
        type(autoderiv), intent(in) :: x
        real, intent(in)            :: n
        type(autoderiv)             :: z
        z%v = n * x%v
        z%dv = n * x%dv
    end function
    
    function mult_vv(x, y) result(z)
        type(autoderiv), intent(in) :: x, y
        type(autoderiv)             :: z
        z%v = x%v * y%v
        z%dv = x%dv * y%v + x%v * y%dv
    end function
 
    function div_vv(x,y) result(z)
        type(autoderiv), intent(in) :: x, y
        type(autoderiv)             :: z
        z%v = 0.0d0
        z%dv = 0.0d0
        if ( y%v == 0.0d0 ) return
        z%v = x%v / y%v
        z%dv = (x%dv * y%v - x%v * y%dv) / (y%v)**2.0
    end function
    
    function up_vv(x,n) result(z)
        type(autoderiv), intent(in) :: x
        real, intent(in)            :: n
        type(autoderiv)             :: z
        z%v = x%v**n
        z%dv = n*x%v**(n-1.0) * x%dv
    end function
    
    function cos_vv(x) result(z)
        type(autoderiv), intent(in) :: x
        type(autoderiv)             :: z
        z%v = cos(x%v)
        z%dv = -sin(x%v) * x%dv
    end function
    
    function sin_vv(x) result(z)
        type(autoderiv), intent(in) :: x
        type(autoderiv)             :: z
        z%v = sin(x%v)
        z%dv = cos(x%v) * x%dv
    end function
    
    function exp_vv(x) result(z)
        type(autoderiv), intent(in) :: x
        type(autoderiv)             :: z
        z%v = exp(x%v)
        z%dv = z%v * x%dv
    end function
    
end module
