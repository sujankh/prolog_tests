question :-
    read_input(X, LastChar),
    sentence(X, LastChar),
    question.

%reads the input and gives the string as well as the last character
read_input(S, LastChar) :-
    read_line_to_codes(user_input, Input),    
    trim_last(Input, X, L),    
    char_code(LastChar, L),
    string_to_atom(X,IA),    
    atomic_list_concat(S,' ',IA).

%Remove the last symbol from the string list
trim_last([X], [], X).
trim_last([X|Xs], [X|Trimmed], Last) :-
        trim_last(Xs, Trimmed, Last), !; true.

%John is a man.
sentence([X, is, a, Y], '.') :-
    Term =.. [Y, X],
    assert(Term),
    write_ln('ok').

%A man is a person.
sentence(['A', X, is, a, Y], '.') :-
    Term1 =.. [Y, K],
    Term2 =.. [X, K],
    assert(Term1 :- Term2),
    write_ln('ok').

%Is John a person?
sentence(['Is', X, a, Y], '?') :-
    Term =.. [Y, X],
    (once(Term)-> write_ln('yes'); write_ln('unknown'));
    true.
