/*

You are given a table, BST, containing two columns: N and P, where N represents the value of a node in Binary Tree, and P is the parent of N.

Write a query to find the node type of Binary Tree ordered by the value of the node. Output one of the following for each node:

Root: If node is root node.
Leaf: If node is leaf node.
Inner: If node is neither root nor leaf node.

*/



select N, 'Root' from BST where P is null
union
select N, 'Leaf' from BST a where P is not null
and not exists (select 1 from BST b where a.N = b.P)
union
select N, 'Inner' from BST a where P is not null
and exists (select 1 from BST b where a.N = b.P)
order by N


#OR


SELECT N,
CASE
WHEN P is NULL THEN 'Root'
WHEN N in (SELECT P FROM BST) THEN 'Inner'
ELSE 'Leaf'
END
FROM BST
ORDER by N;
