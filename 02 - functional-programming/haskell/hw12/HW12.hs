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

-- === distance ===
import Debug.Trace

distance :: (Double, Double) -> (Double, Double) -> Double
distance (x1, y1) (x2, y2) = sqrt ((x1 - x2) ^ 2 + (y1 - y2) ^ 2)

-- === shift ===

shift :: [t] -> Int -> [t]
shift [] _ = []
shift lst 0 = lst
shift lst n =
  if n < 0
    then shift lst (n + length lst)
    else shift (last lst : init lst) (n - 1)

-- === myFilter ===

-- Please note that this function takes two arguments.
-- The first one is a function of type (t -> Bool)
-- The second one is a list of a generic type, t.
myFilter :: (t -> Bool) -> [t] -> [t]
myFilter _ [] = []
myFilter f (x : xs) =
  let rem = myFilter f xs
   in if f x then x : rem else rem

-- === crossover ===

crossover :: [Char] -> [Char] -> Int -> ([Char], [Char])
crossover a b 0 = (b, a)
crossover (afst : arst) (bfst : brst) n =
  let (a, b) = crossover arst brst (n - 1)
   in (afst : a, bfst : b)

-- === xSort ===

xSort :: [(String, Int, Int)] -> [(String, Int, Int)]
xSort [] = []
xSort [a] = [a]
xSort ((fn, fp, fg) : rst) =
  let left_ = filter (\(_, p, g) -> if p == fp then fg <= g else fp < p) rst
      right_ = filter (\(_, p, g) -> if p == fp then fg >= g else fp > p) rst
      left = xSort left_
      right = xSort right_
   in left ++ [(fn, fp, fg)] ++ right

-- === treeSum ===

data Tree = Tree Int Tree Tree | E deriving (Show)

treeSum :: Tree -> Int
treeSum E = 0
treeSum (Tree n c1 c2) = n + treeSum c1 + treeSum c2

-- === Test cases ===

main = do
  print "=== distance ==="
  print $ distance (10, 20) (5, 15) -- 7.0710678118654755
  print "=== shift ==="
  print $ shift [3, 5, 1, 4, 2] 3 -- [1,4,2,3,5]
  print $ shift [3, 5, 1, 4, 2] (-3) -- [4,2,3,5,1]
  print $ shift "helloworld" 75 -- "worldhello"
  print "=== myFilter ==="
  print $ myFilter (> 3) [1, 2, 3, 4, 5, 6, 7] -- [4,5,6,7]
  print $ myFilter (\x -> x * 2 < 5) [1, 2, 3, 4, 5, 6, 7] -- [1,2]
  print "=== crossover ==="
  print $ crossover "aaaaa" "bbbbb" 3 -- ("aaabb","bbbaa")
  print $ crossover "aaaaa" "bbbbb" 1 -- ("abbbb","baaaa")
  print $ crossover "aaaaa" "bbbbb" 4 -- ("aaaab","bbbba")
  print "=== qSort ==="
  print $ xSort [("Pumas", 10, 3), ("America", 10, 5), ("Chivas", 11, 8), ("Cruz Azul", 11, 2), ("Tigres", 9, 4), ("Rayados", 9, 6)] -- [("Chivas",11,8),("Cruz Azul",11,2),("America",10,5),("Pumas",10,3),("Rayados",9,6),("Tigres",9,4)]
  print "=== treeSum ==="
  print $ treeSum (Tree 8 (Tree 5 (Tree 2 E E) (Tree 7 E E)) (Tree 9 E E))