import numpy as np

print("1. What types are legal for subscripts?")
arr1 = np.array([1, 2, 3, 4, 5])

# Integer subscripts
print(arr1[2])  # Outputs: 3

# Variable subscripts
index = 3
print(arr1[index])  # Outputs: 4

# String subscripts, not valid in numpy arrays
# arr1['a']  # IndexError: only integers, slices (`:`), ellipsis (`...`), numpy.newaxis (`None`) and integer or boolean arrays are valid indices

# Negative subscripts, accessing elements from the end of the array
print(arr1[-1])  # Outputs: 5
print(arr1[-2])  # Outputs: 4

# float subscripts
# arr1[1.5]  # IndexError: only integers, slices (`:`), ellipsis (`...`), numpy.newaxis (`None`) and integer or boolean arrays are valid indices


print("2. Are subscripting expressions in element references range checked?")
# print(arr1[5])  # IndexError: index 5 is out of bounds for axis 0 with size 5
# print(arr1[-6])  # IndexError: index -6 is out of bounds for axis 0 with size 5
print(arr1[-2])  # Outputs: 4


print("3. Are ragged multidimensional arrays allowed?")
# NumPy arrays must be rectangular, but you can use object arrays
ragged = np.array([np.array([1, 2, 3]), np.array([4, 5]), np.array([6, 7, 8, 9])], dtype=object) 
print(ragged) # Outputs: [array([1, 2, 3]) array([4, 5]) array([6, 7, 8, 9])]
# ragged2 = np.array([[1, 2, 3], [4, 5], [6, 7, 8, 9]]) # ValueError: setting an array element with a sequence. The requested array has an inhomogeneous shape after 1 dimensions.

print("4. Can array objects be initialized?")
# zero initialization
arr2 = np.zeros(5)
print(arr2)  # Outputs: [0. 0. 0. 0. 0.]
# one initialization
arr3 = np.ones(5)
print(arr3)  # Outputs: [1. 1. 1. 1. 1.]
# empty initialization
arr4 = np.empty(5)
print(arr4)  # Outputs: values may vary, as they are uninitialized
# initialization with a specific value
arr5 = np.full(5, 7)
print(arr5)  # Outputs: [7 7 7 7 7]
# initialization with a range of values
arr6 = np.arange(5)
print(arr6)  # Outputs: [0 1 2 3 4]
# initialization with a range of values with a step
arr7 = np.arange(0, 10, 2)
print(arr7)  # Outputs: [0 2 4 6 8]
# random initialization
arr8 = np.random.rand(5)
print(arr8)  # Outputs: random values between 0 and 1
# explicit initialization
arr9 = np.array([1, 2, 3, 4, 5])
print(arr9)  # Outputs: [1 2 3 4 5]


print("5. Are any kind of slices supported?")

# Boolean subscripts, accessing elements at indices where given array is True
bool_subscript = np.array([True, False, True, True, True])
print(arr1[bool_subscript])  # Outputs: [1 3 4 5]

# Integer array subscripts, accessing elements at specified indices
int_subscript = np.array([0, 2, 4])
print(arr1[int_subscript])  # Outputs: [1 3 5]

test_array = np.array([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10])


# Basic slicing
print(test_array[2:5])  # Outputs: [2 3 4]
print(test_array[:2])  # Outputs: [0 1], from start, to specified end
print(test_array[2:])  # Outputs: [2 3 4 5 6 7 8 9 10], from specified start to the end

# with steps
print(test_array[::2])  # Outputs: [0 2 4 6 8 10]
print(test_array[1:8:2])  # Outputs: [1 3 5 7]

# with negative steps
print(test_array[::-1])  # Outputs: [10 9 8 7 6 5 4 3 2 1 0]
print(test_array[5:2:-1])  # Outputs: [5 4 3]

# with negative indices
print(test_array[-5:-2])  # Outputs: [5 6 7]
print(test_array[-2:-5])  # Outputs: []

# ellipsis
ragged_array = np.array([[1, 2, 3], [4, 5, 6], [7, 8, 9]])
print(ragged_array[..., 1])  # Outputs: [2]


print("6. Which operators are provided?")
arr10 = np.array([11, 22, 33])
arr11 = np.array([44, 55, 66])
arr12 = np.array([11, 22, 33])
arr13 = arr12
arr14 = np.array([11, 22, 33, 44, 55, 66])
print(f"arr10: {arr10}")
print(f"arr11: {arr11}")
print(f"arr12: {arr12}")
print(f"arr13: {arr13}")
print()


# Arithmetic operations
print(f"arr10 + arr11: {arr10 + arr11}")  # Outputs: [55 77 99]
print(f"arr10 - arr11: {arr10 - arr11}")  # Outputs: [-33 -33 -33]
print(f"arr10 * arr11: {arr10 * arr11}")  # Outputs: [484 1210 2178]
print(f"arr10 / arr11: {arr10 / arr11}")  # Outputs: [0.25 0.4  0.5 ]
print(f"arr10 // arr11: {arr10 // arr11}")  # Outputs: [0 0 0]
print(f"arr10 % arr11: {arr10 % arr11}")  # Outputs: [11 22 33]
print(f"arr10 ** arr11: {arr10 ** arr11}")  # Outputs: [8288407272263152657 4719772409484279808 5794255510723202113]
print(f"arr10 + 5: {arr10 + 5}")  # Outputs: [16 27 38]
#print(f"arr11 + arr14: {arr11 + arr14}")  # ValueError: operands could not be broadcast together with shapes (3,) (6,) 

print()

# Comparison operators
print(f"arr10 == arr11: {arr10 == arr11}")  # Outputs: [False False False]
print(f"arr10 != arr11: {arr10 != arr11}")  # Outputs: [ True  True  True]
print(f"arr10 < arr11: {arr10 < arr11}")    # Outputs: [ True  True  True]
print(f"arr10 <= arr11: {arr10 <= arr11}")  # Outputs: [ True  True  True]
print(f"arr10 > arr11: {arr10 > arr11}")    # Outputs: [False False False]
print(f"arr10 >= arr11: {arr10 >= arr11}")  # Outputs: [False False False]
print()

# Logical operators
print(f"arr10 & arr11: {arr10 & arr11}")  # Outputs: [0 0 0]
print(f"arr10 | arr11: {arr10 | arr11}")  # Outputs: [55 55 55]
print(f"~arr10: {~arr10}")  # Outputs: [-12 -23 -34]
print(f"arr10 ^ arr11: {arr10 ^ arr11}")  # Outputs: [55 55 55]
print(f"arr10 >> 3: {arr10 >> 3}")  # Outputs: [1 2 4]
print(f"arr10 << 3: {arr10 << 3}")  # Outputs: [88 176 264]
print()

# is operator
print(f"arr12 is arr10: {arr12 is arr10}")  # Outputs: False
print(f"arr12 is arr13: {arr12 is arr12}")  # Outputs: True
print()

# in operator
print(f"arr10 in arr11: {arr10 in arr11}")  # Outputs: False
print(f"arr10 in arr12: {arr10 in arr12}")  # Outputs: True
print(f"44 in arr11: {44 in arr11}")  # Outputs: True
print()

# Matrix multiplication
matrix1 = np.array([[1, 2], [3, 4]])
matrix2 = np.array([[9, 8], [7, 6]])
print(f"matrix1 @ matrix2: {matrix1 @ matrix2}") # Outputs: [[23 20] [55 48]]
print(f"arr10 @ arr11: {arr10 @ arr11}")  # Outputs: 3872
