data Colour = Black | White deriving (Eq, Show)
data Direction = Clockwise | Anticlockwise deriving (Eq, Show)
data Quadtree = Leaf Colour | Node Quadtree Quadtree Quadtree Quadtree deriving (Eq, Show)

allBlack :: Int -> Quadtree
allBlack 0 = Leaf Black
allBlack n = Node (allBlack (n-1)) (allBlack (n-1)) (allBlack (n-1)) (allBlack (n-1))
allWhite :: Int -> Quadtree
allWhite 0 = Leaf White
allWhite n = Node (allWhite (n-1)) (allWhite (n-1)) (allWhite (n-1)) (allWhite (n-1))

clockwise :: Quadtree -> Quadtree -> Quadtree -> Quadtree -> Quadtree
clockwise (Leaf a) (Leaf b) (Leaf c) (Leaf d) = Node (Leaf d) (Leaf a) (Leaf b) (Leaf c)


anticlockwise :: Quadtree -> Quadtree -> Quadtree -> Quadtree -> Quadtree
anticlockwise (Leaf a) (Leaf b) (Leaf c) (Leaf d) = Node (Leaf b) (Leaf c) (Leaf d) (Leaf a)