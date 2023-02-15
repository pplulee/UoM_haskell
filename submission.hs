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

-- a b
-- c d

-- More than half of neighbours are the different colour
needReverse :: Colour -> [Colour] -> Bool
needReverse x [] = False
-- need to change colour if more than half of neighbours are the different colour
needReverse x xs = (length (filter (/=x) xs)) > ((length(xs)) `div` 2)

--striped :: Quadtree -> Bool
--striped (Leaf a) = True
--striped (Node a b c d) = a==b && c==d && striped a && striped c

data Neighbour = Empty | QuadtreeN Quadtree deriving (Eq, Show)
data Neighbours = Neighbours {up::Neighbour, down::Neighbour, left::Neighbour, right::Neighbour} deriving (Eq, Show)
data TreeList = LeafL Colour [Colour] | NodeL TreeList TreeList TreeList TreeList deriving (Eq, Show)

-- Functions to get one side of a quadtree, put leaves into a list
getUp :: Neighbour -> [Colour]
getUp Empty = []
getUp (QuadtreeN (Leaf a)) = [a]
getUp (QuadtreeN (Node a b c d)) = getUp (QuadtreeN a) ++ getUp (QuadtreeN b)

getDown :: Neighbour -> [Colour]
getDown Empty = []
getDown (QuadtreeN (Leaf a)) = [a]
getDown (QuadtreeN (Node a b c d)) = getDown (QuadtreeN c) ++ getDown (QuadtreeN d)

getLeft :: Neighbour -> [Colour]
getLeft Empty = []
getLeft (QuadtreeN (Leaf a)) = [a]
getLeft (QuadtreeN (Node a b c d)) = getLeft (QuadtreeN a) ++ getLeft (QuadtreeN c)

getRight :: Neighbour -> [Colour]
getRight Empty = []
getRight (QuadtreeN (Leaf a)) = [a]
getRight (QuadtreeN (Node a b c d)) = getRight (QuadtreeN b) ++ getRight (QuadtreeN d)

-- Function to get certain node of a quadtree
getA :: Neighbour -> Neighbour
getA Empty = Empty
getA (QuadtreeN (Leaf a)) = QuadtreeN (Leaf a)
getA (QuadtreeN (Node a b c d)) = QuadtreeN a

getB :: Neighbour -> Neighbour
getB Empty = Empty
getB (QuadtreeN (Leaf a)) = QuadtreeN (Leaf a)
getB (QuadtreeN (Node a b c d)) = QuadtreeN b

getC :: Neighbour -> Neighbour
getC Empty = Empty
getC (QuadtreeN (Leaf a)) = QuadtreeN (Leaf a)
getC (QuadtreeN (Node a b c d)) = QuadtreeN c

getD :: Neighbour -> Neighbour
getD Empty = Empty
getD (QuadtreeN (Leaf a)) = QuadtreeN (Leaf a)
getD (QuadtreeN (Node a b c d)) = QuadtreeN d


updateNeighbour :: TreeList -> Neighbours -> TreeList
updateNeighbour (LeafL a l) obj = LeafL a (getDown (up obj) ++ getUp (down obj) ++ getRight (left obj) ++ getLeft (right obj))
updateNeighbour (NodeL a b c d) obj = NodeL
  (updateNeighbour a (Neighbours{up = getC (up obj),down = Empty,left = getB (left obj),right = Empty}))
  (updateNeighbour b (Neighbours{up = getD (up obj),down = Empty,left = Empty,right = getA (right obj)}))
  (updateNeighbour c (Neighbours{up = Empty,down = getA (down obj),left = getD (left obj),right = Empty}))
  (updateNeighbour d (Neighbours{up = Empty,down = getB (down obj),left = Empty,right = getC (right obj)}))

computeNeighbours :: Quadtree -> TreeList
computeNeighbours (Leaf a) = LeafL a []
computeNeighbours (Node a b c d) = NodeL
  (updateNeighbour (computeNeighbours a) (Neighbours {up = Empty, down = QuadtreeN c, left = Empty, right = QuadtreeN b}))
  (updateNeighbour (computeNeighbours b) (Neighbours {up = Empty, down = QuadtreeN d, left = QuadtreeN a, right = Empty}))
  (updateNeighbour (computeNeighbours c) (Neighbours {up = QuadtreeN a, down = Empty, left = Empty, right = QuadtreeN d}))
  (updateNeighbour (computeNeighbours d) (Neighbours {up = QuadtreeN b, down = Empty, left = QuadtreeN c, right = Empty}))

detectEdges :: TreeList -> Quadtree
detectEdges (LeafL a l) = if needReverse a l then (if a==Black then Leaf White else Leaf Black) else Leaf a
detectEdges (NodeL a b c d) = Node (detectEdges a) (detectEdges b) (detectEdges c) (detectEdges d)

blur :: Quadtree -> Quadtree
blur (Leaf a) = Leaf a
blur (Node a b c d) = detectEdges (computeNeighbours (Node a b c d))

--str3b_i = let
--  c = clockwise
--  w = allWhite
--  b = allBlack in
--   (c(w 2)(w 2)(c(b 1)(b 1)(w 1)(w 1))(c(b 1)(b 1)(w 1)(w 1)))
