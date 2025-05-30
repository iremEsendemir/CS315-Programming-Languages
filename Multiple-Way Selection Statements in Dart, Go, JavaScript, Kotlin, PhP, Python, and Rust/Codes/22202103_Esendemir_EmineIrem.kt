enum class EnumExample {
    A, B, C
}

fun main() {
    fun test(): Int {
        return 2
    }

    println("1. What is the form and type of the control expression?")
    println("1.1 Forms of control expression:")

    // variable
    val x = 2
    when (x) {
        1 -> println("x is 1")
        2 -> println("x is 2")
        else -> println("default case executed")
    }

    // arithmetic expression
    val y = 3
    when (x + y) {
        4 -> println("x + y is 4")
        5 -> println("x + y is 5")
        else -> println("default case executed")
    }

    // literal
    when ("hello") {
        "hi" -> println("The string is 'hi'")
        "hello" -> println("The string is 'hello'")
        else -> println("default case executed")
    }

    // function call
    when (test()) {
        1 -> println("func returned 1")
        2 -> println("func returned 2")
        else -> println("default case executed")
    }

    println("1.2 Types of control expression:")

    // int
    val intValue = 3
    when (intValue) {
        1 -> println("intValue is 1")
        3 -> println("intValue is 3")
        else -> println("default case executed")
    }

    // string
    val strValue = "kemal"
    when (strValue) {
        "mustafa" -> println("strValue is mustafa")
        "kemal" -> println("strValue is kemal")
        else -> println("default case executed")
    }

    // boolean
    val boolValue = true
    when (boolValue) {
        true -> println("boolValue is true")
        false -> println("boolValue is false")
    }

    // float
    val floatValue = 1.5
    when (floatValue) {
        1.0 -> println("floatValue is 1.0")
        1.5 -> println("floatValue is 1.5")
        else -> println("floatValue is neither 1.0 nor 1.5")
    }

    val listValue = listOf(1, 2, 3)
    when (listValue) {
        listOf(1, 2) -> println("listValue is [1, 2]")
        listOf(1, 2, 3) -> println("listValue is [1, 2, 3]")
        else -> println("no match")
    }

    // no argyment
    val age = 85
    when {
        age < 18 -> println("You are young")
        age in 18..65 -> println("You are an adult")
        age > 65 -> println("You are old")
        else -> println("Invalid age")
    }


    val enumValue = EnumExample.A
    when (enumValue) {
        EnumExample.A -> println("Enum value is A")
        EnumExample.B -> println("Enum value is B")
        EnumExample.C -> println("Enum value is C")
    }

    println("\n\n2. How are the selectable segments specified?")
    var value = 1
    when (value) {
        1 -> {
            println("case 1")
            val localVar = "inside case 1"
            println("Local variable: $localVar")
            value += 10
            println("Value after modification: $value")
        }
        2 -> {
            println("case 2")
        }
        else -> {
            println("default case executed")
        }
    }

    println("\n\n3. Is execution flow through the structure restricted to include just a single selectable segment?")

    var testValue = 1
    when (testValue) {
        1 -> {
            println("testValue is 1")
            testValue = 2 //  won't execute to the 2 branch
        }
        2 -> {
            println("testValue is 2")
        }
        3 -> {
            println("testValue is 3")
        }
        else -> {
            println("default case executed")
        }
    }
    testValue = 1 
    when (testValue) {
        1 -> {
            println("testValue is 1")
        }
        1 -> { //  warning: duplicate branch condition in 'when'.
            println("testValue is 1 again")
        }
        else -> {
            println("default case executed")
        }
    }

    println("\n\n4. How case values are specified?");
    // literal
    val name = "kemal"
    when ("kemal") {
        "mustafa" -> println("name is mustafa")
        "kemal" -> println("name is kemal")
        else -> println("default case executed")
    }

    // variable
    when ("kemal") {
        "mustafa" -> println("name is mustafa")
        name -> println("name is kemal")
        else -> println("default case executed")
    }

    // expression
    val num = 5
    val num1 = 3
    val num2 = 2
    when (num) {
        num1 + num2 -> println("num is equal to num1 + num2")
        num1 * num2 -> println("num is equal to num1 * num2")
        else -> println("default case executed")
    }

    // multiple values in a single case
    val number = 1
    when (number) {
        1, 2 -> println("number is either 1 or 2")
        3 -> println("number is 3")
        else -> println("default case executed")
    }

    // using ranges
    val rangeNumber = 7
    when (rangeNumber) {
        in 1..5 -> println("rangeNumber is between 1 and 5")
        in 6..10 -> println("rangeNumber is between 6 and 10")
        else -> println("rangeNumber is outside these ranges")
    }

    // smart casting after type check ???????
    val anyValue2: Any = "mustafa kemal ataturk"
    when (anyValue2) {
        is String -> println("String length: ${anyValue2.length}") 
        is Int -> println("Integer value: ${anyValue2 + 1}") 
        else -> println("Unknown type")
    }

    /*val intexample = 5
    when (intexample) {
        "irem" -> println("intexample is irem")
        5 -> println("intexample is 5")
        else -> println("default case executed")
    } error: incompatible types 'Int' and 'String'.*/

    println("\n\n5. What is done about unrepresented expression values?")

    println("5.1 Using else branch:")
    val unrepresented = 4
    when (unrepresented) {
        1 -> println("number is 1")
        2 -> println("number is 2")
        3 -> println("number is 3")
        else -> println("default case executed")
    }

    println("5.2 No else branch provided:")
    val unrepresented2 = 4
    when (unrepresented2) {
        1 -> println("number is 1")
        2 -> println("number is 2")
        3 -> println("number is 3")
    }

    // in an expression, must cover all.
    val enumValue2 = EnumExample.B
    val enumValuePrint = when (enumValue2) {
        EnumExample.A -> "AAAA"
        EnumExample.B -> "BBBB"
        EnumExample.C -> "CCCV"
    }
    //if not included all, gives error:  'when' expression must be exhaustive.
    println("enumValuePrint: $enumValuePrint")
}
