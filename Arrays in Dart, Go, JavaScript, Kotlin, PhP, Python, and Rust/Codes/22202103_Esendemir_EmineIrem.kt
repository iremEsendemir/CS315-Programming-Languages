fun main() {

    println("1. What types are legal for subscripts?")
    val arr1 = arrayOf(1, 2, 3, 4, 5)
    println(arr1[2])  // Outputs: 3
    val index = 3
    println(arr1[index])  // Outputs: 4
    // println(arr1["1"])  // Error: The integer index expected, not String
    // println(arr1[2.5])  // Error: The index must be Int, not Double


    println("\n2. Are subscripting expressions in element references range checked?")
    // println(arr1[5])  // Error: ArrayIndexOutOfBoundsException: 5
    // println(arr1[-1])  // Error: ArrayIndexOutOfBoundsException: -1

    println("\n3. Are ragged multidimensional arrays allowed?")
    val arr2 = arrayOf(
        arrayOf(1, 2, 3),
        arrayOf(4, 5),
        arrayOf(6, 7, 8, 9)
    )
    // print ragged array
    println("Ragged array:")
    for (i in arr2.indices) {
        for (j in arr2[i].indices) {
            print("${arr2[i][j]} ")
        }
        println()
    }

    println("\n4. Can array objects be initialized?");
    // mixed type
    val arr3 = arrayOf(1, "two", 3.0)
    println(arr3.joinToString())  // Outputs: 1, two, 3.0
    // intArray example
    // If you use the Array class with primitive values, these values are boxed into objects. As an alternative, you can use primitive-type arrays, which allow you to store primitives in an array without the side effect of boxing overhead:
    val intArray = intArrayOf(1, 2, 3, 4, 5)
    println(intArray.joinToString())  // Outputs: 1, 2, 3, 4, 5
    // empty array
    val arr5 = arrayOfNulls<Int>(5)
    println(arr5.joinToString())  // Outputs: null, null, null, null, null
    // print array
    val initArray = Array<Int>(3) { 0 }
    println(initArray.joinToString())  // Outputs: 0, 0, 0
    val asc = Array(5) { i -> (i * i)}
    println(asc.joinToString())  // Outputs: 0, 1, 4, 9, 16



    println("\n5. Are any kind of slices supported?")
    val arr4 = arrayOf(1, 2, 3, 4, 5)
    // slice array
    val slice = arr4.slice(1..3)
    println("Slice of arr4: ${slice.joinToString()}")  // Outputs: 2, 3, 4
    println("Type of slice: ${slice::class.simpleName}")  // Outputs: ArrayList
    // copyRange array
    val copyRange = arr4.copyOfRange(1, 4)
    println("Copy range of arr4: ${copyRange.joinToString()}")  // Outputs: 2, 3, 4
    println("Type of copyRange: ${copyRange::class.simpleName}")  // Outputs: Array
    // drop array
    val drop = arr4.drop(2)
    println("Drop of arr4: ${drop.joinToString()}")  // Outputs: 3, 4, 5
    println("Type of drop: ${drop::class.simpleName}")  // Outputs: ArrayList
    // take array
    val take = arr4.take(3)
    println("Take of arr4: ${take.joinToString()}")  // Outputs: 1, 2, 3
    println("Type of take: ${take::class.simpleName}")  // Outputs: ArrayList
    // filteredIndexed()
    val filteredIndexed = arr4.filterIndexed { index, value -> index % 2 == 0 }
    println("Filtered indexed of arr4: ${filteredIndexed.joinToString()}")  // Outputs: 1, 3, 5
    println("Type of filteredIndexed: ${filteredIndexed::class.simpleName}")  // Outputs: ArrayList




    println("\n\n6. Which operators are provided?");
    // += operator
    var arr6 = arrayOf(1, 2, 3)
    val arr7 = arrayOf(1, 2, 3)
    val arr8 = arr6
    println("arr6: ${arr6.joinToString()}")  // Outputs: 1, 2, 3
    println("arr7: ${arr7.joinToString()}")  // Outputs: 1, 2, 3
    println("arr8: ${arr8.joinToString()}")  // Outputs: 1, 2, 3

    // == operator
    println("arr6 == arr7: ${arr6 == arr7}")  // Outputs: false
    println("arr6 == arr8: ${arr6 == arr8}")  // Outputs: true
    // === operator
    println("arr6 === arr7: ${arr6 === arr7}")  // Outputs: false
    println("arr6 === arr8: ${arr6 === arr8}")  // Outputs: true
    // contentEquals 
    println("arr6 contentEquals arr7: ${arr6 contentEquals arr7}")  // Outputs: true
    println("arr6 contentEquals arr8: ${arr6 contentEquals arr8}")  // Outputs: true
    // in operator
    println("Does arr6 contain 2? ${2 in arr6}")  // Outputs: true
    println("Does arr6 not contain 4? ${4 !in arr6}")  // Outputs: true

    //concatinate
    arr6 += 4
    println("arr6 after += operator: ${arr6.joinToString()}")  // Outputs: 1, 2, 3, 4
    arr6 += arrayOf(5, 6, 7)
    println("arr6 after += operator: ${arr6.joinToString()}")  // Outputs: 1, 2, 3, 4, 5, 6, 7
    val arr9 = arr6 + arr7
    println("arr9 = arr6 + arr7: ${arr9.joinToString()}")  // Outputs: 1, 2, 3, 4, 5, 6, 7, 1, 2, 3
    
    


    














    /*
     add to 6. part
    var riversArray = arrayOf("Nile", "Amazon", "Yangtze")

// Using the += assignment operation creates a new riversArray,
// copies over the original elements and adds "Mississippi"
riversArray += "Mississippi"
println(riversArray.joinToString())
// Nile, Amazon, Yangtze, Mississippi
    
    
    */


    /*
    
    Also to 6. part from documentation
    val simpleArray = arrayOf(1, 2, 3)
val anotherArray = arrayOf(1, 2, 3)

// Compares contents of arrays
println(simpleArray.contentEquals(anotherArray))
// true

// Using infix notation, compares contents of arrays after an element 
// is changed
simpleArray[0] = 10
println(simpleArray contentEquals anotherArray)
// false
Don't use equality (==) and inequality (!=) operators to compare the contents of arrays. These operators check whether the assigned variables point to the same object.
    
    */
}