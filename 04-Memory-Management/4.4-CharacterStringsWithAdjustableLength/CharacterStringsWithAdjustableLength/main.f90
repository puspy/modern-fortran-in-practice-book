
program hello

    use readline_utility

    implicit none

    integer :: uf

    logical :: success

    character(len=:), allocatable :: line

    open(newunit=uf, file = "example.txt")

    do
        call readline(uf, line, success)
        if (.not. success) exit
        print *, line
    end do

    close(uf)

end program

