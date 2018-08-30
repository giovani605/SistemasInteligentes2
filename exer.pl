:- dynamic you_have/1, location/2.
## Versao do prolog 7.2.3

location(egg,duck_pen).
location(ducks,ducks_pen).
location(fox,woods).
location(you,house).

connect(duck_pen, yard).
connect(yard, house).
connect(yard, woods).

goto(X) :- write(" goto"), location(you,L),connect(L,X),
    retract(location(you, L)),
    assert(location(you,X)),
    write("You are in the "), write(X).
goto(X):-
    write("You cant go there").


fox :- location(ducks, yard),
    location(you ,house),
    write("The fox has taken a duck"), writeln("____").
fox.

go :- done.
go :- write("Entrada "),
read(X),
call(X),
fox,go.

done :- location(you, house),
    you_have(egg),
    write("Thanks for getting the egg." ), writeln("____").
