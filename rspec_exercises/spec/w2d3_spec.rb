require 'w2d3'


RSpec.describe Array do 

    describe "#my_uniq" do
        context "there is an empty array" do
           it "returns an empty array" do
                expect([].my_uniq).to be_empty
           end 
        end

        context "there are duplicates in the array" do
            it "returns an array of unique elements" do
                array1 = [7, 4, 6, 3, 5, 4, 8, 7, 3, 1]
                array2 = [6, 5, 4, 8, 7, 7, 3, 1, 7]
                expect(array1.my_uniq).to eq(array1.uniq)
                expect(array2.my_uniq).to eq(array2.uniq)
            end
        end

        context "there are no duplicates in the array" do
            it "returns the original array" do
                array3 = [1,2,3,4,5,6,7]
                expect(array3.my_uniq).to eq(array3.uniq)
            end
        end

        context "they are all the same number" do
            it "returns an array of one element" do
                array4 = [4,4,4,4,4,4,4,4,4]
                expect(array4.my_uniq).to eq(array4.uniq)
            end
        end
    end

    describe "#two_sum" do

        context "there is an empty array" do 
            it "returns an empty array" do 
                expect([].two_sum).to be_empty 
            end
        end
       
        context "there are elements that sum to zero" do 
            let (:array){[-3, -2, -1, 0, 1, 2, 3]}
            it "returns an array of arrays" do 
                expect(array.two_sum.first).to be_an(Array)
            end
            it "returns from least first index" do 
                expect(array.two_sum).to eq([[0, 6], [1, 5], [2, 4]])
            end
            it "does not modify original array" do 
                array.two_sum 
                expect(array).to eq(array)
            end
        end
        context "there are duplicate elements that sum to zero" do 
            it "returns second index from least to greatest" do 
                array1 = [-1, 0, 1, 1]
                expect(array1.two_sum).to eq([[0, 2], [0, 3]])
            end
        end
        context "there are no elements that sum to zero" do 
            it "returns an empty array" do 
                array2 = [0, 1, 2, 3, 4]
                expect(array2.two_sum).to be_empty
            end
        end
    end

    describe "#my_transpose" do
        context "given an empty array" do 
            it "returns an empty array" do 
                expect([[]].my_transpose).to eq([[]])
            end
        end
        
        context "given an array of an array with one element" do
            it "returns the original array" do
                expect([[0]].my_transpose).to eq([[0]])
            end
        end

        context "given a 2-d array with multiple elements" do
            let (:array8){[[9, 8, 7],[6, 5, 4],[3, 2, 1]]}
            it "returns an array of transposed arrays" do
                expect(array8.my_transpose).to eq(array8.transpose)
            end

            it "does not call transpose method" do
                expect(array8).not_to receive(:transpose)
                array8.my_transpose 
            end


            it "does not modify the original array" do
                array8.my_transpose
                expect(array8).to eq(array8)
            end
        end
    end
    
    describe "#stock_picker" do 
        context "Given 0 or 1 day" do 
            it "Raises an error" do 
                expect{[1].stock_picker}.to raise_error(ArgumentError)
                expect{[].stock_picker}.to raise_error(ArgumentError)
            end
        end
        context "Given multiple equal high profit days" do
            array = [0, 5, 6, 4, 4, 4, 6]
            it "Returns the earliest pair of profitable days" do
                expect(array.stock_picker).to eq([0,2])
            end
        end
        context "Given no profitable days" do 
            array = [8, 7, 6, 5,4,3,2]
            it "Returns the lowest loss pair" do 
                expect(array.stock_picker).to eq([0,1])
            end
        end
        context "Given 1 set of profitable days" do 
            array = [3, 0, 2, 6, 1, 8, 4, 7]
            it "Returns the highest profit pair" do 
                expect(array.stock_picker).to eq([1, 5])
            end
        end
    end

end