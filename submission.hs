-- Define a data type of colour
data Colour = Black | White deriving (Eq, Show)
-- Define a data type of quadtree
data Quadtree = Leaf Colour | Node Quadtree Quadtree Quadtree Quadtree deriving (Eq, Show)

allBlack :: Int -> Quadtree
allBlack _ = Leaf Black -- Return a Black leaf. The input integer can be ignored
allWhite :: Int -> Quadtree
allWhite _ = Leaf White -- Return a White leaf. The input integer can be ignored

-- Put four inputs to form a clockwise order
clockwise :: Quadtree -> Quadtree -> Quadtree -> Quadtree -> Quadtree
clockwise a b c d = Node a b d c

anticlockwise :: Quadtree -> Quadtree -> Quadtree -> Quadtree -> Quadtree
-- Put four inputs to form a anticlockwise order
anticlockwise a b c d = Node a d b c


-- exercise 2

reverse_colour :: Colour -> Colour
reverse_colour Black = White
reverse_colour White = Black

-- a b
-- c d
striped :: Quadtree -> Bool
striped (Leaf a) = True
striped (Node a b c d) = a==b && c==d && striped a && striped c

-- More than half of neighbours are the different colour
--needReverse :: Colour -> [Colour] -> Bool
--needReverse x xs = (length (filter (/=x) xs)) > (length (xs)/ 2)

getColour :: Quadtree -> Colour
getColour (Leaf a) = a
getColour (Node a b c d) = error "getColour - should not input a Node"

-- Functions to get one side of a quadtree, put leaves into a list
getUp :: Quadtree -> [Colour]
getUp (Leaf a) = [a]
getUp (Node a b c d) = getUp a ++ getUp b

getDown :: Quadtree -> [Colour]
getDown (Leaf a) = [a]
getDown (Node a b c d) = getDown c ++ getDown d

getLeft :: Quadtree -> [Colour]
getLeft (Leaf a) = [a]
getLeft (Node a b c d) = getLeft a ++ getLeft c

getRight :: Quadtree -> [Colour]
getRight (Leaf a) = [a]
getRight (Node a b c d) = getRight b ++ getRight d


-- Function to get certain node of a quadtree
getA :: Quadtree -> Quadtree
getA (Leaf a) = Leaf a
getA (Node a b c d) = a

getB :: Quadtree -> Quadtree
getB (Leaf a) = Leaf a
getB (Node a b c d) = b

getC :: Quadtree -> Quadtree
getC (Leaf a) = Leaf a
getC (Node a b c d) = c

getD :: Quadtree -> Quadtree
getD (Leaf a) = Leaf a
getD (Node a b c d) = d

-- Function to get the depth of a quadtree
getDepth :: Quadtree -> Int
getDepth (Leaf a) = 0
getDepth (Node a b c d) = 1 + (getDepth a)


blur :: Quadtree -> Quadtree
blur (Leaf a) = Leaf a
blur (Node a b c d) = if striped (Node a b c d) then (Node a b c d) else (Node (blur a) (blur b) (blur c) (blur d))
