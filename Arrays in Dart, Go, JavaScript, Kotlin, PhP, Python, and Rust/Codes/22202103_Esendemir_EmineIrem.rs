fn main() {
    println!("1. What types are legal for subscripts?");
    let arr1 = [1, 2, 3, 4, 5];

    // Integer subscript
    println!("{}", arr1[2]); // Outputs: 3

    // Variable subscript
    let index = 3;
    println!("{}", arr1[index]); // Outputs: 4
    let index2 : u32 = 0; 
    // println !("{}" , arr1 [ index2 ]) ; // Compile time errorL error [ E0277 ]: the type ‘[{ integer }] ‘ cannot be indexed by ‘u32 ‘
    // String subscript
    // println!("{}", arr1[" 1 "]); // Error: the type `[{integer}]` cannot be indexed by `&str`
    // Float index - Not allowed
    // println!("{}", arr1[1.5]); // Error: the type `[{integer}]` cannot be indexed by `{float}`

    println!("\n2. Are subscripting expressions in element references range checked?");
    // println!("{}",arr1[10]); // Error: index out of bounds: the length is 5 but the index is 10
    // println!("{}",arr1[-1]); // Error: cannot use a negative integer for indexing on `[{integer}; 5]`

    println!("\n3. Are ragged multidimensional arrays allowed?");
    // let ragged = [[1, 2, 3], [4, 5], [6, 7, 8, 9]]; // Error: mismatched types
    let multidimensional = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]; // Legal multidimensional array
    println!("{:?}", multidimensional); // Outputs: [[1, 2, 3], [4, 5, 6], [7, 8, 9]]

    println!("\n4. Can array objects be initialized?");
    let explicit: [i32; 3] = [1, 2, 3]; // Explicit initialization
    println!("{:?}", explicit); // Outputs: [1, 2, 3]
    let arr1: [i32; 3] = [111; 3]; // immutable array
    println!("{:?}", arr1); // Outputs: [111, 111, 111]
    // arr1[1] = 20; //cannot assign to `arr1[_]`, as `arr1` is not declared as mutable
    let mut arr2: [i32; 3] = [0; 3]; // Mutable array
    arr2[0] = 10; // Assigning value to the first element
    
    println!("\n5. Are any kind of slices supported?");
    let testarr = [1, 2, 3, 4, 5];
    let slice1: &[i32] = &testarr[0..2]; 
    println!("{:?}", slice1); // Outputs: [1, 2]
    let slice2: &[i32] = &testarr[1..]; 
    println!("{:?}", slice2); // Outputs: [2, 3, 4, 5]
    let slice3: &[i32] = &testarr[..3]; 
    println!("{:?}", slice3); // Outputs: [1, 2, 3]
    
    println!("\n\n6. Which operators are provided?");
    let arr3 = [1, 2, 3];
    let arr4 = [4, 5, 6];
    let arr5 = [1, 2, 3];
    let arr6 = [1, 3, 1];
    let arr7 = [1, 2, 3, 4];
    // let arr5 = arr3 + arr4; // Error: the type `[{integer}; 3]` cannot be added to `[{integer}; 3]`
    // == operator
    println!("arr3 == arr4: {:?}", arr3 == arr4); // Outputs: false
    println!("arr3 == arr5: {:?}", arr3 == arr5); // Outputs: true
    // println!("arr3 == arr7: {:?}", arr3 == arr7); // Error: no implementation for `[{integer}; 3] == [{integer}; 4]`
    // === operator
    // println!("arr3 === arr5: {:?}", arr3 === arr5); // Error: no operator `===` found for type `[{integer}; 3]`
    // < operator
    println!("arr3 < arr4: {:?}", arr3 < arr4); // Outputs: true
    println!("arr3 < arr6: {:?}", arr3 < arr6); // Outputs: true
    // println!("arr3 < arr7: {:?}", arr3 < arr7); // expected an array with a size of 3, found one with a size of 4




}
