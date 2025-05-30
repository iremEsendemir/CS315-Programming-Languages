package main

import "fmt"

func main() {
	fmt.Println("1. What types are legal for subscripts?")
    arr := [5]int{1, 2, 3, 4, 5}

	// integer subscript
    fmt.Println(arr[2]) // Outputs: 3

	// integer variable subscript
	i := 3
	fmt.Println(arr[i]) // Outputs: 4

	// float and string subscripts are not allowed
	// fmt.Println(arr[2.5]) // Error: 2.5 (untyped float constant) truncated to int, floats are not allowed as subscripts
	// fmt.Println(arr["2"]) // Error: cannot convert "2" (untyped string constant) to type int, strings are not allowed as subscripts


	fmt.Println("2. Are subscripting expressions in element references range checked?")
	// index out of bounds and negative index checking
	// fmt.Println(arr[5]) // Error: invalid argument: index 5 out of bounds [0:5]
	// fmt.Println(arr[-1]) // Error: invalid argument: index -1 (constant of type int) must not be negative


	fmt.Println("3. Are ragged multidimensional arrays allowed?")
	raggedArray := [3][]int{{1, 2, 3},{4, 5, 6, 7},{8, 9},}
	fmt.Println(raggedArray) // Outputs: [[1 2 3] [4 5 6 7] [8 9]]


	fmt.Println("4. Can array objects be initialized?")
	// implicit initialization
	var arr2 [5]int 
	fmt.Println(arr2) // Outputs: [0 0 0 0 0]

	// explicit initialization
	arr3 := [6]int{1, 2, 3, 4, 5, 6} 
	fmt.Println(arr3) // Outputs: [1 2 3 4 5 6]


	fmt.Println("5. Are any kind of slices supported?")
    arr4 := [5]int{1, 2, 3, 4, 5}
	fmt.Println(arr4) // Outputs: [1 2 3 4 5]
	fmt.Println(arr4[2:4]) // Outputs: [3 4]
	fmt.Println(arr4[2:]) // Outputs: [3 4 5]
	fmt.Println(arr4[:4]) // Outputs: [1 2 3 4]
	fmt.Println(arr4[:]) // Outputs: [1 2 3 4 5]
	fmt.Println(arr4[2:4:4]) // Outputs: [3 4]
	fmt.Println(arr4[0:3:4]) // Outputs: [1 2 3]


	fmt.Println("6. Which operators are provided?")
	fmt.Println(arr[2]) // Outputs: 3, indexing operator
	// comparison
	arr5 := [5]int{1, 2, 3, 4, 5}
	arr6 := [5]int{1, 2, 3, 4, 6}
	arr7 := [5]int{1, 2, 3, 4, 5}
	// fmt.Println(arr5 == arr3) // Error: invalid operation: arr == arr3 (mismatched types [5]int and [6]int)
	fmt.Println(arr5 == arr7) // Outputs: true
	fmt.Println(arr5 == arr6) // Outputs: false
	fmt.Println(arr5 != arr6) // Outputs: true
	// fmt.Println(arr5 < arr6) // Error: invalid operation: arr5 < arr6 (operator < not defined on array)
	// fmt.Println(arr5 > arr6) // Error: invalid operation: arr5 > arr6 (operator > not defined on array)
	// fmt.Println(arr + arr5) // Error: invalid operation: operator + not defined on arr (variable of type [5]int)
}
