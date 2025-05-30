fn test() -> i32 {
    2
}

enum EnumExample {
    Ex1,
    Ex2,
}

fn main() {

    println!("1. What is the form and type of the control expression?");
    println!("1.1 Forms of control expression:");

    // variable
    let x = 2;
    match x {
        1 => println!("x is 1"),
        2 => println!("x is 2"),
        _ => println!("default case executed"),
    }

    // arithmetic expression
    let y = 3;
    match x + y {
        4 => println!("x + y is 4"),
        5 => println!("x + y is 5"),
        _ => println!("default case executed"),
    }

    // literal
    match "mustafa" {
        "mustafa" => println!("string is 'mustafa'"),
        "kemal" => println!("tring is 'kemal'"),
        _ => println!("default case executed"),
    }

    // function call
    match test() {
        1 => println!("func returned 1"),
        2 => println!("func returned 2"),
        _ => println!("default case executed"),
    }

    println!("1.2 Types of control expression:");

    // i32
    let int_value: i32 = 3;
    match int_value {
        1 => println!("int_value is 1"),
        3 => println!("int_value is 3"),
        _ => println!("default case executed"),
    }

    // string 
    let str_value = "mustafa";
    match str_value {
        "mustafa" => println!("string is 'mustafa'"),
        "kemal" => println!("string is 'kemal'"),
        _ => println!("default case executed"),
    }

    // character
    let char_value = 'A';
    match char_value {
        'A' => println!("char_value is 'A'"),
        'B' => println!("char_value is 'B'"),
        _ => (),
    }

    // Boolean type
    let bool_value = true;
    match bool_value {
        true => println!("bool_value is true"),
        false => println!("bool_value is false"),
    }

    // Tuple type
    let tuple_value = (1, "test");
    match tuple_value {
        (1, "test") => println!("tuple_value is (1, \"test\")"),
        (1, _) => println!("tuple_value's first element is 1, second element is something else"),
        (_, "test") => println!("tuple_value's first element is something else, second element is \"test\""),
        _ => println!("tuple_value is something else entirely"),
    }

    // Enum type 
    let direction = EnumExample::Ex1;
    match direction {
        EnumExample::Ex1 => println!("EnumExample is Ex1"),
        EnumExample::Ex2 => println!("EnumExample is Ex2"),
    }

    println!("\n2. How selectable segments are specified?");

    let value = 1;
    match value {
        1 => {
            println!("Case 1 executed");
            let local_var = "inside case 1";
            println!("Local variable: {}", local_var);
        },
        2 => { 
            println!("Case 2 executed");
        },
        _ => println!("Default case executed"),
    }

    let x = 2; 
    let result = match x { 
        1 => "one", 
        2 => { println!("matched two"); "two" }, 
        _ => "other",
    }; 
    println!("result: {}", result);

    println!("\n3. Is execution flow through the structure restricted to include just a single selectable segment?");

    let test_value = 1;
    println!("test_value = {}", test_value);

    let result = match test_value {
        1 => {
            println!("case 1 matched");
            // last expression is returned
            "value was 1"
        },
        2 => {
            println!("case 2 matched");
            "Value was 2"
        },
        1 => {
            println!("1 matched again");
            "Second case for 1"
        }, // warning: unreachable pattern
        _ => "Value was something else",
    };

    println!("result: {}", result);

    println!("\n4. How case values are specified?");

    // Literal patterns
    let name_case = "mustafa";
    match name_case {
        "mustafa" => println!("Name is 'mustafa'"),
        "kemal" => println!("Name is 'kemal'"),
        _ => println!("default case executed"),
    }

    // variables
    let variable = 3;
    let variable1 = 1;
    let variable2 = 3;
    match variable{
        variable1 => println!("variable is variable1"), // note: there is a binding of the same name; if you meant to pattern match against the value of that binding, that is a feature of constants that is not available for `let` bindings
        variable2 => println!("variable is variable2"),
        _ => println!("default case executed"),
    }

    // Range patterns
    let num = 7;
    match num {
        1..=5 => println!("num is between 1 and 5"),
        6..=10 => println!("num is between 6 and 10"),
        _ => println!("num is outside of ranges"),
    }

    // OR patterns
    let or_value = 2;
    match or_value {
        2|4|6 => println!("orValue is even"),
        1|3|5 => println!("orValue is odd"),
        _ => println!("default case executed"),
    }    
    // guard patterns
    let score = 85;
    match score {
        s if s > 0 => println!("s is positive"),
        s if s == 0 => println!("s is 0"),
        s if s < 0 => println!("s is negative"),
        _ => println!("default case"),
    }

    // patterns for tuples
    let point = (3, 4);
    match point {
        (0, 0) => println!("Origin"),
        (0, y) => println!("On y at y={}", y),
        (x, 0) => println!("On x at x={}", x),
        (x, y) => println!("Point at ({}, {})", x, y),

    }
    

    println!("\n5. What is done about unrepresented expression values?");
    
    let name = "mustafa";
    match name {
        "mustafa" => println!("name is mustafa"),
        "kemal" => println!("name is mustafa"),
        "atatürk" => println!("name is mustafa"),
        _ => println!("name is not mustafa kemal atatürk") // if does not exists, gives error:  non-exhaustive patterns: `&_` not covered
    }

    // enumarion example
    let enum_ex = EnumExample::Ex1;
    match enum_ex {
        EnumExample::Ex1 => println!("It is Ex1."),
        EnumExample::Ex2 => println!("It is Ex2."),
    }
    
}

