module Num where

import Prelude hiding (succ, pred)


-- (1) Define a Haskell *data type* Nat for representing natural numbers.
data Nat = Zero | Succ Nat deriving (Eq, Show)

-- (2) Define one, two and three using Nat.
one = Succ Zero
two = Succ one
three = Succ two

-- (3)
succ :: Nat -> Nat
succ = Succ

pred :: Nat -> Nat
pred Zero = Zero
pred (Succ n) = n

-- (4) Define a *function* isZero that determines whether a number is 0. isZero has
-- the following type

isZero :: Nat -> Bool
isZero n = n == Zero

-- (5) Define a *function* add that adds two Nat numbers. add should have
--  the following type
add :: Nat -> Nat -> Nat
add Zero x = x
add (Succ x) y = Succ (add x y)

-- (6) Define a *function* equal
equal :: Nat -> Nat -> Bool
equal Zero Zero = True
equal (Succ x) (Succ y) = equal x y

-- (7) Define a *function* gt ('greater than')
gt :: Nat -> Nat -> Bool
gt (Succ x) Zero = True
gt (Succ x) (Succ y) = gt x y
gt _ _ = False

-- (8) Define a *function* mult :: Nat -> Nat -> Nat to multiply two Nat numbers.
--  You can, and should, reuse previously defined functions.
mult :: Nat -> Nat -> Nat
mult Zero _ = Zero
mult (Succ x) y = add y (mult x y)



data Digit = O | I
             deriving (Eq,Show)

data Bin = Single Digit
         | Comp   Digit Bin

instance Show Bin where
  show (Single d) = show d
  show (Comp d b) = show d ++ show b

b5 = Comp I (Comp O (Single I))
b6 = suc b5
b7 = suc b6

--(9) Define a *function* sucC :: Bin -> (Digit,Bin) that computes the successor
--    of a binary number plus a carry bit/digit. Note that the type (Digit,Bin)
--    contains all pairs whose first component is a Digit and whose second
--    component is a Bin. Tuples are constructed using the same notation.
--    E.g. (False,'a') is a tuple of type (Bool,Char).

sucC :: Bin -> (Digit, Bin)
sucC (Single O) = (O, Single I)
sucC (Single I) = (I, Single O)
sucC (Comp O b) = (O, Comp c b')
                where (c, b') = sucC b
sucC (Comp I b) = case sucC b of
                    (O, b') -> (O, Comp I b')
                    (I, b') -> (I, Comp O b')




--(10) Using sucC, define a *function* suc :: Bin -> Bin that  computes the
--     successor of a binary number.

suc :: Bin -> Bin
suc b = case sucC b of
            (O, b') -> Comp O b'
            (I, b') -> Comp I b'

