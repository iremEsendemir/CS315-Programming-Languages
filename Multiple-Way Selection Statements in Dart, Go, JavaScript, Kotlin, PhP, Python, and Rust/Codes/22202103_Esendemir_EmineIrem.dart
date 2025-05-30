void main() {
    int test() {
    return 2;
    }

    print("1. What is the form and type of the control expression?");
    print("1.1 Forms of control expression:");

    // variable
    var x = 2;
    switch (x) {
    case 1:
        print("x is 1");
        break;
    case "2":
        print("x is 2");
        break;
    default:
        print("default case executed");
    }

    // arithmetic expression
    var y = 3;
    switch (x + y) {
    case 4:
        print("x + y is 4");
        break;
    case 5:
        print("x + y is 5");
        break;
    default:
        print("default case executed");
    }

    // literal
    switch ("hello") {
    case "hi":
        print("The string is 'hi'");
        break;
    case "hello":
        print("The string is 'hello'");
        break;
    default:
        print("default case executed");
    }

    // function call
    switch (test()) {
    case 1:
        print("func returned 1");
        break;
    case 2:
        print("func returned 2");
        break;
    default:
        print("default case executed");
    }

    print("1.2 Types of control expression:");

    // int
    int intValue = 3;
    switch (intValue) {
    case 1:
        print("intValue is 1");
        break;
    case 3:
        print("intValue is 3");
        break;
    default:
        print("default case executed");
    }

    // string
    String strValue = "kemal";
    switch (strValue) {
    case "mustafa":
        print("strValue is mustafa");
        break;
    case "kemal":
        print("strValue is kemal");
        break;
    default:
        print("default case executed");
    }

    // double
    double doubleValue = 1.5;
    // Dart 3.0+ is needed for this
    switch (doubleValue) {
    case 1.0:
        print("doubleValue is 1.0");
        break;
    case 1.5:
        print("doubleValue is 1.5");
        break;
    default:
        print("default case executed");
    }

    // Enum
    EnumExample enumValue = EnumExample.B;
    switch (enumValue) {
        case EnumExample.A:
        print("Enum value is A");
        break;
        case EnumExample.B:
        print("Enum value is B");
        break;
        case EnumExample.C:
        print("Enum value is C");
        break;
        case EnumExample.D:
        print("Enum value is D");
        break;
    }

  print("\n\n2. How are the selectable segments specified?");
  var value = 1;
  switch (value) {
    case 1:
      print("case 1");
      var localVar = "inside case 1";
      print("Local variable: $localVar");
      value += 10;
      print("Value after modification: $value");
      
    case 2:
      print("case 2");
      break;
      
    default:
      print("default case executed");
  }

  print("Switch expressions: ");
  x = 2;
  y = switch(x) {
    1 => 2,
    2 => 3,
    _ => 4
  };
  print("x = $x, y = $y");

  print("\n\n3. Is execution flow through the structure restricted to include just a single selectable segment?");

  print("3.1 If no statement exist in the case block, execution will fall through to the next case:");
  var testValue = 1;
  switch (testValue) {
    case 1:
    case 2:  
      print("testValue is either 1 or 2");
    case 3:
      print("testValue is 3");
    default:
      print("default case executed");
  }

  print("3.2 Using continue with label:");
  testValue = 1;
  switch (testValue) {
    case 1:
      print("testValue is 1");
      testValue = 2;
      continue case3; 
    case2: 
    case 2:  
      print("continues to case 2");
      continue case3;
    case3:
    case 3:
      print("continues to case 3");
      break;
    case 4:
      print("not reached");
      break;
    default:
      print("default case executed");
  }

  print("3.3 If a statement exist between cases, it will not fall through:");
  testValue = 1;
  switch (testValue) {
    case 1:
      print("testValue is 1");
    case 2:
      print("testValue is 2");
    case 3:
      print("testValue is 3");
    default:
      print("default case executed");
  }

  print("\n\n4. How are case values specified?");

  // literal
  var name = "kemal";
  switch (name) {
    case "mustafa":
      print("name is mustafa");
      break;
    case "kemal":
      print("name is kemal");
      break;
    default:
      print("default case executed");
  }

  // variable
  var varName = "mustafa"; 
  var secondName = "kemal";
  switch (name) {
    /*case varName:
      print("name is mustafa");
      // Error: Not a constant expression.
      break;*/
    case "kemal":
      print("name is kemal");
      break;
    default:
      print("default case executed");
  }

  // using constants
  const firstName = "kemal";
  switch (name) {
    case firstName:  
      print("name matches firstName constant");
      break;
    default:
      print("default case executed");
  }


  // type patterns
  Object obj = [1, 2, 3];

  switch (obj) {
    case int():
      print("obj is an int");
      break;
    case String():
      print("obj is a String");
      break;
    case List():
      print("obj is a List");
      break;
    default:
      print("obj is something else");
  }

  // list 
  var list = [1, 2, 3];
  switch (list) {
    case [1, 2, 3]:
      print("List contains exactly [1, 2, 3]");
      break;
    case [1, ...]:
      print("List starts with 1");
      break;
    case [..., 3]:
      print("List ends with 3");
      break;
    default:
      print("list is something else");
  }

    print("5. What is done about unrepresented expression values?");

    print("5.1 Using default case:");
    var unrepresented = 4;
    switch (unrepresented) {
    case 1:
        print("number is 1");
        break;
    case 2:
        print("number is 2");
        break;
    case 3:
        print("number is 3");
        break;
    default:
        print("default case executed");
    }


    print("5.2 No default case provided:");
    var A = EnumExample.A;
    switch (A) {
    case EnumExample.A:
        print("Enum value is A");
        break;
    case EnumExample.B:
        print("Enum value is B");
        break;
    // If default is not provided,  Error: The type 'EnumExample' is not exhaustively matched by the switch cases since it doesn't match 'EnumExample.C'.
    default:
        print("default case executed");
    }

    // non-exhaustive switches
    switch (unrepresented) {
    case 1:
        print("number is 1");
        break;
    case 2:
        print("number is 2");
        break;
    case 3:
        print("number is 3");
        break;
    }
}

// Enum declaration for Dart
enum EnumExample {
    A,
    B,
    C,
    D
}