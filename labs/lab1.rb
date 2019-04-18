class MyComplex
    @@stats = 0;

    def initialize(real, img)
        @real  =  real
        @img   =  img
        # puts "Object_Created"
    end

    # ............................................
    def real
        @real
    end

    
    def img
        @img
    end
        
    def stats
        @@stats
    end

    def real=(real) #setter method
        @real = real
    end

    def img=(img) #setter method
        @img = img
    end

    # .............................................
    def +(other)
        result = MyComplex.new(@real + other.real, @img + other.img)
        @@stats += 1
        return result;
    end
  
    def *(other)
        result = MyComplex.new((@real * other.real - @img * other.img ) , (@real * other.img  + @img * other.real) )
        # result.real = (@real * other.real -(@img * other.img))
        # result.img  = (@real * other.img  + @img * other.real)
        @@stats += 1
        return result;
    end

    # ....................................................
    def bulk_add (complex_arr)
        complex_counter = MyComplex.new(0,0)
        complex_arr.each { |c| 
            complex_counter = complex_counter + c 
            @@stats += 1
        }        
        return complex_counter
    end

    def bulk_mul (complex_arr)
        complex_counter = MyComplex.new(1,1)
        complex_arr.each { |c| 
            complex_counter = complex_counter * c 
            @@stats += 1
        }        
        return complex_counter
    end


    def to_complex
        "#{@real},#{@img}i"
    end
end




c1  = MyComplex.new(-2,3)
c2  = MyComplex.new(7,-1)
c3  = MyComplex.new(10,4)
c4  = MyComplex.new(6,-7)
c5  = MyComplex.new(-1,8)
c6  = MyComplex.new(-5,3)
c7  = MyComplex.new(1,-3)
c8  = MyComplex.new(5,6)
c9  = MyComplex.new(4,-7)
c10 = MyComplex.new(-2,9)

c_arr = [c3,c4,c5,c6,c7,c8,c9,c10];


puts "The Sum Of Two Complex is #{(c1+c2).to_complex}\n"
puts "The Multiply Of Two Complex is #{(c1*c2).to_complex}\n"
puts "The Sum Of many Complex is #{c1.bulk_add(c_arr).to_complex}\n"
puts "The Multiply Of many Complex is #{c1.bulk_mul(c_arr).to_complex}\n"
puts "Number Of Operations is #{c1.stats}\n"
