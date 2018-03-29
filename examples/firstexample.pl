likes(mary,food).
likes(mary,beer).
likes(mary,movies).
likes(john,wine).
likes(john,mary).

likes(bob,wine).
likes(bob,beer).


%should always be below the facts
likes(john,X) :- likes(mary,X).
likes(john,X) :- likes(X,beer).
likes(john,X) :- likes(X,X).

%likes(john,X).
