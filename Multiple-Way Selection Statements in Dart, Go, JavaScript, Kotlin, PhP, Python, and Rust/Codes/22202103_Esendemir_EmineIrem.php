<?php

function test() {
    return 2;
}
echo "1. What is the form and type of the control expression?\n";
echo "1.1 Forms of control expression:\n";

// variable
$x = 2;
switch ($x) {
    case 1:
        echo "x is 1\n";
        break;
    case 2:
        echo "x is 2\n";
        break;
    default:
        echo "default case executed\n";
}

$y = 3;
switch ($x + $y) {
    case 4:
        echo "x + y is 4\n";
        break;
    case 5:
        echo "x + y is 5\n";
        break;
    default:
        echo "default case executed\n";
}

// literal
switch ("hello") {
    case "hi":
        echo "The string is 'hi'\n";
        break;
    case "hello":
        echo "The string is 'hello'\n";
        break;
    default:
        echo "default case executed\n";
}

// function call 
switch (test()) {
    case 1:
        echo "func returned 1\n";
        break;
    case 2:
        echo "func returned 2\n";
        break;
    default:
        echo "default case executed\n";
    }

echo "1.2 Types of control expression:\n";

// int
$intValue = 3;
switch ($intValue) {
    case 1:
        echo "intValue is 1\n";
        break;
    case 3:
        echo "intValue is 3\n";
        break;
}

// string
$strValue = "kemal";
switch ($strValue) {
    case "mustafa":
        echo "strValue is mustafa\n";
        break;
    case "kemal":
        echo "strValue is kemal\n";
        break;
    default:
        echo "default case executed\n";
}

// boolean
$boolValue = true;
switch ($boolValue) {
    case true:
        echo "boolValue is true\n";
        break;
    case false:
        echo "boolValue is false\n";
        break;
}

// float
$floatValue = 1.5;
switch ($floatValue) {
    case 1.0:
        echo "floatValue is 1.0\n";
        break;
    case 1.5:
        echo "floatValue is 1.5\n";
        break;
    default:
        echo "floatValue is neither 1.0 nor 1.5\n";
}

$arrayValue = [1, 2, 3];
switch ($arrayValue) { 
    case [1, 2]:
        echo "arrayValue is[1, 2]\n";
        break;
    case [1, 2, 3]:
        echo "arrayValue is [1, 2, 3]\n";
        break;
    default:    
        echo "no match\n";
}

echo "\n\n2. How are the selectable segments specified?\n";
$value = 1;
switch ($value) {
    case 1:
        echo "case 1 \n";
        $localVar = "inside case 1";
        echo "Local variable: $localVar\n";
        $value += 10;
        echo "Value after modification: $value\n";
        break;
        
    case 2:
        echo "case 2 \n";
        break;
        
    default:
        echo "default case executed\n";
}

echo "\n\n3. Is execution flow through the structure restricted to include just a single selectable segment?\n";

echo "3.1 Using break: \n";
$testValue = 1;
switch ($testValue) {
    case 1:
        echo "testValue is 1\n";
        $testValue = 2;
        break; 
    case 2:  
        echo "testValue is 2\n";
        break;
    case 3:
        echo "testValue is 3\n";
        break;
}

echo "3.2 Without using break :\n";
$testValue = 1;
switch ($testValue) {
    case 1:
        echo "testValue is 1\n";
    case 2:  
        echo "continues to case 2\n";
    case 3:
        echo "continues to case 3\n";
        break;
    case 4:
        echo "not reached\n";
        break;
}

echo "\n\n4. How are case values specified?\n";

// literal
$name = "kemal";
switch ("kemal") {
    case "mustafa":
        echo "name is mustafa\n";
        break;
    case "kemal":
        echo "name is kemal\n";
        break;
    default:
        echo "default case executed\n";
}

// variable
switch ("kemal") {
    case "mustafa":
        echo "name is mustafa\n";
        break;
    case $name:
        echo "name is kemal\n";
        break;
    default:
        echo "default case executed\n";
}

// expression
$num = 5;
$num1 = 3;
$num2 = 2;
switch ($num) {
    case $num1 + $num2:
        echo "num is equal to num1 + num2\n";
        break;
    case $num1 * $num2:
        echo "num is equal to num1 * num2\n";
        break;
    default:
        echo "default case executed\n";
}

// multiple cases sharing the same code block
$number = 1;
switch ($number) {
    case 2:
    case 1:
        echo "number is either 1 or 2\n";
        break;
    case 3:
        echo "Number is 3\n";
        break;
    default:
        echo "default case executed\n";
}

// different types are allowed in cases
$number = 2;
switch ($number) {
    case 2:
        echo "number is 2\n";
        break;
    case 3:
        echo "number is 3\n";
        break;
    case "irem":
        echo "number is irem\n";
        break;
    default:
        echo "number case executed\n";
}


// loose comparisons 
$value = "2"; // String "2"
switch ($value) {
    case 2:  // int 2
        echo "loose comparison (==) in switch statements\n";
        break;
    default:
        echo "not reached\n";
}

echo "\n\n5. What is done about unrepresented expression values?\n";

echo "5.1 Using default case:\n";
$number = 4;
switch ($number) {
    case 1:
        echo "number is 1\n";
        break;
    case 2:
        echo "number is 2\n";
        break;
    case 3:
        echo "number is 3\n";
        break;
    default:
        echo "default case executed\n";
}

echo "5.2 No default case provided:\n";
switch ($number) {
    case 1:
        echo "number is 1\n";
        break;
    case 2:
        echo "number is 2\n";
        break;
    case 3:
        echo "number is 3\n";
        break;
}
?>