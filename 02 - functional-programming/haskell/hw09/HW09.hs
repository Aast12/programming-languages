-- ====================
-- Complete the following functions and submit your file to Canvas.
-- ====================
-- Do not change the names of the functions. 
-- Do not change the number of arguments in the functions.
-- If your file cannot be loaded by the Haskell compiler, your submission may be cancelled. 
-- Then, submit only code that works.
-- ====================
-- Grading instructions:
-- There is a series of test cases for each function. In order to state that your function
-- "works as described", your output must be similar to the expected one in each case.

-- === invert ===

invert :: [t] -> [t]
invert [] = []
invert (fst : rst) = (invert rst) ++ [fst]

-- === or ===

listor :: [Int] -> [Int] -> [Int]
listor [] [] = []
listor (afst: arst) (bfst: brst) = (min 1 (afst + bfst)) : (listor arst brst)

-- === multiples ===

multiples :: [Int] -> Int -> [Int]
multiples [] _ = []
multiples (fst : rst) m = if mod fst m == 0
    then fst : multiples rst m
    else multiples rst m

-- === differences ===

differencesAux :: [Int] -> [Int]
differencesAux [] = []
differencesAux [_] = []
differencesAux lst = differencesAux (init lst) ++ [abs (last lst - last (init lst))]
-- differencesAux lst = differencesAux (init lst) ++ [last (init rst)]

differences :: [Int] -> [Int]
differences [] = []
differences lst = differencesAux lst ++ [abs (last lst - head lst)]

-- === toBinaryString ===

toBinaryString :: Int -> [Char]
toBinaryString 1 = "1"
toBinaryString 0 = "0"
toBinaryString n = if mod n 2 == 0
    then toBinaryString (quot n 2) ++ "0"
    else toBinaryString (quot n 2) ++ "1"

-- === modulo ===

modulo :: Int -> Int -> Int
modulo 0 m = 0
modulo n m
    | n > m = modulo (n - m) m
    | n < m = n
    | otherwise = 0

-- === evaluate ===

evaluate :: [Double] -> Double -> Double
evaluate [] _ = 0
evaluate [a] x = a
evaluate lst x = x ^ (length lst - 1) * head lst + evaluate (tail lst) x

-- === cleanString ===

cleanString :: [Char] -> [Char]
cleanString [] = []
cleanString [ch] = [ch]
cleanString (fst : rst) = if fst == head rst
    then cleanString (rst)
    else [fst] ++ cleanString (rst)

-- === iSort ===

iSortPlace :: [Int] -> Int -> [Int]
iSortPlace [] b = [b]
iSortPlace [a] b = [min a b] ++ [max a b] 
iSortPlace lst b = if b < last lst
    then iSortPlace (init lst) b ++ [last lst]
    else lst ++ [b]

iSort :: [Int] -> [Int]
iSort [] = []
iSort [n] = [n]
iSort lst = iSortPlace (iSort (init lst)) (last lst)

-- === Test cases ===

main = do 
    print "=== invert ==="
    print $ invert ([] :: [Int])-- []
    print $ invert [1, 2, 3, 4, 5] -- [5,4,3,2,1]
    print $ invert "hello world!" -- "!dlrow olleh"
    print "=== listor ==="
    print $ listor [1, 1, 0] [0, 1, 0] -- [1,1,0]
    print $ listor [1, 0, 1, 0] [0, 0, 1, 1] -- [1,0,1,1]
    print $ listor [1, 0, 1, 0, 1] [1, 1, 1, 0, 0] -- [1,1,1,0,1]
    print "=== multiples ==="
    print $ multiples [2, 4, 5, 6] 2 -- [2,4,6]
    print $ multiples [9, 27, 8, 15, 4] 3 -- [9,27,15]
    print $ multiples [9, 8, 17, 5] 6 -- []
    print "=== differences ==="
    print $ differences [1, 2, 4, 8, 20] -- [1,2,4,12,19]
    print $ differences [5, 9, 13, 27, 100, 91, 4] -- [4,4,14,73,9,87,1]
    print $ differences [99] -- [0]
    print $ differences [] -- [] 
    print "=== toBinaryString ==="
    print $ toBinaryString 0 -- "0"
    print $ toBinaryString 1 -- "1"
    print $ toBinaryString 7 -- "111"
    print $ toBinaryString 32 -- "100000"
    print $ toBinaryString 1024 -- "10000000000"
    print "=== modulo ==="
    print $ modulo 10 2 -- 0
    print $ modulo 15 4 -- 3
    print $ modulo 20 9 -- 2
    print $ modulo 77 10 -- 7
    print "=== evaluate ==="
    print $ evaluate ([] :: [Double]) 100 -- 0.0
    print $ evaluate [2, 3.1, 10, 0] 2 -- 48.4
    print $ evaluate [10, 0] 2 -- 20.0
    print $ evaluate [1, 2, 3, 4, 5] 3 -- 179.0
    print "=== cleanString ==="
    print $ cleanString ([] :: String) -- ""
    print $ cleanString "yyzzza" -- "yza"
    print $ cleanString "aaaabbbccd" -- "abcd"
    print "=== iSort ==="
    print $ iSort [] -- []
    print $ iSort [1] -- [1]
    print $ iSort [1, 6, 3, 10, 2, 14] -- [1,2,3,6,10,14]