class ComplexNumber

    attr_accessor :real , :imaginary
    @@add=0 
    @@multiply=0
    @@bulkAdd=0
    @@bulkMultiply=0
#############################################################################################################  
    def initialize(real, imaginary)
        @real = real # real
        @imaginary = imaginary # imaginary
    end

    def +(other)
        new_real= @real + other.real
        new_imaginary= @imaginary + other.imaginary
        @@add+=1
        return ComplexNumber.new(new_real,new_imaginary)
    end
#############################################################################################################
    def *(other)
        real = @real * other.real - imaginary * other.imaginary
        imaginary = @imaginary * other.real + @real * other.imaginary
        @@multiply+=1
        return ComplexNumber.new(real,imaginary)
    end
#############################################################################################################
    def self.bulk_add(cns)
       totalSum=ComplexNumber.new(0,0)
      cns.each do |comp|
        totalSum.real+=comp.real
        totalSum.imaginary+= comp.imaginary
        # another method to add
        # totalSum=totalSum+comp
      end 
      @@bulkAdd+=1
      totalSum
    end
#############################################################################################################
    def self.bulk_multiply(cns)
        totalMultiply=ComplexNumber.new(1,0)
        cns.each do |comp|
            real = totalMultiply.real * comp.real - totalMultiply.imaginary * comp.imaginary
            totalMultiply.imaginary = totalMultiply.imaginary * comp.real + totalMultiply.real * comp.imaginary
            totalMultiply.real=real
            # another method to get total multiply 
            # totalMultiply=totalMultiply*comp
      end
      @@bulkMultiply+=1
      totalMultiply
  end
#############################################################################################################
  def self.get_state
    puts "you used + function for #{@@add}"
    puts "you used * function for #{@@multiply}"
    puts "you used bulk_add function for #{@@bulkAdd}"
    puts "you used bulk_multiply function for #{@@bulkMultiply}"
  end

end
#############################################################################################################

cp1=ComplexNumber.new(1,2)
cp2=ComplexNumber.new(4,8)
cp3=ComplexNumber.new(5,5)


total=cp1+cp2
puts "#{total.real} + #{total.imaginary}i"
total=cp2+cp1

multi=cp1*cp2
puts "#{multi.real} + #{multi.imaginary}i"

totalMult=ComplexNumber.bulk_multiply([cp1,cp2])
puts "#{totalMult.real} + #{totalMult.imaginary}i"

totalComplex=ComplexNumber.bulk_add([cp1,cp2,cp3])
puts "#{totalComplex.real} + #{totalComplex.imaginary}i"

ComplexNumber.get_state





