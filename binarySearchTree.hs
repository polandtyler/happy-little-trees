module BinarySearchTree where

import qualified Data.List as List

data  Tree a = Empty | Node (Tree a) a (Tree a) deriving Show


insert :: Ord a => Tree a -> a -> Tree a
insert Empty v = Node Empty v Empty
insert (Node t1 a t2) v
    | a == v = Node t1 v t2
    | a  < v = Node t1 v (insert t2 v)
    | a  > v = Node (insert t1 v) a t2
