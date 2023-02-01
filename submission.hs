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

reverse_colour :: Colour -> Colour
reverse_colour Black = White
reverse_colour White = Black

data Direction = NE | NW | SE | SW deriving (Eq, Show)

-- a b
-- c d
striped :: Quadtree -> Bool
striped (Leaf a) = True
striped (Node a b c d) = a==b && c==d && striped a && striped c

blur :: Quadtree -> Quadtree
blur (Leaf a) = Leaf a
blur (Node a b c d) = if striped (Node a b c d) then (Node a b c d) else (Node (blur a) (blur b) (blur c) (blur d))