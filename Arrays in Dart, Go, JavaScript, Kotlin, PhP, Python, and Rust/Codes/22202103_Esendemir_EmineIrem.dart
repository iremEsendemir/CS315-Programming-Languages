void main() {
    print("1. What types are legal for subscripts?");
    List<int> arr1 = [1, 2, 3, 4, 5];
    // Integer subscripts
    print(arr1[2]); // Outputs: 3
    // Variable subscripts
    int index = 3;
    print(arr1[index]); // Outputs: 4
    // String subscripts
    // print(arr1["1"]); // Error: A value of type 'String' can't be assigned to a variable of type 'int'.
    // Floating point subscripts
    // print(arr1[2.5]); // Error: A value of type 'double' can't be assigned to a variable of type 'int'.
    


    print("2. Are subscripting expressions in element references range checked?");
    // print(arr1[10]); // Error: RangeError (length): Invalid value: Not in inclusive range 0..4: 10
    // print(arr1[-1]); // Error: RangeError (length): Invalid value: Not in inclusive range 0..4: -1



    print("3. Are ragged multidimensional arrays allowed?");
    List<List<int>> raggedArray = [[1, 2, 3], [4, 5, 6, 7],[8, 9]];
    print(raggedArray); // Outputs: [[1, 2, 3], [4, 5, 6, 7], [8, 9]]

    print("4. Can array objects be initialized?");
    // The type (List<int>) is optional if it can be inferred. Dart supports type inference.
    List<int> arr2 = [1, 2, 3, 4, 5];
    print("arr2: $arr2"); // Outputs: arr2: [1, 2, 3, 4, 5]
    var numbers = [1, 2, 3];
    print("numbers: $numbers"); // Outputs: numbers: [1, 2, 3]
    List<int> empty = [];
    print("empty: $empty"); // Outputs: empty: []
    List<int> fixed = List.filled(5, 3); 
    print("fixed: $fixed"); // Outputs: fixed: [3, 3, 3, 3, 3]
    // fixed.add(4); // Error: Unsupported operation: Cannot add to a fixed-length list
    fixed[0] = 10; // This is allowed
    print("fixed after modification: $fixed"); // Outputs: fixed after modification: [10, 3, 3, 3, 3]
    // with a function
    List<int> squares = List.generate(5, (index) => index * index); // [0, 1, 4, 9, 16]
    print("squares: $squares"); // Outputs: squares: [0, 1, 4, 9, 16]
    // initializing a read only list
    final readOnly = List.unmodifiable([1, 2, 3]);
    // readOnly[0] = 10; // Error: Unsupported operation: Cannot modify an unmodifiable list
    // using spread operator
    var base = [1, 2, 3, 4];
    var combined = [0, ...base, 5]; // [0, 1, 2, 3, 4, 5]
    print("combined: $combined"); // Outputs: combined: [0, 1, 2, 3, 4, 5]
    // using null aware spread operator
    var nullableList = null;
    var combinedNullable = [0, ...?nullableList, 5]; // [0, 5]
    print("combinedNullable: $combinedNullable"); // Outputs: combinedNullable: [0, 5]
    // using collection if
    var condition1 = true;
    var condition2 = false;
    var listWithCondition = [0, if (condition1) 1, if (condition2) 2,]; 
    print("listWithCondition: $listWithCondition"); // Outputs: listWithCondition: [0, 1]
    // using collection for
    var listWithFor = [for (var i = 0; i < 10; i++) i]; 
    print("listWithFor: $listWithFor"); // Outputs: listWithFor: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]




    print("5. Are any kind of slices supported?");
    // sublist method
    List<int> arr3 = [1, 2, 3, 4, 5];
    List<int> slice = arr3.sublist(1, 3); 
    print("slice: $slice"); // Outputs: slice: [2, 3]
    // using the where method
    List<int> slice3 = arr3.where((element) => element > 1).toList();
    print("slice3: $slice3"); // Outputs: slice3: [2, 3, 4, 5]
    // removeWhere
    List<int> arr4 = [1, 2, 3, 4, 5];
    arr4.removeWhere((element) => element > 3);
    print("arr4 after removeWhere: $arr4"); // Outputs: arr4 after removeWhere: [1, 2, 3]
    // take method
    List<int> arr5 = [1, 2, 3, 4, 5];
    List<int> takeSlice = arr5.take(3).toList();
    print("takeSlice: $takeSlice"); // Outputs: takeSlice: [1, 2, 3]
    // skip method
    List<int> skipSlice = arr5.skip(2).toList();
    print("skipSlice: $skipSlice"); // Outputs: skipSlice: [3, 4, 5]

    print("6. Which operators are provided? ");
    List<int> list1 = [1, 2, 3, 4, 5];
    List<int> list2 = [6, 7, 8, 9, 10];
    List<int> list3 = [1, 2, 3, 4, 5];
    List<int> list4 = list2;
    List<int> concatenatedList = list1 + list2;
    List<int> spreadList = [0, ...list1, ...list2];
    print("concatenatedList: $concatenatedList"); // Outputs: concatenatedList: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    print("spreadList: $spreadList"); // Outputs: spreadList: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    print("list1 == list3: ${list1 == list3}"); // Outputs: list1 == list3: false, because they are different instances
    print("list1 != list3: ${list1 != list3}"); // Outputs: list1 == list3: true
    print("list2 == list4: ${list2 == list4}"); // Outputs: list1 == list4: true, because they are the same instance
    // print("list1 < list2: ${list1 < list2}"); // Error: The operator '<' isn't defined for the class 'List<int>'.






}
