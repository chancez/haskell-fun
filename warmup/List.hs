-- List.hs

-- list definition
data List = Empty | Cons Int List
            deriving Show

-- (11) Define a *value* that represents the list [1,2,3] and bind it to the
--      variable l.

l = Cons 1 (Cons 2 (Cons 3 Empty))

-- (12) Define a *function* rest :: List -> List that removes the first element
--      from a list.
rest :: List -> List
rest Empty = Empty
rest (Cons _ x) = x

--(13) Define a *function* member :: Int -> List -> Bool that determines
--     whether an integer is an element of a list.

member :: Int -> List -> Bool
member _ Empty = False
member term (Cons x xs) = if x == term
                          then True
                          else member term xs

main :: IO ()
main = do
    print l
    print $ rest l
    print $ member 2 l
