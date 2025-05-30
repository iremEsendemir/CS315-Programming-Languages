package main

import "fmt"

func test() int {
	return 2
}
type TestObject struct {
	Name string
}

func main() {
	fmt.Println("1. What is the form and type of the control expression?")
	fmt.Println("\n1.1 Forms of control expression:")

	// variable 
	x := 2
	switch x {
	case 1:
		fmt.Println("x is 1")
	case 2:
		fmt.Println("x is 2")
	default:
		fmt.Println("not found")
	}

	y := 3
	switch x + y {
	case 4:
		fmt.Println("x + y is 4")
	case 5:
		fmt.Println("x + y is 5")
	default:
		fmt.Println("not found")
	}

	// Literals
	switch "a" {
	case "b":
		fmt.Println("The string is 'b'")
	case "a":
		fmt.Println("The string is 'a'")
	default:
		fmt.Println("not found")
	}

	// function call
	switch test() {
	case 1:
		fmt.Println("func returned 1")
	case 2:
		fmt.Println("func returned 2")
	default:
		fmt.Println("not found")
	}

	fmt.Println("\n1.2 Types of control expression:")
	// integer type
	intValue := 3
	switch intValue {
	case 1:
		fmt.Println("intValue is 1")
	case 3:
		fmt.Println("intValue is 3")
	}

	// string type
	strValue := "a"
	switch strValue {
	case "a":
		fmt.Println("strValue is 'a'")
	case "b":
		fmt.Println("strValue is 'b'")
	}

	// boolean type
	boolValue := true
	switch boolValue {
	case true:
		fmt.Println("it is true")
	case false:
		fmt.Println("it is false")
	}

	// struct type
	person1 := TestObject{Name: "Emine"}
	person2 := TestObject{Name: "İrem"}

	switch person1 {
	case person2:
		fmt.Println("Matched person2")
	case TestObject{Name: "Emine"}:
		fmt.Println("Matched Emine")
	default:
		fmt.Println("not found")
	}

	// tagless switch 
	x = 1
	switch {
	case x < 0:
		fmt.Println("x is negative")
	case x == 0:
		fmt.Println("x is zero")
	case x > 0:
		fmt.Println("x is positive")
	}

	// type switch
	var typeSwitch1 interface{} = "a"
	switch typeSwitch1.(type) {
	case int:
		fmt.Println("typeSwitch1 is int")
	case string:
		fmt.Println("typeSwitch1 is string")
	case bool:
		fmt.Println("typeSwitch1 is bool")
	case TestObject:
		fmt.Println("typeSwitch1 is TestObject")
	default:
		fmt.Println("typeSwitch1 is an unknown type")
	}

	fmt.Println("\n\n2. How are the selectable segments specified?")

	value := 2
	switch value {
	case 1:
		fmt.Println("1 is executed")
		value *= 2
		fmt.Println("Value doubled:", value)
	case 2, 3, 4: 
		fmt.Println("2, 3 or 4 is executed")
		local := "inside case 1"
		fmt.Println("Local variable:", local)
		fmt.Println("Function result:", test())
		value += 10
		fmt.Println("Value after modification:", value)
	default:
		fmt.Println("Default case")
	}

	fmt.Println("\n\n 3. Is execution flow through the structure restricted to include just a single selectable segment?")
	fmt.Println("3.1 no fallthrough):")
	testValue := 1
	switch testValue {
	case 1:
		fmt.Println("testValue is 1")
		testValue = 2
	case 2:  
		fmt.Println("testValue is 2")
	/*case 1:
		fmt.Println("Case 1 matched again")
	Error: duplicate case 1 (constant of type int) in expression switch
	*/
	}
	fmt.Println("new testValue:", testValue)

	fmt.Println("3.2 Using fallthrough:")
	testValue = 1
	switch testValue {
	case 1:
		fmt.Println("Case 1 exectuted")
		fallthrough  
	case 2:  
		fmt.Println("Execution continues to case 2")
		fallthrough
	case 3:
		fmt.Println("Execution continues to case 3")
	case 4:
		fmt.Println("This won't execute")
	}
	fmt.Println("testValue after fallthrough switch:", testValue)

	fmt.Println("\n4. How are the case values specified?")

	// literal
	name := "irem"
	switch name {
	case "emine":
		fmt.Println("name is emine")
	case "irem":
		fmt.Println("name is irem")
	}

	/*wrongtype := "irem"
	switch wrongtype {
	case 1:
		fmt.Println("wrongtype is 1")
	default:
		fmt.Println("wrongtype is not 1")
	}
	// Error: cannot convert 1 (untyped int constant) to type string
	*/

	// variable
	trialCase := "irem"
	switch name {
	case trialCase: 
		fmt.Println("trialCase is same as name")
	case "irem":
		fmt.Println("name is irem")
	}

	// expression
	num := 5
	num1 := 3
	num2 := 2
	switch num {
	case num1 + num2:  
		fmt.Println("num is equal to num1 + num2")
	case 10 - 2:
		fmt.Println("num is equal to 10 - 2")
	}

	// multiple values
	multipleValueNum := 1
	multipleValueNum1 := 1
	multipleValueNum2 := 2
	multipleValueNum3 := 3
	switch multipleValueNum {
	case multipleValueNum1, multipleValueNum2:
		fmt.Println("the number is one of these two")
	case multipleValueNum3:
		fmt.Println("the number is 3")
	}

	// tagless switch
	taglessValue := 1
	switch {
	case taglessValue < 0:
		fmt.Println("taglessValue is negative")
	case taglessValue == 0:
		fmt.Println("taglessValue is zero")
	case taglessValue > 0:
		fmt.Println("taglessValue is positive")
	}

	// type switch
	var i interface{} = "irem"
	switch i.(type) {
	case int:
		fmt.Println("i is of type int")
	case string:
		fmt.Println("i is of type string")
	case bool:
		fmt.Println("i is of type bool")
	case TestObject:
		fmt.Println("i is of type TestObject")
	default:
		fmt.Println("i is of an unknown type")
	}
	fmt.Println("\n5.What is done about unrepresented expression values?");
	fmt.Println("5.1 Using default case:")
	defaultInt := 3
	switch defaultInt {
	case 1:
		fmt.Println("defaultInt is 1")
	case 2:
		fmt.Println("defaultInt is 2")
	default:
		fmt.Println("defaultInt is not 1 or 2")
	}

	fmt.Println("5.2 No default case provided:")
	switch defaultInt {
	case 1:
		fmt.Println("defaultInt is 1")
	case 2:
		fmt.Println("defaultInt is 2")
	}	
}