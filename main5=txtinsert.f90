!Fortran uses the unit number to access the file with later read and write statements. Several files can be open at once, but each must have a different number. There is one thing to remember about numbering a file - you cannot use the number 6, as GNU Fortran reserves that number to refer to the screen.
program read
	implicit none
	INTEGER :: options
	INTEGER :: i
	REAL :: a, b
	REAL :: addanswer, subtractanswer
	REAL :: multiplyanswer, divisionanswer
	real, dimension(100) :: p, q
        real :: pi
  	real :: radius
  	real :: height
  	real :: area
  	real :: volume
	pi = 3.1415927
	! character type string to clear a users screen
	!print *, achar(27)//"[2J"
	!
	print *, " _____         _                     ___ ___ "
	print *, "|   __|___ ___| |_ ___ ___ ___ _____| . |  _|"
	print *, "|   __| . |  _|  _|  _| .'|   |_____|_  |_  |"
	print *, "|__|  |___|_| |_| |_| |__,|_|_|_____|___|___|"                                     
	print *, "-------------------------------------------------|"
	print *, "1  => calculate a basic equation                 |"
	print *, "2 => Get the radius of a cylinder                |"
	print *, "-------------------------------------------------|"
	print *, " Please enter a command below: "
	read(*,*) options
	IF (options == 1) THEN
		print *, ''	 
		print *, '[ | ] Please input the first integer  '
		read(*,*) a
		print *, ''
		print *, '[ | ] Please input the second integer '
		read(*,*) b
		!
		addanswer = a + b
    		subtractanswer = a - b
    		multiplyanswer = a * b
    		divisionanswer = a / b
		! 
		print *, "_________________________________________________________|"
                print *, "|Results : Addition, Subtraction, Multiplication, divsion|"
       	        print *, "------------------------------------------------------------------------"
    		write(*,*) a, " + ", b, " = ", addAnswer
    		write(*,*) a, " - ", b, " = ", subtractanswer
    		write(*,*) a, " * ", b, " = ", multiplyanswer
    		write(*,*) a, " / ", b, " = ", divisionanswer
		open(unit = 2, file = "output.txt")
       		!the files unit is = to 2 so i would need to make the write unit the same as 2
		print *, ''//achar(27)//'[31m '//achar(27)//'[0m'
		write(2, *) a, " + ", b, " = ", addAnswer
		write(2, *) a, " - ", b, " = ", subtractanswer
		write(2, *) a, " * ", b, " = ", multiplyanswer
       	        write(2, *) a, " / ", b, " = ", divisionanswer
		print *, "------------------------------------------------------------------------"
		close(2)
		PRINT*, "[ | ] Data written to a file |output.txt|  [ | ] "
	ELSE IF (options == 2) THEN
		print *, ''
                print *, '[ | ] Enter cylinder base radius:'
                read(*,*) radius
		print *, ''
                print *, '[ | ] Enter cylinder height:'
                read(*,*) height
                area = pi * radius**2.0
                volume = area * height
		print *, ''
		print *, ''
		print *, ''
		print *, '_______________________________________'
                print *, '[ = ] Cylinder radius      => ', radius
	        print *, '[ = ] Cylinder height      => ', height
                print *, '[ = ] Cylinder base area   => ', area
  		print *, '[ = ] Cylinder volume      =>  ', volume	
	END IF
end program read
