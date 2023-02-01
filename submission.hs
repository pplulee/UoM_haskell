data Colour = Black | White deriving (Eq, Show)
data Quadtree = Leaf Colour | Node Quadtree Quadtree Quadtree Quadtree deriving (Eq, Show)

allBlack :: Int -> Quadtree
allBlack _ = Leaf Black
allWhite :: Int -> Quadtree
allWhite _ = Leaf White

clockwise :: Quadtree -> Quadtree -> Quadtree -> Quadtree -> Quadtree
clockwise a b c d = Node a b d c

anticlockwise :: Quadtree -> Quadtree -> Quadtree -> Quadtree -> Quadtree
anticlockwise a b c d = Node a d b c