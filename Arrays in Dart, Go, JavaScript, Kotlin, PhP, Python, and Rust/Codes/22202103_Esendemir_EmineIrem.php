<?php
echo "1. What types are legal for subscripts?\n";
$arr1 = array(1, 2, 3, 4, 5);
$arr2 = array("a" => 1, "b" => 2, "c" => 3);
$arr3 = array(1 => "a", 2 => "b", 3 => "c", -1 => "d", "" =>"e");
echo $arr1[0] . " integer subsript\n"; // Outputs: 1
echo $arr2["c"] . " string subscript\n\n"; // Outputs: 3
echo $arr3[2.5] . " float subscript\n\n"; // Outputs: b
// PHP Deprecated: Implicit conversion from float 2.5 to int loses precision
echo $arr1[true] . " true subscript\n"; // Outputs: 2
echo $arr1[false] . " false subscript\n"; // Outputs: 1
echo $arr3[null] . " null subscript\n"; // Outputs: e
// echo $arr1[-1] . " negative subscript\n"; // Warning: Undefined array key -1 in
echo $arr3[-1] . " negative subscript\n"; // Outputs: d

echo "2. Are subscripting expressions in element references range checked?\n";
$arr4 = array(1 => 11, 2 => 12, 1000 => 1010);
echo $arr4[1000] . " = arr1[1000]\n"; // Outputs: 1010
// echo $arr1[1001] . "arr1[1001]\n"; // Warning: Undefined array key 1001 in
// echo $arr1[999] . "$arr1[999]\n"; // Warning: Undefined array key 999 in

echo "3. Are ragged multidimensional arrays allowed?\n";
$arr5 = array(
    1 => array(1, 2, 3),
    2 => array(4, 5, 6),
    3 => array(7, 8, 9, 10)
);
print_r($arr5);
echo "\n";

echo "4. Can array objects be initialized?\n";
$arr6 = array(12,13,14,15);
$arr7 = array(1 => 12, 2 => 13, 3 => 14, 4 => 15);
$arr8 = [12, 13, 14, 15];
$arr9 = array_fill(2, 4, 6);
print_r($arr9);
echo "\n";
$arr10 = range(7, 10); // 7, 8, 9, 10
$arr11 = range("a", "e"); // a, b, c, d, e
$arr12 = range(1, 10, 2); // 1, 3, 5, 7, 9
$arr13 = array();
print_r($arr10);
echo "\n";
print_r($arr11);
echo "\n";
print_r($arr12);
echo "\n";
print_r($arr13);

echo "5. Are any kind of slices supported?\n";
$arr14 = array(11 => 1, 12 => 2, 13 => 3, 14 => 4, 15 => 5);
print_r(array_slice($arr14, 1, 3)); // Outputs: Array ( [0] => 2 [1] => 3 [2] => 4 )
print_r(array_slice($arr14, 1)); // Outputs: Array ( [0] => 2 [1] => 3 [2] => 4 [3] => 5 )
print_r(array_slice($arr14, 1, -1, true)); // Outputs: Array ( [12] => 2 [13] => 3 [14] => 4 )

echo "\n\n6. Which operators are provided?\n";
// == Returns true if $x and $y have the same key/value pairs
// === Returns true if $x and $y have the same key/value pairs in the same order and of the same types
$arr15 = [1, 2, 3];
$arr16 = [1, 2, 3];
$arr17 = ["1", "2", "3"];
$arr18 = [2 => 3, 1 => 2, 0 => 1];

var_dump($arr15 == $arr16); // bool(true) 
var_dump($arr15 == $arr17); // bool(true) 
var_dump($arr15 == $arr18); // bool(true) 
echo "\n";
var_dump($arr15 === $arr16); // bool(true)
var_dump($arr15 === $arr17); // bool(false)
var_dump($arr15 === $arr18); // bool(false)
echo "\n";


// < and >: Comparison operators
$compare1 = [1, 2, 3];
$compare2 = [1, 3, 1];
$compare3 = [1, 2, 3, 4];
var_dump($compare1 < $compare2); // bool(true) - First differing element: 2 < 3
var_dump($compare1 > $compare2); // bool(false)
var_dump($compare1 < $compare3); // bool(true) - All elements match but $arr3 has more elements
echo "\n";

// +: Union operator
$add1 = [1, 2, 3];
$add2 = [4, 5, 6];
$add3 = [2 => 12, 3 => 13, 4 => 14];
print_r($add1 + $add2); // Outputs: Array ( [0] => 1 [1] => 2 [2] => 3)
print_r($add1 + $add3); // Outputs: Array ( [0] => 1 [1] => 2 [2] => 3 [3] => 13 [4] => 14)
 


?>